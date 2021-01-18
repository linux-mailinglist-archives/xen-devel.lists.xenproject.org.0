Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C912FA173
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 14:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69671.124852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UZ8-0006hp-Lo; Mon, 18 Jan 2021 13:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69671.124852; Mon, 18 Jan 2021 13:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UZ8-0006hQ-Ib; Mon, 18 Jan 2021 13:27:30 +0000
Received: by outflank-mailman (input) for mailman id 69671;
 Mon, 18 Jan 2021 13:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1UZ6-0006hL-Tf
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 13:27:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a08209d3-c1b9-492a-b0bf-53d70762cb5f;
 Mon, 18 Jan 2021 13:27:27 +0000 (UTC)
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
X-Inumbo-ID: a08209d3-c1b9-492a-b0bf-53d70762cb5f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610976447;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6DweeyfpoWxIoRFZbxw7l2iFDA9pIIZArZnJvj84Rhk=;
  b=VNuDvUglOvmlJkii1VrYEajl+eBg4ownpUGApAISPTClRFSM31Z19y1Y
   amk8kgXB3H7xNsnaO6tMT5w50ng46YghmmF01telL7avs6ZeH+G7Fpnnj
   mWis/CtqBN9qm98WXmtmMczHJSkQx1ErgAz8OOuiFqEJBKAWFyMP17VEy
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tyb4sMb/j0ApKo7yjjtk3c1Lpv8HQqm6R0tOMJgfShxO0vABLP054zFbItZbjNZJiA7ZPuWyZ5
 r0Qa9KQtC6MINqAZLrjB/idpBp52pVc4SvuCNi+e0bA7LrF61egOqC9KIUNBp9tRCIPpliht1M
 KWTV62lwaQyACJfeldu0LRZD3VMNhhyo/NB9nYGekwGy+5Y4cZeiZ5FrN142p/OHJBbpEn+vVv
 DWkW7ou88UVVLXglGzEPN0UGfgQdyArs7ruQhkGHGpg3FbmEDVCg1trDxFzDtzOCBbigLh3LEP
 hW8=
X-SBRS: 5.2
X-MesageID: 36595863
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="36595863"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqIRBBHbVzEgKXHVrvET1Ga+lWfec6nwIji0dibVU8Tp5XlWyXIkZKodBLEaDfbwqsuGH9PKO7hIRPi1rB2qdHEqkbpl9T+WNKNCgOY6Z5sgO7jtGhWJ7ApJPS/0SP4geLFLgyWDD7MOoxhh/RtTvTEd0GU08stLivwnE2Y/vtL/BLx85q4BmOXTZ8fGy3dlqSNvQDZWCTGJLwOfKLuiRSK2Anebw6Dkgx7HICnmnTjaAq4EA6Dn9E0OQ/RTBr4hDd9X+3zRaeeqjdJTGC9XPk8daB7KhUWZNnMsdRvgeYVvkaB1oTHI/GFgca0Sat237OUdQ0ACYQ15TMTOiSahBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKjB4QmQMokq86lYl1bkMdjaIUoDtsjnVmG7e0lvxKQ=;
 b=QovJTGkuIIHTOucSO8t7UNtHLqt8xcZ3Ci5GeD+jHHnn1WT0tdkYUokQPqEd4l7ISbPN+Ui3cTfTt38wNThdlICX/ipq/eiSMK8PFUxHkHizR3WaiarBZ1drN03Uxg6TLkEpNPhFYeJ1Bav7ts5HDGfLf7RhZZ9KhpYKEXyKFiCBO2QVj3ei8cVHrac2hhQrGEp6jrF6jRjfLgIPwqtGqeCZ22JyrN8mMo/c0SSJoTFTYjjBOsYPi9EZE3PSs+qEXIjvpu39vZ2bS7NL1/Clhl7cLin+KEsUM09ztW/d2a6p98YrDfqfHh9TlYcKfx8e7GvT8c0663YO+R0HMkuLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKjB4QmQMokq86lYl1bkMdjaIUoDtsjnVmG7e0lvxKQ=;
 b=QxJEIZkH4TgiiPTIAp/q4BTAwwFG39khsf44LCR9rA/8t5v+9SFXCpcjuBc+9ex7ei6kx4g53GxJePm3DuIZQmwp6cDtS9sjzCYCEHIB8WKA3B+0I4Oesjt2godbKfWIx8rr/Swa3LysVgFcmpQ4prEeKVI7UiO46s1N4nI/9Bo=
