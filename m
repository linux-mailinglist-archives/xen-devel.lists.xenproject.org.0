Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD2588BD9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379888.613749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDJ5-0000AZ-UX; Wed, 03 Aug 2022 12:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379888.613749; Wed, 03 Aug 2022 12:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDJ5-00007j-R8; Wed, 03 Aug 2022 12:16:59 +0000
Received: by outflank-mailman (input) for mailman id 379888;
 Wed, 03 Aug 2022 12:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJDJ3-00007Z-TU
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:16:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab9e78c-1326-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 14:16:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3695.eurprd04.prod.outlook.com (2603:10a6:803:1d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 12:16:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 12:16:55 +0000
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
X-Inumbo-ID: 2ab9e78c-1326-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O69EPwgA3ydv7I1pfODLv+sr3tkXinzMEA/eqOGLNmP3dGvWHSsXVEtT9BMQ/JhxYPgZI7hv2JNIZ3PCbUsPwj8ZxPXsX3pbc1wbuIDSKPfTIvGyHmszaZsa+9dl3/64PoRsJrKjnvMrBRkyXNpHQ+d3hcDCLYDlu9Mvdf2EZVq1NyTWEO5wEublCCst1kSErrs0GZUPR7OfIjfSRNPQr+0K4uL1//VeHb8us+meROCbIHsvrg/881cqG69GQmmfAGsUNJS4ezNN/tDQF+/FQDzeI7ifgVSqo2r3fEiuhBdHSFufAzBxZLIwBJhUPlyi1RZX/WdCDzx7wttnZkiDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjuRwAuXMI38Cgp2GXFBHQFuZTVfBHZ86LZHZ3OcG7g=;
 b=cbdjqhslxcBgopLAVCLh7gz7iSe4Ngvt8sf0nK+1cHjfEA3ZT/L83ok2LfX2weJE+911rQPmdozQbsOxhyc42c6VJtjSk25uRL4po6aRYmIa1XKlHqsjjwkdR8JmX8d9xArsRw01eHK87TjsQmyRJRB1IXfdQt+gD0j9eALQDvUK9bWGJWLsrvcklaZhN5ba2QZCE8tMRK6LPBH+wU86Nmn9v2/N6yKbD9IP9zOsNu/pxHZel1zubWNeyPCVxAKz9PwONi5t5EtDYfwBVw9ezMFJL4EvLAEkR75NrBzZ3Dl80wPX31iRmDDz/qSdNBtFOGG2NCOGIrm9AsPrIfpV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjuRwAuXMI38Cgp2GXFBHQFuZTVfBHZ86LZHZ3OcG7g=;
 b=Qi4YkrDOQjCd1YlaMueFlATAMQOFQESc3Kwhli5sDtsh6JyLFNeDyeN6F3+h8Z7IpesrPmHOyZmbEXU80xGA0ZNwqmt1ms0QW7TSRJqYFR90B5lnMLliafoe8GqfCtITi9X6oh6vQ1trJeAb5ap0nx+xA21qaC9+ZxTvnK7cX3Bd6XPphQipGGMusx/OexfIic8ipBZmQrEtcurti71kU3KMVxQkYLfveaW8+pCitFy2QVNrqqgQAPvjsSUlA4ElVBeudIq1p2CLeeJxwKNXsjpY3mFnyaVpbThLVDtTEI6ZMscicbizfMlxqqypwhxoRVsLEBcdxhPOu9WYplA3LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2053fb64-82b6-b39a-6d94-153c17cc481b@suse.com>
Date: Wed, 3 Aug 2022 14:16:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>
References: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
 <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13ba5287-3e7c-416e-aa0d-08da754a0df6
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3695:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	25ISFkauUI6//kCwmYVUOy10fkgCGecbk5exWiEI7t8idv9km5SgGOO/NE8ROEye9CnajW7J+/fhNotr+gRMoL+8qjaiUomQlqery/7wfoDf4SXlqFF/pO7WN/Mm8s/TKEO3s5cdP6fXalVU2IzYRdmcRxz+7Jwdb1813gQfHfhU5AfQcZ48HzYR/h5yNLWg3gv1r2/XJ5eGUCZ0FwByogpQ3U6G75DLIVgeW5nDkjDEJD81xRS1cQ9SFolbS0KcQPUrREJeBXMX4kryvceMSd/6TcAL5hhuOnhpQBWBf9PGi6jWuVgebP7mgRW+9tJp8WDWsP68gxlS1lf0FIBz5PMKc3ke0tuEjGx7znOTTAMrqwmQlrNpknE0ZLvPfPRixWsc6Hf2HZ8bbnvkuOpPNVYwQDlNfo8ioSjoTZ3OGERvD2g05IfZiymQjix0YpBgQA7xzEmFcwVAPkysJTvNcw9dbrYEPty7U8xUH/rcgs2J398c9QVKkjFF3y0mrGgh2OSKohMK+o0l+C3Z+FF4EIgKSN4nj+OI/jcxRuVNumwNjrlIFUiiCp2+MaoYwUR7cbkoZMSHK12fxwgXBlXvTcVjb2UiT05mbdYPBUIy/h+sZ72NKwPabx7aij+7LMcyyAth7Fid9NiXkhiBRocq8My07zyYYk6C9qmSpmWsim/4jmlGU6l1CG7C7xFhgys3AQSzTu9MSj6NggdoX+KTdGiNCkQw45z18zBsHiZpmZNkBoUGckKg2y5cKMimiZ7vlVv//tMXxYyIYyfj+4HqhrUlGR5N/ZYJNwNxQVmjQCuGYdkBQwB/1DMLTJhSfC3Xlwn+2TEQd54cbsA7L7YwMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(136003)(366004)(376002)(316002)(2616005)(2906002)(6666004)(41300700001)(6512007)(36756003)(86362001)(31696002)(26005)(38100700002)(6916009)(5660300002)(66476007)(54906003)(4744005)(66946007)(53546011)(8676002)(4326008)(478600001)(6506007)(6486002)(31686004)(186003)(8936002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhJcExqYmNuajJnaFQvaFNYY0VqNWhWbkdtSDBYREdTV0lCUXVlVGtTSkgx?=
 =?utf-8?B?aUFJTEozR240N2E0Rm9DbDQ0L3B1Tjk0bHJMRkNqQjEvdTE2WnVnN3NaUkhx?=
 =?utf-8?B?NUhHYlRYeENqYlY1RWhmVDhiYjc4ZmVYaFRrTlU2WEpBN0pyN2tDS1A5M2p0?=
 =?utf-8?B?UkxSL2xZR2pGbXNCaUN6UXltaGg5Q25MUEg5b0pjcUlISFZXSnlwR2ZPcjVG?=
 =?utf-8?B?RDR6S1RSMkxEMytKeWNDU2YrdWVGOEpNRnRRdUdWSzdScFhNNWhOOTgzdVhH?=
 =?utf-8?B?NzY3QVlqR3JYMGFObDZZRGU0NU5qdEdjYUlzWTkwUFpodkRscXcwdDl6MCtI?=
 =?utf-8?B?VGx4ZW9XUS83TEd0cnBsSEMzZmNrYmZib1dVaHc5RWFFWC8xZGdUVmxQcmc5?=
 =?utf-8?B?ZU4raVAvZVQrLzQxUnM1N2tiOElyY3FIWUxLVFFTVGFIb1Vzc1ZWR0pZYU92?=
 =?utf-8?B?SGtMeFdoUEQ2cW9QcUN3YmJBZ2VoaU4wR1dYakgwZlVGZ0xmc2dqYjBCV1pV?=
 =?utf-8?B?MnF4dkRoUlNXT1BYS0YvWGxNSW04b2ZtTXJIVHQzVE5TYjg0cS9EQ3V5ZlF6?=
 =?utf-8?B?VTdvdFVXcU5zaUJwbjRmMXlpdG9uK3VzaG1yNzBsNmxDMWQ0YWJaNmZUUStV?=
 =?utf-8?B?THhiV2VteXg3RnRMc3FqbkpFdjRaN2lyeW5SckJleVFQWit5UmxKTjF1UEpY?=
 =?utf-8?B?WngvNENULzFuSlNudnZ1UWx3VGJER2xnbDNjYXV2dDQ1dThDVElBTU9zTG8v?=
 =?utf-8?B?K0w5L1lOT0I1cVAwUExTUXhwam1ic0FrMGY1SWFHcStZelU1OTZqTGMrWExa?=
 =?utf-8?B?eHpqOTN4R3g0ekJ3WmV0aENpY05PSlEyQUhLN1F1VU5CTWZnZ1k5U3JNNTR6?=
 =?utf-8?B?bEM2eExyZVlPV1pHWnQvcDJ1Y2ZwaTlhOWJLb1Fkelo0d2hJdkZNQkpLN3pk?=
 =?utf-8?B?RkNWR2JGY2wzZGdJV0ZyaXJnSVE4R2ZJTUVUZUM3WXNkMmQxRytiWThQYUtG?=
 =?utf-8?B?RUtpZFJUV2FxamhDK1A2YXF5Y24rQWorUW5uWFFtbUZYWStySWU0RGowOWlR?=
 =?utf-8?B?bnl2YzVsTW5MaFNVb1lRT3djWjNDL2N1cDNTRENQNFNXMml1dTQrK2hjYU1a?=
 =?utf-8?B?S2t1K3NOaXhlM01QUXp0VGV2MmtrYlA4UGp1dUxpdUI4Q05BdVY5bGZ5YVB0?=
 =?utf-8?B?VmhuZkNMV1E2QUJnY2ZDaEpLRE1zS2NFZ0dhcjBiK29Mc3RSdHVFQXJyMWVr?=
 =?utf-8?B?QUVIcDBPQU1UT2tBVm82K0Z5bHJZUDdvMEdKTHJ3eXkzTElwbUNma3ZZNFpK?=
 =?utf-8?B?ZVdRcnVuNHNvcXc3TUN1bUhQUFpzMG1Dc1pFMHdQcnRpaEFEVklGSG5HV0hs?=
 =?utf-8?B?OVZRN2F3cW1zbDcvL1g2RUEwVU1iaE1BY295STlwS1dYdnBpM0FVa1BTaEF1?=
 =?utf-8?B?QmhudFFnUkJ2dzl0VHNqS2ZtU0JXRWRDOUpQSERnck4vazNEM1ZxQXJ3OTZo?=
 =?utf-8?B?MlhrT2c4cHNiSzB2RHRpRGZvL0VoeDAxSHI4UWdEUUE5SFo4SWhtMWdQSjRt?=
 =?utf-8?B?dzZCdnNzWXllaHV1OEl2bWJGOXpnK1lIYWtzdDg1M0t3UVBmZUNxWmpRQzRG?=
 =?utf-8?B?TmZZVE4wMnpiS2NaMVV1dDVLZEVOblNDWmx5SWk1bC84ME5vUE5ZUGp5L3dn?=
 =?utf-8?B?Nkg0eTNNTExIMTFpVHNHVFNjdnRZajZwSjJrU2pGZEcwcWtwVVJKaUhxeTBp?=
 =?utf-8?B?Vkx2NGQ0emRaZjdNZ3dPa2tkUlNadlV6clNrTUlPMGZNOGJTOTRmSExhSXNE?=
 =?utf-8?B?M0diNk5sVWhrQ3hMdmwyMGhyZ25QaVphaFVVQmMvdThJYjNESEtoOGVLYkpV?=
 =?utf-8?B?czlSSjd6RUpVQUUwdXJQbXV6Y01sSnpJeEo0Si9qc1lCM2s5NXQyalRBWTYr?=
 =?utf-8?B?V3NCeGk1TWtVUzg4TVlRZmZNc01kS3p4bEdaOVN2UTNWaXYwM01WMkFDdmRk?=
 =?utf-8?B?ZnRaZjJUUi9IZDRsNG4wMndKbUtUK09FL0VNOUNRZ0NTQ0U3a2MrVFZ2MGxs?=
 =?utf-8?B?T2Y4MHVlekZSSlIyVi9KTmpwM0VXVitBRDZIbjdORnhJRHFHVVVORzJ0Z3Z2?=
 =?utf-8?Q?KblsHBCdBL7gsbNtj1toHAFvw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ba5287-3e7c-416e-aa0d-08da754a0df6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:16:55.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkBQefUUx9yndfCkTbnxV/EDtQFt2cpEiZRsaJ0v/6RSOM2NutCgyUui5qkGONH8w++6idAm7NoU+Sonqgt4+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3695

On 03.08.2022 14:10, Julien Grall wrote:
> On 03/08/2022 13:05, Jan Beulich wrote:
>> On 03.08.2022 13:57, Bertrand Marquis wrote:
>>> When calling python tools to convert misra documentation or merge
>>> cppcheck xml files, use $(PYTHON).
>>> While there fix misra document conversion script to be executable.
>>>
>>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>>> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
>>
>> Nit: These two titles would want expressing consistently. If I
>> end up committing this, I'll try to remember to adjust.
> 
> There are actually a few issues with the Fixes tags. From the doc [1] :
>    - the sha1 should be 12 characters (rather than 10)

Oh, I didn't even pay attention to that.

>    - the format should be:
>        Fixes: <comidid> ("Commit title")

Right, this was the adjustment I was meaning to make.

Jan

