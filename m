Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB858A90C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380961.615429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu21-0001b5-NR; Fri, 05 Aug 2022 09:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380961.615429; Fri, 05 Aug 2022 09:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu21-0001ZJ-KB; Fri, 05 Aug 2022 09:54:13 +0000
Received: by outflank-mailman (input) for mailman id 380961;
 Fri, 05 Aug 2022 09:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJu20-0001ZD-Di
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:54:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150084.outbound.protection.outlook.com [40.107.15.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dafd643-14a4-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 11:54:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 09:54:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 09:54:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8dafd643-14a4-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMGVRymkrfxwSS0pVaEyppXZmz7+X2BedycRW4mpAQcaKBDvfoJfDsHZm7bPkDQDYDO9O7cOjrj+AnZ5NURrRqErliYwCTQktWI8bLExR+yH6RFjBaENokPLqApxKUElELFlKfQLiJiFRy82MRL4mFrOkN4wf4zaP0E8BcqOcSQKcFivjFPlO+CQ9WA5MAI8d2jQjEvIJmN9frXldcXyoG+9uzu0K9amEZnJMObdp6BQU4tOADS2L0nYNX+xGt1ov3pDgph76br1wr2EI0MUD/n1yp23o4gXChICn+K3HKP3+jw0IERzSmPOZJyZyjhadQb/ni/fso6A6MM9Hjhqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGqsSwqv9QHIwgjwqqQ6GoZ1T/TSyIoK4Ng2iDuMqxc=;
 b=ldpHcLWbFtwwfKiM3M1ipf//3pYBvFMU1+JL1lHDRmm6Zkdxq0UZKiBevScGcCJnoPsVZY7Ia0XBnidnSuTt5xzCB4zm4A9JWHiRRW0yqjGqCR7TQhPEp176y4njMM93Lih3CtfanZmVgWCFrIVKozqHeonOL3NMy6UnWjCs6DE037OWszc9fZsqLv2D6LeazF5boFKTDBSwnLagzYmEdO0mq7wl8IiHLu1lFX4yQ/zMFas14mxFrtPdWxT6N/i6dFH+Elp4FQomki8PGVgVKHTxHqMOriLGuGmcoyK9WR9go/q3IJ/bzzpyjnui/JoPVZ6yCKScItMWOdfUQnISiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGqsSwqv9QHIwgjwqqQ6GoZ1T/TSyIoK4Ng2iDuMqxc=;
 b=ft72XHSEcLSAY/8VO3fh6xx+/Lh+nAsnc9Wnuzxwrm5hHoty14So/oOesXD6D6p3sw0QKRzsPVAkjhmPor54CsVhflg5Fe8+dVda1Kk3Dmh3/VNWY7CsnxueqvcfmAwIVR7ZP+CHLH7S9F2I05I8cpzg4G/TcEmdCkAuKVLNv46847usLzMrbrHqkZlcX5pm5LrPLjWwk+x8DLlHzGoqc6StyRp4Vpx2SENwB4rhz9M7ztOr9DHMf/RdUX52odx4BMejfVzIvVBs3Crp35uzLj1zE6H65PJM0Ncdj8ICHhnIV2PKQq3hCcXNhW7Bg16voObKTR/nRWqkyR/lQpL/Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bec18d21-5823-0108-e257-8e4732c6d1fc@suse.com>
Date: Fri, 5 Aug 2022 11:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <04256d0a-79a1-56f4-d092-de78f629c7f6@suse.com> <YuzoIAh+scGcDY1R@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YuzoIAh+scGcDY1R@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0101CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d891722-61c4-4ed5-985d-08da76c870e8
X-MS-TrafficTypeDiagnostic: AM9PR04MB8422:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsST+M0qi13Wn96D2wOqGoLMJUsxSghoRVR8a0yZfL7dUTUdjST1TotJ//NaJnc0YS/LDhQ7enpRXW/E73ZJxG/nTFkLThUvmLy6wb+d+IGm+dQJH7RebegfCFjKgH8ogEVycLjvSOBXEzBjsaIgK5SgcaiT4B5kF811km6co6UdBsjo+g43rXyivNBvBr2J2SMSn/eupqHeLTFwTKDsAUBLC7AZO/5yBw5Ew8d9wGdbAbRfJy1kIto7j3fInRIM54/ECheqJrv4CJL57vQuPmhNmiUyfHM6LqaO0AtaIQeMAGQlixwlHAjpU0CBUf9MhyhRpR0GiCxDYqjqOTh8xrMne2jahpzajBM8bv5YRj9iorNrqnV9Cxvw/Hkd+bqi97eQK0O3jtm6E4YcZ/jeRvSboNReWYwB4xBe768TemVLngqk85pts1jzU+5NO3kYPGCKY8CwkI8MYyoK40Iz0n942xuP5JsHaHh909VyWmKCMUo1LOZ0pzE6x+pIqT0A0E5zceqZ5mph71PIEq16CEKaO93tSQAp1E7foM3H9JcOcMh6TvF+2mfeFr1iNE30zzaICw/S3cxpOyylDZQyzsUXvoW+QtJ/++mDHZdtDSFsTljSx4VMY5Zq6tpzGML+cjna6/JPZzwLFGF2BR3V/dxOErYgTEOm+Tw8QVk/d5n9TTTwqIc+d7phsv4Rj3rw1cAmEA6iQWroeH4zo+rnsPMHx1xsjQKb0VPNmArkVNsxzKavrjJMkl8zLqieVj5hSlkh/7lf5GGHJHTNQWRIRENoEFJZJfJWka4FXQhCDhErM/UibctdT3sOXASt80vPetZuiwMd15diip29Sa435g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(366004)(136003)(376002)(86362001)(31696002)(36756003)(31686004)(66946007)(66556008)(38100700002)(2616005)(186003)(6512007)(26005)(53546011)(41300700001)(6506007)(4326008)(8676002)(478600001)(5660300002)(66476007)(54906003)(6916009)(316002)(2906002)(8936002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkhQZXFndzBORThiR3dxdktMM3d3bU52WElFRnFDV1d5N0R4bGx3SjJ3Y2F0?=
 =?utf-8?B?ajc0bVJWcWpGT3hpMTVHOWRoRHE0YW5CWkUrK2k4SkhmbW52THJEY2JmS1lm?=
 =?utf-8?B?bTNmRGNDZlZISmp1Qlc0NmFkL0VXUjE4T1NJWWdVbWs1aWVzdGhiN0ROSFBp?=
 =?utf-8?B?bCtSeEUxUUN6MVo1bUE5YlpwMEVMZ2twalpmMVRIdUNtenZlMmE1MmFCVWZD?=
 =?utf-8?B?Y1oxTTNLb2hPYmRBQ2hFd1VWMG1MMytrSzBweWRkWURob2dKUEFGbnEreU5y?=
 =?utf-8?B?MERJWUZYK0tKR3ArdzJxeFhWSGdENHRqc2czQU5IMVBIUmdwakxiQTRkaDFL?=
 =?utf-8?B?VFNvVEpOeWg2clF3bXJoL2hsb3JLMTBZcFhGUHZuc3YvVlFwQTVtLzhHL21v?=
 =?utf-8?B?VWM0dmw2Y2cxYTA3TEY1T2VZS0tXL1V0Zk9hK1RGSEYvREZ3WEEwMVp1SGVS?=
 =?utf-8?B?ZFdaaS84c3cvN0F1R0VkQjRUaWFZYTd2MVp3L2tkejIvNGYvTzdBSlduNCtH?=
 =?utf-8?B?MzYyYXo3MVZWR2V6eXEwUXZjbnZwNHVuSGYvQzdnZU5NWFNJaTNDRlpZWWxS?=
 =?utf-8?B?eXRqOVdXaElLTGR6RmsvRlgxWHgxblpsSExsQThRQ2lhZ0FpdC9OdzBrS0J5?=
 =?utf-8?B?VjBCSUpLeFpjYm9iTEh1UEpKWk5oSXNqVGNKKy8ybjhCc1pzNWFNdmo4MW9E?=
 =?utf-8?B?d2RRQ0dsOEV6Nlh3ZnhQMTRUdmtXaS90a1hiTVpGdkFNNldDSEwvMkFWTUIr?=
 =?utf-8?B?ZDdXbHlsQldHWXJlUG5xbjJRWXlwQklBQ1dsQTEvKzRuU0Mzb0s3SzBuQUFI?=
 =?utf-8?B?RE81ODAyakZmdWlqaC9mY3dacG40MmgzR0U4aVl3M04zL2doVzYxYWtsQWRK?=
 =?utf-8?B?VkxJSXdZU0RJenhWT1BJTFFLMjBZdkplNEpuSC9pWmdkS1FlcDdMTUx5Yitk?=
 =?utf-8?B?VzZveWRPelVuTnRMSVBFTUtXb1F0K0lqTFhPOFEwM1pLbDdVMHF1cjZlRndI?=
 =?utf-8?B?UlczZkZEYWUyWFYyTyt6NnZkV1BFQjJlSkpKaXJ1RzEyeDl6em9GaS82NzNM?=
 =?utf-8?B?UGEyb3RVWVY2a1pDNGxndDhaTk5KZFdWN215VnI2ZzZObXNGT20zV2w4eFNM?=
 =?utf-8?B?ajBNRFRhMlVueERtM1pET1EzSDJmY2FmcFJwL2tDdmwvOUk2cWhBR0JENTVz?=
 =?utf-8?B?SFhOUEYyOElYSXYxQzNaTDYyWEtIdTBEUkw5MVZCWHFtdmROWlp0QW1JYmk4?=
 =?utf-8?B?d2R4QmdMd0pYUEJFUVV4RDd1TDRJQTd4RXRSN09FM0VLY0VRWkFHdHZ2L3Mz?=
 =?utf-8?B?RTNGb0lKa1VxaEJLQWMxQ1I4Y0xjaVJyZHR1YjJwKzdpMTN4WnNlQm5oNFcr?=
 =?utf-8?B?OUQ0NWNkL016ZEFoT0w1R2NWNnF0ZTlZRkwzWHhGTXNDamk0WGFlL3hKOFFu?=
 =?utf-8?B?bVhQcHRwb0NZdWV0L20zRHNJUFlualpZL21QRnBHV2I3YnFzM2dnQm1sdnNq?=
 =?utf-8?B?eUF1TVNUMVQyaWNrUk1xUnMzZWlBZzgxbnZXbjR1dHhFU0VzWlovb2pmQ2tu?=
 =?utf-8?B?amtBWEQ5bWU3bVdQSWpVNUU4RjNPOUJMSnlPckRzQW9ZTndxYzBMalZJbHNX?=
 =?utf-8?B?dW1IaTBVeVlKd1MxdTdLMHhjQm9mRW1wMW1GbDliRDJRUU1tOEtySFBUZUJa?=
 =?utf-8?B?WllQY3duYzE0TTl5dE00djhKbjJHN29yY2VpUi9OUERONTFjMFRnVC9lRTdC?=
 =?utf-8?B?cVFKVGZiSm1jalQ1OG5MQXBzMkRIZDFRcFl5MFRPdWpoM0RnTStZN2N4VXFL?=
 =?utf-8?B?andGVHZzdzROeDIyUzBuNmM2Y1hMa3hWckpIb1ZWMkZxYmEyRzRrcTdIZHF6?=
 =?utf-8?B?cUtRSjc3ZkRMWnIySk1keVptTEh3dHIzb3FEaUN4SWkrQ0lLVlFFbWVpbUF4?=
 =?utf-8?B?QVl6Q2EyRWZNWURDV1ZENUJkVnRiTVRZSXFTMVJIdlZvWnBMKzU2bmtpK2NW?=
 =?utf-8?B?YXBmdnhNbkwreWJkU01QRTdYNEVoc1F1MHI5eU1IRzgrRDl5TGFDTjhXV1NM?=
 =?utf-8?B?WmRKK3NEMXJIelNQTGpBbU9HZ3RiS2dKSnVQTGVUY29ZV2l6N0hjdSsxT2tH?=
 =?utf-8?Q?DQLIBXpaEzgl0Lmx8fXY/fvI+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d891722-61c4-4ed5-985d-08da76c870e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 09:54:08.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgbnu5vui6eA5hTBUcdI1gSr99kVGGRa5v3Yb8JbLNxal1SCTAvfKmqNr0bOIpOB3Uh+d3OPP6ansVtHHdAI/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

On 05.08.2022 11:51, Marek Marczykowski-Górecki wrote:
> On Fri, Aug 05, 2022 at 09:23:32AM +0200, Jan Beulich wrote:
>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>> +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
>>> +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
>>> +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
>>> +static struct xhci_erst_segment erst __aligned(64);
>>> +static struct xhci_dbc_ctx ctx __aligned(64);
>>> +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
>>
>> I've been trying to identify the reason for the alignment here,
>> compared to the other buffers which are no longer page-aligned. I
>> haven't even been able to locate the place where the address of
>> this buffer is actually written to hardware; all I could find was
>> the respective virt_to_maddr(). Could you please point me at that?
> 
> It's dbc_flush() -> dbc_push_trb().
> And indeed, I think I can drop the alignment when it's moved into
> structure dedicated for DMA-accessible buffers.

Why would you be able to drop the alignment then, but not here?

Jan