Subject: Re: [PATCH] tools/libxenhypfs: fix reading of gzipped string
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210118120628.11722-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7eb521d2-3b2f-4fa9-cc4a-516143978b24@citrix.com>
Date: Mon, 18 Jan 2021 13:27:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118120628.11722-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::34) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddf70db4-74ce-4589-f6ca-08d8bbb4c98b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3477:
X-Microsoft-Antispam-PRVS: <BYAPR03MB34773496F78F08D28C230D6CBAA40@BYAPR03MB3477.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTYlmNk31yJq412FQdxLFc2ekezNs4tOlHvaApeEas9tTtx1q414h8rxZlJsjYRiaVZ6YJ1PUdCyA1m4sFsfLq+s5LnaUGEtgWsy4cZDcxW3HhFUSFjvqbKgKRdaJTJd+LBGxoVnbhSLmPEZT3qsvRNjY3OBp4LevcC2HLhwjDLQiFfDJwdgh5skLz8kqNY1dBAOuTVRIgj68g6ImY02TVifjRHvLpVc3eEUHQhaYB8ouyEfNYEL3uC4csQOmkAjtkP7vbcGrwvCKVN/cNfxJX0n82hb6DZPfGaEMe9gZj6uHSb8v2/Nq0J0+1ZM7zoUam9CvdtrFlv/O5oniFXjzLfiOpFoTEeel3tqalAebihxasai6w1yzMTlaWmuMp0c+W/dK5Iy7tWlbJhBwiNYyz1gehbsz81ObY9bORMqR6bmVhp4llUmEp0+uNqVJIAh+xE/J0VijHinZ9AirOPxVBDeBlhKZ4eRzqULZRkO3tg1m1UFp91D0zQkr/YKNsa2/wxNxD9oNJQSuM/vR2m4zM2EmGTO2XEbHy9eyeAr+NYBYkmtDqOdLv6PCywvwCkW67XEMchN88J1+e8UbvQ9aQ4NbR9O3fMTUXxjMskpcbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6486002)(53546011)(16576012)(31686004)(83380400001)(26005)(36756003)(16526019)(316002)(54906003)(8936002)(2616005)(86362001)(186003)(478600001)(5660300002)(66556008)(2906002)(66476007)(66946007)(8676002)(31696002)(956004)(6666004)(4326008)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0ovd2sxaXA4Sk9NMVIwM21MaTZlWWtva0t5MmRlSnIzcHVzT25ScnJrVmRi?=
 =?utf-8?B?bUNZdU9kMGZFMWUrVWI0aHdtQ3JhRXdaZzQvM1pSdDVQcU9VbjFSbFM2U3dl?=
 =?utf-8?B?c0p0TjVmVUVERVJ6dzlPNjhhZ0JuUVJ6dDQwK1hwNUFFRzFydE4valpOK3FR?=
 =?utf-8?B?SjFaaEF1VU0xSlc4NUpFRnVtNEE5MXd5V2pUMlBGRnJNYXVvSG5yTTcxVDRp?=
 =?utf-8?B?clRkNlNUTzNXRGgzUHFOaFQveVoxYnJXZ2tOa2NQTVlvRjdkL0V4YThPVUNi?=
 =?utf-8?B?OXdqQ3Bqem01ckcydWtLVCtzYUc4UXAwaE1wRVBNSHBXWitlUm1MRWFnTWE1?=
 =?utf-8?B?bGovNTVkV0VjbmxucHZCTHRpZ1ZZbDdWYkFLQis0ZkZrRUVnSDRoYzk5T3hP?=
 =?utf-8?B?eVZ5Q2RPZ25HRjJNT1NSRlJ6ZG55QTNMSTVQOURRQ1M3WXMyMXJzcDRGU0ls?=
 =?utf-8?B?R3ExaEpaWnB1TTNHeDU1eW1GT3AzK3dYVW9EbE1WU3RFMTRvbkRPdTA4MDIz?=
 =?utf-8?B?RWdweWtOYmYrV3RRMFA1UlZZa1hmN051d1BQWm12NThESjVNOSsxNTR4YlpN?=
 =?utf-8?B?eFRuaUF1NFdHS1owWk12L090eUNtOEZUWUNzWTEvcWVDNGZyZmhIQTNvTXJH?=
 =?utf-8?B?Q2l1dVRRUDdIVlpLajhIN2RXeDdSSWhIU0haZzJrYlJXQUpWQ21kMjBWeDBS?=
 =?utf-8?B?QjMrcFFQOFR2eXIra1BlVmlTVDV2S21JWVJyMDF4RmNPTU9XTXBnQ2RLZ3dL?=
 =?utf-8?B?UmcwUEw5dUdlSnhDMTg3WGkwelYvbjh4dVRwN3lkNmJVTXpUQUVHUzlPblFx?=
 =?utf-8?B?SDU3Qm5walUrQkhjTXFSVmpxaVdUdHB0REZCZUIzYjdjVEM5c21paU5udmRY?=
 =?utf-8?B?b1c2Skw2VUhHYkl2NWlTUC9lTXc5QUVRQWxLM0FpbkFBaGc1anRxREpSK0Nz?=
 =?utf-8?B?WnFTdFBxMkdVTzhZR2Nrb2NJckU0MXpKdzdTZ0p3Rm95UFdEblJ6KzdlMDZP?=
 =?utf-8?B?MHpUTi9XZm1RSlVYT2lkdE9QNFVyWVNZKy8yVE5NOHhucForZFlnc1VPTEtW?=
 =?utf-8?B?MFhWQnAwSEhJOS9nM0U2UHhYZ0EvY1pMaituOHVjS1ByK0RNVmZxeUMrd0VG?=
 =?utf-8?B?NzJheHNpUk9pS0tRWU9oRGFrWVYwdlc4K0Y2TW5hMVp1U211TDZNclFoQnFS?=
 =?utf-8?B?TFdMMkVINjdPZTloWEgySzE0TkgwWko4VTQ0eUpheUpUQy9DMUorQnNwZTdW?=
 =?utf-8?B?aFkvYVNySldxbXBtMWJWSUxGaVJZeUIyY0k3cFdpM09YNzNrV0xvSEVVS3Ix?=
 =?utf-8?Q?AC1zSiLmAgreRt7BW9EkUY4Izkx1TywQOM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf70db4-74ce-4589-f6ca-08d8bbb4c98b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 13:27:22.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4u4dUIa4CKi2/PwZoqtbC8r2olbPhFnjQeWoNsUCdZTUH/kosn0/nF3KzfDa9d2akH1+ZCme3viudIRuktAlyavMS36I0f/c2CStNSss3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3477
X-OriginatorOrg: citrix.com

On 18/01/2021 12:06, Juergen Gross wrote:
> Reading a gzipped string value from hypfs doesn't add a 0 byte at the
> end. Fix that.
>
> Fixes: 86234eafb95295 ("libs: add libxenhypfs")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  tools/libs/hypfs/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
> index f94c5ea1e2..52b30db8d7 100644
> --- a/tools/libs/hypfs/core.c
> +++ b/tools/libs/hypfs/core.c
> @@ -146,12 +146,13 @@ static void *xenhypfs_inflate(void *in_data, size_t *sz)
>              break;
>  
>          out_sz = z.next_out - workbuf;
> -        content = realloc(content, *sz + out_sz);
> +        content = realloc(content, *sz + out_sz + 1);
>          if (!content) {
>              ret = Z_MEM_ERROR;
>              break;
>          }
>          memcpy(content + *sz, workbuf, out_sz);
> +        *(char *)(content + *sz + out_sz) = 0;
>      }
>  
>      inflateEnd(&z);


