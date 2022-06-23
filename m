Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5370A557C9B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355003.582424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mbt-0002hE-Oi; Thu, 23 Jun 2022 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355003.582424; Thu, 23 Jun 2022 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mbt-0002fQ-KX; Thu, 23 Jun 2022 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 355003;
 Thu, 23 Jun 2022 13:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Mbs-0002fI-SW
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:11:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecaa2ec2-f2f5-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 15:10:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 13:10:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 13:10:57 +0000
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
X-Inumbo-ID: ecaa2ec2-f2f5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuA5kfUUCXfyToYuDvGmsQXA0Y7sD2xsUoTPKvzyrND8PtYmfgzloy/RnZlgbkRHT8OPMflufX7uSkDpm8OfmKPDMYtQDROEevPZrJPz7t5XmoSOxUKS2H0vglKyvr1720AxhMn57ewlea5JrHYp6Tf1Hqw/sfignL8RgRhHCLF0nOZX2beSCjVJJvDe/jokXuNn6kKukoE7i6+96E4YcEE5+IXrOuCFbIzC2QYOL5HvlaiHXGTqRkA7kDBMHKh3MZOeRCJeNhrhqR6teEDBt8ZIl6wX6DD7JQQPrlOl2M0QKqTXXa7OHUMTH3FU/O9Xa3nr15atTi4gPdqcfMhyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ciq/mpICNyOEXmFvjm4x0WcGyDt0FHAi/Cs6ANCUgNE=;
 b=MviDKhFSNMV44Eb4/8YlQLWbQ1KbSyRyUUROLdZYPNw1syChqc3hW16RNrBcnQ6sYy6phnUBtV02xIMFkyQZjpNwc6/qBvcaO8lfE/vWugScOUOMT6AImtxNhDEPvnVtpaN44Hg6kgYSFtmPEjmIy30zM1NXlGqJoUvxqichHIA/WuCx2B5Xxxyv4Bj7BAWjjiXqZwu8BdIFl9/CvCWjboOBVXLJr4r0TnmOj8CHhlGTaCWXEey+y95UaLkgR3tFoRJO65lL8oy2WfQwSgyX4l8ntwJSNLlj3in7TAXOsimlsFevQL8t/DbF9krM0D9b6qEkp/t3A/Q7KXl4wmD4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ciq/mpICNyOEXmFvjm4x0WcGyDt0FHAi/Cs6ANCUgNE=;
 b=cMPPSoRtUGs3Rk1BGchjUYtLGBdtOmuoDtnJwkI+uGzLLQlOnGapnolzGhDO/PEO0siRuEELZcKXqsPB5OCOniiZy2ZMiwHVHQGR7JRTKVCFKPp1/NKgjPyBN7mV+tMSeAiXl1u7Bw6Xh3T5Vph+KDJQ2Goxawo5h4mGOohtA1ngjyZsLDeccWvryKgg+ajvcB50DQ1c62UPDQ9EimLptODiz1+Gmf/G+zZF5zW3zaPf9eRbD34hFensXF8RnL1Pcj8dnQ60zFDSaGRaCRSgVsDxqJXeKLBYNttaqhKvU6TdmD+Z7tIABsJVtyMxxK77UsE9g8a1HPBzyETddKQ6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f241ed2-41ff-c0cf-0aad-ad52440305bb@suse.com>
Date: Thu, 23 Jun 2022 15:10:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20220623112407.13604-1-julien@xen.org>
 <d0de3b7b-fdb4-716c-227d-5fee024d8fd9@suse.com>
 <de0ae18f-b0b7-c63c-ed03-d0260dfc4c1d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de0ae18f-b0b7-c63c-ed03-d0260dfc4c1d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04253c5e-2bdc-4285-7610-08da5519cf5d
