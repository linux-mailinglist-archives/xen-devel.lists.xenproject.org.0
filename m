Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891758A8C4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380920.615363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtZf-0004Jf-9q; Fri, 05 Aug 2022 09:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380920.615363; Fri, 05 Aug 2022 09:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtZf-0004Gk-6w; Fri, 05 Aug 2022 09:24:55 +0000
Received: by outflank-mailman (input) for mailman id 380920;
 Fri, 05 Aug 2022 09:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJtZe-0004Ge-4a
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:24:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7551a9c7-14a0-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 11:24:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5830.eurprd04.prod.outlook.com (2603:10a6:20b:ac::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 5 Aug
 2022 09:24:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 09:24:49 +0000
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
X-Inumbo-ID: 7551a9c7-14a0-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLyZrdlDTRuDtP8DIbQzUyKY43eugLM64X+2nTVz1l8hDCzpa5c0crQA5LH2ckcGImJKloe0kwXCIwUMhFIfTuEQlzxdLLsXIOOHC45fRDQ1ZnxexoPFS6W3dFPDwUT2+ER2bxfxPam0Qu/4ddr5KdIvPzHCTV/TnUrbXvCkDaQYZsghoxtTieo3yBGP7jZG2X6ulMtLKXIIaXTxW5UOfcXUROjvgaWEPTRVyDsHu881K4DsbO3m0tHbHSAjO4w3FU9oS9u9aJyuYB31uc9FJSDkfwKdBKx5CQWlvj30M4fMcJc858+txg5NUuJvo87rZYDHeaZq6AumCmXk9YlxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0tsA9oUDG1B/nFNR/reYRCnJtOepE8GG2eBO3vppEE=;
 b=fjy0S9aB0U+xO9LhXzhVze9oT73k0OpryrNlNJQYniGC6EEWBWP90c0hliYlAD1aTOEQGL0aS/5Bjxxalajd0FGkGIqMSxTrvm0fAe7u9EIRkV8rTe02sYLrQujhsvxPL4LR724Xp4MA+ssdUm+0O1fHMZn5vzFBZswEV2LdDuBWMx1hY82CcUcn8YfyuQSVv0agHFD515/EzAnuIQpEaeQ4ZkLKkYNDKJr+ge+glvFW7d6MU4Qr7hIML0mUNBuc1ZfPZlQgs7OkvzEybZbz+EUhhyb18/y6npO3465Y6M85lPlSqKF99CzmWbJ4A4dIBmzqylxHHpxoNM2dcfmznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0tsA9oUDG1B/nFNR/reYRCnJtOepE8GG2eBO3vppEE=;
 b=IF/8DCyDVR6kaIQN2HHlVxSk8UggCfKm9KT3Nt9RlNpqfAYRbpHLBdo6F6dbyZBlnDEVB78xECabU2bFOBDXx8ZlSE/HosjzrMlthylbrstf8zngPK0wthyWYqzTnWdPOaBYymtDYfr7xl4csGq5njmJ56W+p7vkSZvCnRvHf1SFKYotBfXDd1smFe/muiN+OqAv5Fm76itRzOks0qqLFWCKYuI+lSMx7h3BSbgNvtxKWKRWWauTh1LCYW+MlsBnEk44WxsoFW0hRbstBmwnnMkh7nIQfb+l7672uqv2POBPYiif7exgXVTjNVpzEg8Bv12hxJgmU5ziXle8niS47w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
Date: Fri, 5 Aug 2022 11:24:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] xen: Port linkage.h from kernel code
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220804150424.17584-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0072.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c0ef87-4c45-4c75-4b43-08da76c4584c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5830:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LyCx2LiaXmcZ4btaGxZK25LCfYWG27dN5lDhJXoSfritPhh49vRhbMQvz8ebHdaol+J1AJ33/pfQDFEN1kmQhvBOqXCB3GJk62QQb3gT6qU/nAPpTDNJtITopZGJf471yihlW1/dYSN7UIroVTYcKSibPq2nMOnCwyJi4uFolUrS39dpCA1NswHQDxyLfBDFyNy0QWRGOGKzb7Yo16hE2wtYf4gBx3Od3yhuoIcy65775hnK74gefp6vYCQZ02lBr8t3pMuqmicnD1jCLwEsQxm10ATYjk2ys5v3C1PpotP3wNCQ1Hk7qY/xlrjHazekqJpPiVjPYUYP+bYCBrPtllU8xATXAh8dpBuRBRpl6tXRsN6cvL17aL0foOvycQoXq9WhASguAjnACULRiNWUzvgXKMvDp/AHY4zwVsbx1hJKM+Cr+UWZPPMR1zNgmGeD1MUquVlUaKlBQY/PGXkwjG0NwX0gLQGLtgpqKbryQBgzsty2fk2mNtui6MXTZGYvSa/0yKRDxZFwcRXf0JHgQZptYsdRPELRsAAkFtFAOut6RsDl/eNEChkJYmaFMaMDH57DiHbWcmtMcYHPbYLRTfToB7duzLa/Bo1gG5ubiZdVgeeYeThWbPXjz1+p+qE5R0iexrmyfpggwOgnhp3wYsTZETVBWU9lzScN6UeAr70F/W05FHRBrmrWzH1FnMyd29DhYMlXOC4lJ+Y4IfH7+fMlsoMxbeIXm7JsiEff209YweJL5kIGQWD1Z35tfkmab3Ne3VMCJagtejwyYzRkeMbWlz8KXkRdRBBsI/l7dBne7oMqECnnzHmM0qOinUeZzw45Ez0DWb1bI4kcEYeOLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(136003)(366004)(39860400002)(186003)(53546011)(6512007)(36756003)(6506007)(31696002)(38100700002)(2616005)(86362001)(66556008)(66946007)(83380400001)(26005)(31686004)(66476007)(4326008)(8676002)(6916009)(54906003)(8936002)(478600001)(41300700001)(2906002)(6486002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aklKd3ZVbkY4V1pWTkUyQmNxanEzbVJKWHlJUlVzbW84MEVBN2RLZlZLUEw5?=
 =?utf-8?B?MmVoY0NzMlNLdksxOHB6S0hlQ0txUHhpL0dpZXZGU0o4RkZSMklpazFvRGlB?=
 =?utf-8?B?MmVscGdoWEVRTVR5dzNTNG9OM1BiWlBWUjFEcEVVb1VpVkQvdGZPcGdON1dH?=
 =?utf-8?B?Y1JDcVNEdzUyRCtGeFlkNkZ6cUxDRmUzNUV1SGZUaU5zRGx4NVphY3ErZlZ4?=
 =?utf-8?B?ODVIdGo0c2JWTGpHeWoyRisyNVdsdjFkWEpiMnE3Ump2WU1ORExPZVh1SWNN?=
 =?utf-8?B?d1ZmRWRtcVJQemU0MGZURHVlTEFpSTRLV28vVmRZMHlRMTlJbUdXTDBUMm5n?=
 =?utf-8?B?djlickFBQTRnTmMvUkZOem8xYjdPb0YvVldmSWRQSy9EYmcrcFh4SzZXclB4?=
 =?utf-8?B?QTFZaUhxTEVJb1lBMVBEZGxMSXVuODVYS1ExUGc0UzNtNDJzdVVaRlFQdFF1?=
 =?utf-8?B?bGZ6MnVwSHhURHVaNlg2d084ditlSXNrVVlGMEx0Y1l6R1A5TUozTWFHeEd5?=
 =?utf-8?B?YjV2MVpxdy96ajBMRHFXcjg1NjdoQWhnM3p4NEk1UUJuSEx0aXdDQkp2YWV3?=
 =?utf-8?B?d0tnODdZUWs1M1BObEc0UTI5MFBxSk9DVmFMbFBMUlc3TW9hRHd5aEdSVVZq?=
 =?utf-8?B?bGFNV1N2VHluMDJmdlNiTWtMeEVGUUZOQTFVUVpMbkp1a2M1Ui9ITm4zUWVi?=
 =?utf-8?B?aDZkcUtadDFWU2dlZ1lpOVlVcWhlOUxHNXRvbmgxRUo1SVkycytON21qcWsr?=
 =?utf-8?B?SHZaRUQ0YWg0SWhDNmNwSjNvWmtsOVhSTXcwaVFNSHQxenNsRm54SjVObndy?=
 =?utf-8?B?dEtEZHpvUDZtQkNHQlY3akgvV2huazR4eVBoRklOd1czazIrOTQvV0NFWE4v?=
 =?utf-8?B?L3U3Snd6SUwvNVlyaHlvZEYwVXYzcVQvRjFHZnFsOEY3NUEyTTliOE45aGpj?=
 =?utf-8?B?MTZsZWFrLzd1UVcvblBnSGY4aE55Vm9ESFRqdSsvMzZxdEx4YTE3cGJFTm5x?=
 =?utf-8?B?NzIybGhuTUpBUkxKeEFjYjZaRDRIRkhIMEVGSzhmR3h6TjFLTmtpZTBOSnda?=
 =?utf-8?B?THZiUkdWaWJDODRNSVB3THFMblpQNVFydDBYWWV4VFJSUFlweTU5cC9kZ0xl?=
 =?utf-8?B?RmlCQldsb2R3ZjZLZm9DRlA5eERYRzZRZjRKcmVHL2tOV1BLcnhBSzhXbEJE?=
 =?utf-8?B?dHF6TTcwcFlqNVVqZDhmOWhkdUZLY3dZQlZ0QzFDWkRQK1JvTkFqaCtPOFhO?=
 =?utf-8?B?dEdaWkxtSjBnRzAwTWl1YmFZdytmaHJ5cTFXbTlIcGwzZGdaOG1FUHkxVnpG?=
 =?utf-8?B?NjBnOVJ2ejBUcTFzeUhnMHJSeFRrclFEckhLa3lkaHkyY01scFI2MU55RWlU?=
 =?utf-8?B?bHFCczJZMHJSbFVwaEQ4MEgvOEJpbTJ2cjR4Q0lDanRKbldBMHFVVFh1cU5H?=
 =?utf-8?B?aWpWci9QWnZSUXRCcmJqRXVZRmRRSWg2TWd1QXQrNUNnT3dDS0VhdlBseVhY?=
 =?utf-8?B?d05qVjdtM09sbllnViszbkl3LzFoL0pRYldtbTdFRFMvZU5VZ3ZJNG9qdlc1?=
 =?utf-8?B?eThESFZiMXNWRmZJQklIQ1ROMkhFTXpnTVRocjlEb1dyOWlsNk1vZC9qc0VQ?=
 =?utf-8?B?QWw4eVJtaXZ0Z0YzZFE1ZjJTSDRXbXhRRkFJVFBRR3ZTNG9GWnRNMFR1RlVY?=
 =?utf-8?B?TjVLQ09hMHZ3dE9PVmxuOFBqM0dpSE1Pc0MybXM4d1BUSm9vQVVYYUlla2h1?=
 =?utf-8?B?L3dHc3pGU3J6VU5pc2RsVytIaGlNNDNBVWdFUUlTcEpDd3RiekxIam11TXhK?=
 =?utf-8?B?bURjQ0Z3bTRzRy9PMGpEeXZVMlMyUEROVnprMjBoOFpwZXFWL2tYRWdZckxq?=
 =?utf-8?B?T0gvQ2huMHpYcFNTeTlzS09WY1N5NmNRWmNaSXFpMG56RGVrb1p6MTluTzZn?=
 =?utf-8?B?R252SzU5bkkxMjI3VjB6TGhjbWpUOHU1bThxN05wdHpaU3BWVXN5bVYxZkRn?=
 =?utf-8?B?ZTJkb2w4SnlOZWh2SDlQbzBvbTNuNUpOelBsS21OVnJqRitRRHJyajhMdjd2?=
 =?utf-8?B?RGJJaHhsb0dmNUtUWmZBUTBybGFrZk5hTG9WeC9UV2M4NWZpdGgxQ3pnY1Nx?=
 =?utf-8?Q?uPa++ZCQMvr1Elfpnw8hALZqS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c0ef87-4c45-4c75-4b43-08da76c4584c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 09:24:49.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3M1HaMH+MCDMMtHA5hb9my9R/nIVKGVeomBQy3oh3v58ec2q1CsPA+rsf34BVlPM9vhyXLbvWABtWhJWoVvvIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5830

On 04.08.2022 17:04, Jane Malalane wrote:
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

In the title you say "port", but then you don't say what customization
you've done beyond the obvious adjustment of inclusion guard and
adjustment (actually removal) of #include-s. How much customization we
want to do is important here, after all. I notice you did, for example,
add new flavors of SYM_INNER_LABEL, but then you didn't add anything to
use .hidden (which I have queued as a new patch on top of a supposed v2
of "x86: annotate entry points with type and size"). At the same time
you've left in objtool related commentary, when we don't use that tool
(and no-one knows if we ever will).

I'm further not sure I agree with the naming of some of your additions,
as they appear to not really fit with the naming model used elsewhere.
Your additions also look to not always match style used elsewhere in
this file.

You further want to mention what Linux version this was derived from,
to make it easier to determine what incremental changes to port over
subsequently.

Overall I'm not convinced this is a model we want to go with, first
and foremost because the commonly used macro names are too long for
my taste. What's wrong with ENTRY() and ENDPROC() / ENDDATA()?

Jan

