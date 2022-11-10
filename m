Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E1624614
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 16:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441952.695967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9cs-0004VW-3s; Thu, 10 Nov 2022 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441952.695967; Thu, 10 Nov 2022 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9cs-0004TF-0q; Thu, 10 Nov 2022 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 441952;
 Thu, 10 Nov 2022 15:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ot9cr-0004T9-2S
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 15:37:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2047.outbound.protection.outlook.com [40.107.249.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a49f349e-610d-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 16:37:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Thu, 10 Nov
 2022 15:37:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 15:37:53 +0000
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
X-Inumbo-ID: a49f349e-610d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrb/WSoL/sjYl1BF7gIQyXJFULOPh5PSSKlLCm6ZinadVPZHWs2qnJnpcIvxVQui1J/RFeh/nte/zndLHI9PQGgLoiaN03oNzGhgnuvkMdh5zZpmL8JIEMcEiv7xEpNM8+K3m6XlXz7jKfSwx93NLZE9uAsqP0Gr8R1cCqE2JJus1VvoY6l7OSrBnU3LEoeiIglKEUG8U2FGa3DktJ0onMdHsMEf3dNgn/ULl1+GJanVxlqT+ePSFFy3xt1DlYQTsKq3AeL8sITbZhfP4HVuqLHMSlA638sw9+ZV5hZV2uKNBOv1kgQ9vFFC94Ud0lxfLdStgeBRgWhHKOQHbe2GGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTiObr5smwAPI/hAgA+hdQks/N76nKnZadRCg7Ok+NA=;
 b=IXsR8BXJp0LVkc4DITqLz1YD6rhtEPu98sJrQLnxdSpPhjdajKmS6QgtCQOTL+scI7K5soUQ8c5VrsqcBCf3wRGS+YXjZYPnRB0T2QJ+WQGVvi4hDifE94Tpy7ntMS7o2YVrKHotFokzhIaoc8qYNNZiEgPDS4ocGtz2MmYsH7I5cmSZHbhn5MMjHMuDyzghGRoGBnv2eQ0P7t4+dxSAFwGUSiMaTCZi2jjawqniisB7c1JJZ0dt9UFEaVtV0JarRP2SmvYC/+KJ5ARyfqsOpS9VgFx1uPG7aEn3Rgs7B6zW8599kY0sZZlYL0ZmnoF0H8zGIEUamsEEWUSsCnnYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTiObr5smwAPI/hAgA+hdQks/N76nKnZadRCg7Ok+NA=;
 b=JJoS2PUcDTghD6m0YjU9BjWY+J0PobO0+Lf7l8rZWLrdX0EaoVpOOAUDPiBLhfSHHi5GcpF1jsgsDl6ZxYNOAKfvXbHEp/A06Skq2jm78rgh+l0pIBBDTjUHvX+c4QnnSZFQUMgdMbhC8hAQ9z8ei+UEVEzHuF7NeREAfVIFRtFQ/0GNkYW0NLKdLcsBW/4T6UCOez04HtvxeZx1ENqfbkM1oAP5c3uOXAdxOvqfp7N5YNbgNbQC230jXetFcS/IRJAcO0rbUqmhcQBiar0Dm7832qV7irQtdToo6yEWFS5SSLfkuHz1NSqmwWyyY69r8w8L8eQwVRp9BXGAh62ymg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5445ee8-500d-0f1e-68d2-23fd3eceb310@suse.com>
Date: Thu, 10 Nov 2022 16:37:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] xen/notifier: simplify using notifier_[to|from]_errno()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20221028114111.8150-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221028114111.8150-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 557c5410-9042-45d9-da89-08dac3318837
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j2dIh8A7e+nCjJHDcJfi7YrU3rm5vwd7nujMMiqOiz4IbAFYjmygW6rTfcXjQrwR+6lcXICFgg9nFyhLpVYHtann5kNIxlWC2sYyu69sneabjd1J7yE+mJDO3ZdwShQ+fVa9Z1FSjdSRXDFr8CdNsdDCqLPPr1ekfDozsxrbWDCaDOltinYEL3WxPO1fWV1jUNo4PYOtKK90P+pdH6/1V0ppJwx2RcVGwGHx1kJ7b2gtpfvP6ZZmdJlhlZ5poKAZR6Q8zenhP7S54DIZj90arcMAWPdh6fhxd2Knkwsl3AsLbstkPSR6ZRb/TZaNog7OFsrk1pKHrBCTU8chu70kr9n9xBwVqVz0buvEOje7GAL450Uy4MXnPgdKxPxZKN5HWkJ0xlTuNrNyk4AyncSX/HQ2CqlY10W57To+i0HCDkHiFFu7/1iRgV2wVB31CVGKDTWBbx53ZXPdL0AV3K1tSUFj527gIiPP1GU/VXa4/gbyhWemLiZ0QxhT2kbLYu1zZjSEC1Irx56/+Uvd3yR6dsLPoq73JqS0AmDrVvljC0BlEJ4EYFGfTaD00k27lW2+oexjzpPSYFN7HZ1pGr2SNegSWj6DCyh8QQ/+Z9ZYtxv29PsdXFprpI3OOZNFqN1CQw62fkiNnypUHwoTAXHhqBcfIVFE9hyr0lJ4Yk9iij8PGzQhEM2iD4LGVQJZL/fx6BWa9JuCi/D7UwtbuQ/gGGwJJhhRZ7ABx4Mi9lIJLqJ6V9ci2knEM7IEeMPHs4ba/7diQ754pyCNMYZGOtg5jiyVIeXZJEVJfVIlzPC1KKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(38100700002)(31696002)(86362001)(478600001)(6512007)(53546011)(37006003)(8936002)(66556008)(6862004)(6636002)(8676002)(6486002)(5660300002)(66946007)(66476007)(316002)(41300700001)(54906003)(4326008)(186003)(2616005)(6506007)(26005)(2906002)(4744005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVya2tIVzYvMlpTTFROM3hWQW5ZbDNPUGRJN0RZdmlhUHlualduVlp3Wita?=
 =?utf-8?B?aHRiWXRuL0lPTHkzU3FmQW1PZ3FQRlBLQVcxdHJRcG55ZUhNa2ZXQkEwWERK?=
 =?utf-8?B?RjJlRlowam83YVZ5V1JsZVVGb1dVTGM4MEphYWVNM09TdTB1M0JFZzhQUEtl?=
 =?utf-8?B?VEdoWW9rS1NUbUVBN2pFVWtMNEpFL3IvWWV4MVdqcFZWZXVUVVlHZjlhNitp?=
 =?utf-8?B?NnlzVHFWdzNHc2tvdzh3SlAzWHlQdmdKTUxpR2Z5NkY1OFIxY0gyRjZTWjJI?=
 =?utf-8?B?dXdEdHBGbUlDSHUwY0tFemlBNXQ1V3orSHJsTVR5TXBMSjFIcURRcFpFcktS?=
 =?utf-8?B?bVVObUc3QmJpcS91TWZSeFhuekpGMGZkN3RZSHFpQ3FkZURTWlFjbkhmdlcx?=
 =?utf-8?B?UXBSdm8zRTZoREV0T1ZhZWY2REFkWVY0UHd3K3BHbXp3NVo2ZFM2UG1XRmh1?=
 =?utf-8?B?MENhYkZqdXZLM2ZQZVdlOENtQzVPVlJWcGN0dE5BdkRudTgvY2ZpUHdNQktt?=
 =?utf-8?B?N2srUFVTeVk1RkE3RUNiRUZ5ZXZhdm9CWTd4bStnMFg0Z0ovQWtBenMzS05F?=
 =?utf-8?B?QldWd3RNdnZRTTRUaWxFTUlwWVdoc1hJVm5mNENnSmpuVWgvQkR1YnR0K3lm?=
 =?utf-8?B?TSs1MTFCNWtqaEFlZG92L1hPZGFUNmtoWXB6aDByU2VocWo5U21CTVp4WkZT?=
 =?utf-8?B?d0c4d2c0amIwWmovempLRVM0MXZFRXdTSjlJUmZPUmV1MUtCZHdLa25IRFBP?=
 =?utf-8?B?TzRzN0d3S3MydUc5bkR0bGo3aFcvd2dhdkNzbTdPeXZZaTZaYlVuSFF5R3Jk?=
 =?utf-8?B?bjBpYnloTmIwb1JGTU1VYUo2c2VvNERBdmoxc2ZjT3BWb0hqczdKdjIxVXcr?=
 =?utf-8?B?Qk8rc3B6UDlVeGxPMU5xY0hYNkk3eHAyam9RTElvb0xZZlB6VzlKclpBZU1E?=
 =?utf-8?B?ZEp6czM1YWJBbHNrMitpa3ZNbDVwZXpxTEpSZlFQdTRBSXdHc2xWRFZCcWRW?=
 =?utf-8?B?SnNEZWVWaElKU2ZyV2xIMGlYT0dUOC9YWGptdXNtaG5sQTNIOG0vdmFCR2g5?=
 =?utf-8?B?RnByOVN5aTV6Z0E2ajJESVhXSVU4NkVRa042aEJkTU9vRTYvNDRFVzFsSW1i?=
 =?utf-8?B?RnRPZDBmekNtZW5qN3NXQ29QTzdVT09PNy9ZNW9uUHQzZmx6aTNVazBablhz?=
 =?utf-8?B?SDBuVXh2Y1ZiWmZDNEQ2TTlIaVcyMEJBWFVpcTlKSFExR0NjM0RnRUZQeVVR?=
 =?utf-8?B?ZjFFNHBmaHFVT21seURRNGpMV21kelJMdC9IYUxBUkIwby85THVjVzVBWDJt?=
 =?utf-8?B?YkcvQWgvQk5wcTQ4Wk5zVG82ZXV3TnUzeDh3R1kxb2lneVdKbWtWb3phdjI5?=
 =?utf-8?B?VndCT20zRkNjOXp2ZnN1bkdlbVVwaGdoK1NKcUZyRG9JVDZPaTlML0pXalNV?=
 =?utf-8?B?L2R3aFYxSXhHanpjdjBCOW5JZklXeE5YZzlSV0ErU2h1Rk1OQW9ySm9GT0V2?=
 =?utf-8?B?NGZ2aWZFLzYyd1FOeDRNTkxtK1BwcXNsN2xydWR4Z1h5RnFhVzVYTk9IZmVs?=
 =?utf-8?B?REk3eDUxZWgyZEtLRDRuOXhYMUpyMVRSMnd1VEtSaXUwUlFibWNvTFA4dkJF?=
 =?utf-8?B?NXRqSzRNRmd5TWhCZzg0bEtwVzFnTUJieEpSaWYxU2JRRmdJNFJOVjYzSWdz?=
 =?utf-8?B?ZHg0WUlXckNwMWVITFQwOEF3bUNKV0lscVBoL0hIWVlPdjRlRndqWWI0aGpn?=
 =?utf-8?B?U0MwTCtQUGF0c1ZpclFTMk5ENzgvbnk2bForVTVja3JRSW4zd1BOVGRHdUcv?=
 =?utf-8?B?bUdTV2hkUTQ3Y09vaWswdG1JRUpBcisxL0s0S0ZDZE12em9hSldJdEdjVFJh?=
 =?utf-8?B?bm1UVFV2Tk9rRjE3MVphR3Z4QVMydGs1dDl2TFRWZ0hBeDJnMG44OXJqalBM?=
 =?utf-8?B?Q2FvQkdxNlJVem8xamZLOFpJUHhwQ3NaRFBFejRmYUdGVStxVkxsdEpSbWtB?=
 =?utf-8?B?YjRMOFZrcWZPY3JOUGIvZzM5YjhIN3dkYjFjZU1kWmExNTZxUEZCQlQvZVdN?=
 =?utf-8?B?WWpvN1RHQTFoQ2lwNE1UR3VUSG55d3FaY2tlQ1Z0Qi9ld2xtK0hVQ2JCV3BY?=
 =?utf-8?Q?XJKp7FDHgvBDz68pimzX+k42y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557c5410-9042-45d9-da89-08dac3318837
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 15:37:53.3928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4t6Nb5lEK3su3d/cz0PZLuRqcwpeJqWcM7otDkQEY0LwjsNbcGqQYumLZlRWVbGlLePfZnc9G0K9jAJNfWvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

On 28.10.2022 13:41, Juergen Gross wrote:
> Today all users of notifier_from_errno() and notifier_to_errno() are
> Handling the success case the same way, by using
> 
>   !rc ? NOTIFY_DONE : notifier_from_errno(rc)
> 
> or
> 
>   (notifier_rc == NOTIFY_DONE) ? 0 : notifier_to_errno(notifier_rc);
> 
> Simplify the use cases by moving the handling of the success case into
> the functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



