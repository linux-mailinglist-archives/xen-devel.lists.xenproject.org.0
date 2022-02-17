Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1D4BA58B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 17:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274912.470545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjSY-0003iO-Tg; Thu, 17 Feb 2022 16:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274912.470545; Thu, 17 Feb 2022 16:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjSY-0003fo-QH; Thu, 17 Feb 2022 16:16:46 +0000
Received: by outflank-mailman (input) for mailman id 274912;
 Thu, 17 Feb 2022 16:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKjSX-0003fh-IT
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 16:16:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff8d51df-900c-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 17:16:44 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-96FwoUXePCGwlhVYdNiCxg-1; Thu, 17 Feb 2022 17:16:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5543.eurprd04.prod.outlook.com (2603:10a6:20b:99::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 17 Feb
 2022 16:16:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 16:16:42 +0000
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
X-Inumbo-ID: ff8d51df-900c-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645114604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xek/oQqGq7nBXNMK/qReZzo6SCj9YW6gLqIfCeyunag=;
	b=AfJjZdmO5GbrpyCCygWWDzKTCTixrnoSOkCwKKsUp7moFui9UGK6+bF8qvIrvhuoTKDDUa
	i99kgsTBwWVQkmw04obhZhu6sT8NtGyzOTr5Px1+2n4tT0k64Ef93Vi2EGizA1W0cpEiEn
	O9POXLAL9WRl77ugmvEYTPCprwaiUAU=
X-MC-Unique: 96FwoUXePCGwlhVYdNiCxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN3vABOdpM9WXFlMLwK5aRHPkp8OWofqxxURH+1GQ/pIJ0DwdBfdKivYmExfqD5/9Hg+11p8LDO7GROYGjy98ceWUkksu2R7q59+zMtw+6qx28T1R+SQ7pyna8X4JCfmA32BJg24DBmZQwPkgJBPLmHCVHQBX9sbfaFfzCBGjPruTuamiiPS+AIflh0WWT4DQLMvhA+rgV3DbWCCNeaC1cTeG9iX4wzjAPftEvdaQPjKbxbQdkyUVvnNjs4DbMEzhUfXNnF7coJwEX8GhdXeK/AKf0kd5rJXvFsq3Sffq1slFOPbnMg8Mi+m/Pbh/defsqbkDyBBjtuDVLrWkNb6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xek/oQqGq7nBXNMK/qReZzo6SCj9YW6gLqIfCeyunag=;
 b=BAFTlgzt7g1s6F442iZRQnXG4tqPddZXNaYzueaM/KFLMsy27AuI35fkoUpaISp2xcSWXEuKWi8zJuxigAUVLTCEUkPw6pK5lo2iYEnNkejAK1LXMEhuGMh5XnDt9aE3nyEQ2+yniRRbMJbCz3s0nL+n6WXiLnXYGjYqMc6N5Lb5JWtlzXkysa6W/uNSzZV8nLS21s7bi3bvxumrGIjFazraotagrdMI0QPzkoJ9TIJWXG19Sg9zrZSV2CxfrakZLESmaM5fHz0Xr01ADr8DW5Lkn4KMSm5Gs5IQaOmRUNXIKvTsL3P74vaZiJrNmDIEN2Jod9l/sTKYXDSN91Xlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c74472c7-3f23-a73b-4df3-55ad1700463d@suse.com>
Date: Thu, 17 Feb 2022 17:16:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF
 metadata
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220217100158.22402-1-andrew.cooper3@citrix.com>
 <4e9924f7-fdfa-c3c3-7b6c-e5cbe77ff9ac@suse.com>
 <826c97dd-dda9-b6c2-37bf-451354fcfde2@citrix.com>
 <e35ca83f-12ad-0c28-075b-82ff08b2bf1d@suse.com>
 <19446d4d-b4ee-e26c-10b1-b2c49a1950ad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19446d4d-b4ee-e26c-10b1-b2c49a1950ad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59d1ce25-ed2e-441a-5843-08d9f230e283
X-MS-TrafficTypeDiagnostic: AM6PR04MB5543:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5543F44944E3BB0F173AA486B3369@AM6PR04MB5543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8vExkUM2UAilcHcz0yVdSut6mG4O1wvoJSFZl/5ZwkZsCO/z3YhxzWmRP42+M88rGc+q1wD9rFTPlie2EIQQDrfb9OJb1tUC2dBhIAy2GN1vLaCUI2MSB9/CTy4v8ej7tmflSom0QZTKQO6IKHWjwtU9wDVQ2zW0MwOAQzMAutbAhzKqe/ZJk13VkUYV/JZNBpuYC8FdhX9BoFBix0N/lJuwFBsChH9T8zhQAA2SfiYfFWAx+xU5EG7Z132czBOk1mPWp74q/vX0IaSqlOGuif+0Kf/uS+u2TYIZcrC3YyBstGos6t1eIAgdzkOnz2QGyPhhtRlihv2p4EYPQIRYVxQtfnIlaqq0YtU5HYseKE0TIGVZ9D68VE5H1SRP5lNWZoTx5EBT0TRVxMnqyE1d2UkE6rFwR4kI/W0rXmSsrFe7SOyJDsecx5kgX4jXcmIGwESABAcQfrPl3/i+564cSCrh3nvqcTrSw7eedexh3nb/9xe4OGom9cEoQwAe7TyxY2x8wogadr4G1ylV4ozWSBhLJQB2z/pqTb6T5K7zPaDFL31lT5V6a/s0MqwJ5FMjhJxQ47FhL4fr4MGetkJtVhG8nEKkeVJyJXQL3QoaWovEDHP+k9gXOZe2sUDhgUF7zIlQoPdsAMRskWrfceYeDK1lRibaj2ynYnbKM7+z/U4O0c75UwbsqDGk4hgjymA86O2+vYqVNyQH3A9flQbAYRzNnw7kc2rJXuXU5xUuwtKNzWCrBGQAOLYdURqhOQ7Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(31696002)(2906002)(316002)(6486002)(8936002)(8676002)(4326008)(508600001)(36756003)(2616005)(86362001)(66946007)(6512007)(26005)(186003)(54906003)(6506007)(5660300002)(66476007)(38100700002)(66556008)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGtSQzVUSnZ0NFM1Tm80VVQyMGcvbEJaL05HY1AyOE1ZUHF2aXJWMkdHcFk5?=
 =?utf-8?B?WWplZXFSUjY1VVlrLzc4dUNlQ3BBbXUzYm1wRGwzM0lTMnlLR1VHWXBSNHhE?=
 =?utf-8?B?eTI3Z3FOSXBVa3V4WHZBUUJjUUFQdG5valpzZFRxUjQ3d2hGU29xdlkxbFdq?=
 =?utf-8?B?Sk54L0ovQ01iNThTU2N5QmFMZ1RIZW5kNWl0R29ZRndoOGZSUDhHOU82UEFZ?=
 =?utf-8?B?Vko5VVQzM1Q1S24zY3p4eGFvSzZsQm02ZzdRS285Y3g0Qlh3ODg1QlcxVm8v?=
 =?utf-8?B?eFNXazFvd3c2eWoyZ3djM3ZVVmExcVkxM3JVUTdsS0dUQlRyems4a1BtMGF5?=
 =?utf-8?B?NHVDMWlUQ3dpVHRObnpIK2xmWGFYWmxwaVV5eHUrcFlyeFU1WXE1VEhWdUM0?=
 =?utf-8?B?VGZmS1RhN2xTeGJzbGpCT3o4VFNBNW9LdzY2R1U4M2ptL2U0YnNBMFN1bkZZ?=
 =?utf-8?B?VWNzVmZwdU45RUtIV0tNdTR3QXh3QTBSTTRpY3VkcGFqMTNiU0pRUG9MUU5n?=
 =?utf-8?B?eCthNlIwN0RrVkJhOEZmb29FK1lESE9iUUkxSHF5cnhhUGNodlpQQnlKbXJ1?=
 =?utf-8?B?dGRKRjR1VkU3aE9aWkFobFQyMGhkK1JrTGZmazBnM2V5Y2lqT05JTW13eWRB?=
 =?utf-8?B?MzN0eGdHT0hZQkxGT0ZxQzFBWlY0TGQvUXZsS0ZMK3RmRXpmY3B3QU9PQ3pV?=
 =?utf-8?B?UHptTmUvRGRDNStrV3FDMmxuVHM3NVJvNm04RWRaM29ZZkJMbkIrSXlDRmR2?=
 =?utf-8?B?NUpSbmZSRmpmUEd2ZWJITEtjZnRTeHplME5NamVlQ1IzQnVLa2I4dC9Xc3Fn?=
 =?utf-8?B?OHFtZjJvdGlnUmNxYk16UUgrLy82TnJIbUFaYkdBNE5tc0hjcHZNdUJDblAr?=
 =?utf-8?B?Z3V4c0ZkcWkzTThjV3ZDejB6K3RKWkhpQWwvdXpITm5VUFZEUDJCTlI5bEwv?=
 =?utf-8?B?Rkt3V3EyZXc0UVhXdTNXSm5ldEtrdTlEcXlXcmRkeFRwMmtaZFk2eXdzRnNO?=
 =?utf-8?B?S0pUeVg3Z0RKYjhkdmlGa2NRTTdVeDdCVzNiOCtEMzNWNGpJczU4MzVnUXJw?=
 =?utf-8?B?RlFuVlA5K1pCL0M2U08rdm5STXFLaHVrTmJYSmxFenBaVGd5UVhTa3NXOUlV?=
 =?utf-8?B?ZU14Szd6Zk0zR2xqR3BMbUVWdGRjSENnVlpvMU9hMjM2R2lvaUF5UVlDeGJC?=
 =?utf-8?B?S1cwRGR4NXVmRFl0VXVjOTNRUjlheHo4bU1icFVWNFo1T3gvUk8zTUVjUDBl?=
 =?utf-8?B?TGRNV0xGZ0NXenRQR2NYZEFkZEMyZVdTREVGYW1Pc3pybVppQTNUbHZQeFlt?=
 =?utf-8?B?ZitSRFhKNlNQR3FXaUkydlNCNFQ5ank0MmRkY0tIQnNub0pDdm05TmlHblpZ?=
 =?utf-8?B?WVdRMFp0R1dhTmpITkJTbEwwTnJ6bEpNTVB5bXV3YUJKYncxQWJFSlBtU0Fj?=
 =?utf-8?B?cm9oOXMxWHEzcEFyVlg1WkVLQUp5MlIxb2luSGNrK1dHeGNnVjk0d2lRajRv?=
 =?utf-8?B?TEo3NXd6b0gyc1FlSG5ScXVaUlp0bFY4VksrNDRmdzdPOUJaNnFtZ3UySXNp?=
 =?utf-8?B?bkV2YVAyc0xHU2F6b25nWmVXQU05enkzeHNuSGltWVlFc29mNUp0U3JQNkxt?=
 =?utf-8?B?MzZzZkF5L2ZQYVlVM2NLb2dzU2d1Vk9Ka1cvS0tyeTVjblJFYzBJWUlubWFB?=
 =?utf-8?B?NWVEUTQwMWI0YnVrN3R2RUxTNWdZemRRc2E0MDMxcGx4Nk5Xc2Fra1hDZUI5?=
 =?utf-8?B?VTVlYXRuNEEvVzFxMm5pRTBaZnM0K1ppRG5RTkczL2ptdFRwc0RNR3pkMFlR?=
 =?utf-8?B?Y2tVbVo3OEl5ZmlCM0xOWkdRSDRsTnozTlViaHZpS1FoMzA1UDNoU3dEWGRD?=
 =?utf-8?B?elIrNmdpZzdVRUVIalBPNUVxSkhaR2JYWDFzVnV0b2REa0xsblN3bFpaOG5H?=
 =?utf-8?B?SEdpS0tYTVhNdlZpSnN1eEdVRjNMY0ZTVnlVWDF2aHQ3OUlPOW0vdEpkTkZE?=
 =?utf-8?B?aE81RnhUSXEzLy9hNTFlWUdDbzE0b2JrWFBGUmpXbXF3cGU0RklMWXZ2Y1dN?=
 =?utf-8?B?RXdRYnVvdnhQQlRoa3FzSGd2VGNhakVoa3pYazNhbjAweEhwZGc4bmNyK0Nu?=
 =?utf-8?B?dzBWbXdQTkNZK1BzYU1jb2dEUU5TdTVaZUp3UFRPSzVUOXltdThaWTliWE5Y?=
 =?utf-8?Q?Xj/bd4QC3uSyb1NOLdWAS10=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d1ce25-ed2e-441a-5843-08d9f230e283
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 16:16:42.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC2eD0DfuC6SfDpRNCo5fPU60QAi7kzO0R2+8Rq9CJXLDpqf5FxDesArh4H47io8r4N1qYkWGwZqRy7Ct89TnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5543

On 17.02.2022 17:06, Andrew Cooper wrote:
> On 17/02/2022 14:48, Jan Beulich wrote:
>> On 17.02.2022 13:06, Andrew Cooper wrote:
>>> On 17/02/2022 10:42, Jan Beulich wrote:
>>>> On 17.02.2022 11:01, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -87,6 +87,7 @@ SECTIONS
>>>>>         *(.text.unlikely)
>>>>>         *(.fixup)
>>>>>         *(.text.kexec)
>>>>> +       kexec_reloc_end = .;
>>>> Does this maybe want aligning on a 4- or even 8-byte boundary? If
>>>> so, imo preferably not here, but by adding a trailing .align in the
>>>> .S file.
>>> There's no special need for it to be aligned, and it is anyway as the
>>> stack is the last object in it.
>> You mean it anyway would be, if the stack was aligned? Or am I to imply
>> that you've amended the patch to add alignment there?
> 
> I have aligned reloc_stack stack because that's a no-brainer.

With this ...

> With that suitably aligned, kexec_reloc_end becomes aligned naturally
> (because reloc_stack is the final object), and I don't think there's
> much point putting anything explicit in the linker script.

... I certainly agree with this.

Jan