X-MS-TrafficTypeDiagnostic: AM8PR04MB7396:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7396E6D80835EF469A9B54C3B3B59@AM8PR04MB7396.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oo6cMXOo+Lo2rf/KAJb7fWsr0ryBkjyVz4WVYrHL7Dl7FSWtlS1DcmV/46j7A0cBX6wMTBCNGA9X80ZBnnOiJNWFXhvmYOyacbDhHRhe6oc+NfhBsdIuirmeuE34nOzeGWqU3BTpmam07yRcXbVCzd2AyR2hadoMwdodAUyyR9PVLcX2Vxy1rlYlM3rIb5yRGCkmZHqAO0A8ZL7SbOHBddbD/r4lrwWNBg/i61wWt8BXWabunucW/TURd7q/clsyS8Fvy9VHo20IaYhVYzraTIV6T6gGc/XpCCTuiJToOedEQ5kNaV6NtwfNVQ5YRnUa8Unk4kq9/l3xuZiArBhmDudm5s3RJ3aSZlLy9dMfHXFqQQC+bVrvGrWKMngGQ3bQ2R9WbccD982Y7Mk+H7HVnOGtfkomHZ8mjOCb/oxbemZ8o3SKsL/Nf1fp2rE0FwShvEe/3A+bvoLqcGu1D7ofKeQIs3cv85pAb+JtE/7mSj2pg/AthuPL2VJU94rHcKL/OxxonfR67S/stLLytgzDPFqK41zF1STaNhcgEem6xAp42qWU6423jNkHF0wMhmzcGF5I7t1MQgnIo3nmmPuMk1Ux7Jt+2fCeFYDvIy2JxHq2LLmETjbhXDctJDooufDvAt3G1p7xPVPZYacUt+Bzu9Xn+qzUOL4mJH/yf159x6qEwooCUHwP0awwj/oja2a2rhBDPqA5Eb8Reu90Wj0TJs4wQJiZ6HtIvhyprgO2E3xTb3pnQP32ujvn4ZfODXb8LpSFE5OrLPCxs9BForKrTVttba9lcnwCjKAGxq8X1Us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(376002)(136003)(39860400002)(38100700002)(86362001)(4326008)(31696002)(83380400001)(8936002)(5660300002)(8676002)(26005)(66556008)(2906002)(66946007)(66476007)(2616005)(107886003)(6916009)(186003)(316002)(6506007)(31686004)(6512007)(478600001)(6486002)(54906003)(41300700001)(53546011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGs1eDg5ODJxdDYvMm5Yb2VxMndKUFZkM3BDcUN3TXZXcTh2a2Z4bFZudTY1?=
 =?utf-8?B?SkJjVWpvNjlXbTEwRkpwYlNyN010SHBqRFhtUXdZUm9nYUQ1ZWpYNmZqMEti?=
 =?utf-8?B?WU8xdURsMnA2QXdVQ2ltZU4zeEFkSzJidlBTYTJCTloxNElsYlRhdVg0R3dM?=
 =?utf-8?B?VUhOdU5KcGc3U1BGZS95K3IyWWJpdG1INURUcDh2RVNuaGIxejNCRWVZcVpW?=
 =?utf-8?B?OUludXNac25lVFVyMWdJZ2twcUVTWVZCdU56KzdPMjcwZGdXZmlKQk45VWE1?=
 =?utf-8?B?VkJnWUIrei9zTHFQQzVrUURrdy9wdGZ2QVFJVmg0azdTSnFiYzJiZWw2aGto?=
 =?utf-8?B?MUtCd05aZU1qWW5JZWtra2RBUDBFTEZyK2pMbnN3OEcxNzQ3dTlDb01nS3B4?=
 =?utf-8?B?VEY1bkZ3MThxeER2QTRHY1ljYlFBK2JrZGxEWHNBbDJ2MXZyVENLL2UxMHZ6?=
 =?utf-8?B?RXROZUpsWWFkUS9IeVlSMW9tNkZCTDVqOVhjNmdsZVVBUjJackZjUzM3NGxQ?=
 =?utf-8?B?ZGhOTTBWck92a3d3dUxlUHhJSm5peWpTRWd5aThUVnpXdlpUUHRPb3pqVXdT?=
 =?utf-8?B?VEp4VTZvem1tdDlHUllzeVpsVkNsdXJ1Tm4wRXl0UFVkQnI2S01jSGRyUWZh?=
 =?utf-8?B?VUxxSWlkY09IVVRiRDRrU01jL0sxQTdESzBFYWdOVlcrWkVFRlpoVXlZTU9X?=
 =?utf-8?B?ZE1GdFgxKzJPZE1kUXE5aHFNc1M1VWNrNURyNkpYVVlsNTUvSVF2K3AzYjRZ?=
 =?utf-8?B?WnptRjEzWHFGRGMzUC8xSW02d2dKZGVCMkFxZDVsdVhsQnVlMUtmUGk3Si91?=
 =?utf-8?B?Y1VTVDJDTjVQcTBhOGNRanZQdjM0RDJjeDl5b0dWSWdmVlV4MjJUVjJvMDNJ?=
 =?utf-8?B?VUxWdWxzbGdvZFhPNDVDSHBTbk5YNEkxSFRSa3dRRlZPb1hpa2FsVTVGSFYv?=
 =?utf-8?B?eHJucVNGQldtL3NHSjYzeEtMNkx6eW1sRWQ5RkxBZmdDWFkyQnFjTGE3MURV?=
 =?utf-8?B?TWJSRllET2g0TlJ0YXAwS3pwN2dKUDVMTzlpMmhtTmJITlFPcml6YWJCTWF5?=
 =?utf-8?B?RjUwaFgrYjAvSkUzajZTQzAxUUI2c0FPYVc1QjVFRDBScnB0Y29vVkFLWUFs?=
 =?utf-8?B?NWVGVTZZOVQ4aWl6bGdSUEhBOHBMSWdRU2JIMXlSd1dDQ2llM1N0WTBzeWhz?=
 =?utf-8?B?T1dCYjhPdjQ0U1g2ajc3MW1SK1lZdXFnV0RkMTU5ZmxNanlXb1dMYzhwTTY3?=
 =?utf-8?B?VVd5YmRsN0thNjN5N0F0ZFpjbS9EOXJpRXdvREs4aHVWaEw0NG1ScWdqS3dD?=
 =?utf-8?B?OGNucEkxK0lFUitER3FhOVNBVDI3UEdsZS9yaTQzR29GYVBPaFpKcDhjVFVU?=
 =?utf-8?B?QWthUmVmQ1BmMGxsSkwyZXFIcU5mT3YxZzJQZDZjYVJEVFpIT09vSS84eldk?=
 =?utf-8?B?TU9JTEowa0Rrc2tjNm40U2phM3lVWkhrZVpHRldtTkt4NG8zOEpXVU5LMjdy?=
 =?utf-8?B?aG1HY1NVVmNVcmpraGlrRmltSzA0VW15OFlENUZHR1BwT0lCUHhCbm1RZXVO?=
 =?utf-8?B?T2xUR1RLVFNIc3k1NUlqNWRtZ09GUFd6WEVDNzI2Wk13bHNERnE1ci9Bb2Mx?=
 =?utf-8?B?RDRSSmU4UjBYWGswN0lVdDk2TE05MGpwRmR1b0x4R1FTaW9peUpNMmJIOFZ1?=
 =?utf-8?B?RWFnNVFSekN4WWxINngvYjRUcEZtZ0srVmc3WSswOEhjZVJFa0hVajZBYlY2?=
 =?utf-8?B?aWRPMmRKUHZWekpsclUxT1ZDVVl3eTR1QzhsRGpSUFE0R3F5WFFuc01ZR3JY?=
 =?utf-8?B?RUpQQjVsM2txZTBLMk9ic2NwaHFYd3hvL3BWQjJydEIvaVhFaVZ0ZFkvdmpt?=
 =?utf-8?B?S2NiTFlyd3Axa1lUZjNRUGJ6d1k5VHoxMDJxTGY5MTNJMVJJUVpiQm5VcjVJ?=
 =?utf-8?B?MitLZmhvQjFETjU0RlBKNk8rY05TK2V0NTdNQlVhanNIVG54b0xrZC9YUGhl?=
 =?utf-8?B?b0JQYjZPT1BLSkhWQzk3WG1pVjZ3Y1RyVTNsWjlwd3Uyd1V6ai9oenZMSmZK?=
 =?utf-8?B?VFE3NUJCK1RTc29HSkRkNWNySDkzVHVJNWVod3hpNW9jZWtqUllvQXp2QTJL?=
 =?utf-8?Q?JWq2dna5xt6KO2bl6QHOP28xu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04253c5e-2bdc-4285-7610-08da5519cf5d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 13:10:56.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTwxE6hOEGkULZ49MPb/J3vLnba1zoWQ8COY62P3JMXxYIQazamK+ID4Ecloy9qw60lE80Vcc30OTQOVoYTJqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 23.06.2022 15:03, Julien Grall wrote:
> 
> 
> On 23/06/2022 13:59, Jan Beulich wrote:
>> On 23.06.2022 13:24, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, corrupt() is neither checking for allocation failure
>>> nor freeing the allocated memory.
>>>
>>> Harden the code by printing ENOMEM if the allocation failed and
>>> free 'str' after the last use.
>>>
>>> This is not considered to be a security issue because corrupt() should
>>> only be called when Xenstored thinks the database is corrupted. Note
>>> that the trigger (i.e. a guest reliably provoking the call) would be
>>> a security issue.
>>>
>>> Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic ability to recover from store")
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Is this something which would want queuing for backport?
> 
> I would say yes. There are a couple of more Xenstored patches I would 
> consider for backporting:
> 
> fe9be76d880b tools/xenstore: fix error handling of check_store()
> b977929d3646 tools/xenstore: fix hashtable_expand() zeroing new area
> 
> Who is taking care of tools backport nowadays?

I'm trying to, as long as they apply cleanly enough. But I'd prefer if
rather sooner then later I could offload this again. And I'm not
actively looking to spot backporting candidates there (unlike for the
hypervisor, excluding Arm).

Jan

