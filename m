Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464B586B29
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 14:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378734.612097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUnt-0005vL-Pl; Mon, 01 Aug 2022 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378734.612097; Mon, 01 Aug 2022 12:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUnt-0005t0-MY; Mon, 01 Aug 2022 12:45:49 +0000
Received: by outflank-mailman (input) for mailman id 378734;
 Mon, 01 Aug 2022 12:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIUns-0005su-8y
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 12:45:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd51fd78-1197-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 14:45:47 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB8011.eurprd04.prod.outlook.com (2603:10a6:10:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 12:45:45 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 12:45:45 +0000
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
X-Inumbo-ID: dd51fd78-1197-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3wqfnXCAUztKALPovSJ3kA4zqWp4h7TlFfG3WoJtIPqU0t2eooWz+SVODRaEcQ8jBEzleZW0eQt28V4pUbECRNzjL6Rc8yQXNkTe3CACyDCRSSB0Wr1e5kU41kLJNGtTGL1k+U9nmmhS0leJono5uVuWJ92Wt+t2iQ+8skuVvtd4UrluRRuy8/xtQaZj2nTvNG5vqEI2YSyffl5NsNao2KqNzcrP4JHjnLMtqLrYqtC5+xhSVU/31fZh/G5RlmycKKqIrfcKtsvvZh+GrYIsCqWwHG/rNa4DS/jLp41AJxz1hJtK2S4vvqKQ9xOz1E3TBpV0oJz22iEGhU9+WJqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siy08G96/hQVj4Pmc8qKYMEEvMKp8fY8QPK976KrWco=;
 b=Q9Cmk2RBUeMKBgsQsEqD2zaF+JM+kNROtf/tOwVMGTnSnQKF2o6lemdDXjqlvO/lWPMlw2vFSQf0ICMQtsYPLzgkoPXH9x27nkmkkC7DeSJh5cXFX0C27Wto2W4PWZ/r/KVtLCEYjFwPjYjXk1kccVfB/VJ0tLdbhrwFJrPfvQrchnDiKB+xot0i4+1vGD64eUx6BWL5plgBawwHA3t6u5hfX//fZ3jy8Lmr9J+SaFmX+OnGh4949nNSq8i1i+xBtE64A1mpR4osghR/uWmDVyA8g1Mp9iVBO4YTn/H9tV1o5AW9WCV1EbD1K05n3O+j4MR/loWQk3t+zKS/+Vx/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siy08G96/hQVj4Pmc8qKYMEEvMKp8fY8QPK976KrWco=;
 b=z8SXX0A7MdI5n9F6SZEYzxV6GrOL0717GRCGZANF/KkR9N3be/3sGXShFzVXJiZ8EXvCAnDvOge8gjQO+2/dgvMhLPhZMMT36Xr2K8X0h+pZOdvr+3Q+41o0ozsW9uRlYvE7r/5Ah6fiSnwAbKj6bwG3sRmHbS9fZLhGzgwADVo7GaW0Ks0nZnbVUc9ciscCNC8o1D/fgK/dwwQPmWAQmjOY9zpOSPH/1sMaFPXqhS8XAx2K8A9lQ2ryIF1XFPirxw08GP33hZXRA1TC0MblnvvGaf++zv6VGQnz5E4+jLFvo7ZIBEufzHOF3ubCdzQbBpFmHHBFp6l3kFAxEzewzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f238138-3306-6155-4e37-de1d4f6ef6ea@suse.com>
Date: Mon, 1 Aug 2022 14:45:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/efi: efibind: fix MISRA C 2012 Directive 4.10
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220801122118.1673349-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220801122118.1673349-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0007.eurprd05.prod.outlook.com
 (2603:10a6:203:91::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: febdbcbc-d829-46bd-e56c-08da73bbc076
X-MS-TrafficTypeDiagnostic: DBBPR04MB8011:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aRRT3ACs8WDcpuOn//PTsKZ52sRPtpOl72jZSoe58Nh+ZOjpJrmt8qGYc+EzwDcGaGyM5mWGcoGHhiAOQc9KxbYZtWC0dFvVDZ+RmX1snjiXm8HISVuNg+Ne2LhUwVBzxfBUjAe3WGCicwCI1RCGsJQTAQChqr+YqTmPgMC/kxUUs0IVNBuMzx+SxuN+KoaMegMLNnE2/GGDb9DG8ZoZBXT3jo1rXrZ3l7ZvpC/+4ChNkzieNL5b3deVJHXsqSntFSTWU++mJADLeJn9BMtOZj06CGjiYbIKHGvoTuCzNfKW8YZWNbeDr6BF9TJKSgJJRDeQAKG9fZzRyv3kTiUqj5eDiiW76uCZAUYjq6kuecqQ81AL414raYSxUI1fSmaoj4hVL2c5hhs387Fr45wHzE506cZtbUgD9BZATpp0Vd8Bz6B3eksnSd72+N6V3k65ZdxLL478X9NKUseDKrTT2YwC3+RiFU30VRTJV4P/qyk8//DxL83ixwe2X2XLzk423vMLHdtfPTUx4A51c7iX6zZcyBT2U9maJYRFZKRuM8DZ8QU6prqQ6lQCAWXCgdCr6B8ChaLHMhtP6PPsUJxJXrENZQfMQlM4fYbHlrvYPbdfDx+XPcEwN/1mlYUlkowObaW3gYAgvabUqqsVgWj1AGDNlngjBr0aSG/LUYpBU08Dy11iXoVGNxggbcsYMVyZxzJv3GVulpn8OfdP9jiuIA3w/SLHzQi8S870Os6rgldANndubPiwJttd9eB1kZCvl/kkjj06f4uYE/ZaOd9v9mTKYju+1MJ6VpJVYfcbLOXmip8tPvffMBJkG0TFOp0afnyGrR85zYq4SdSlbd6xvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(396003)(39860400002)(136003)(346002)(6486002)(478600001)(316002)(83380400001)(4744005)(2906002)(66556008)(66946007)(54906003)(41300700001)(6916009)(5660300002)(8936002)(66476007)(31686004)(4326008)(8676002)(36756003)(6512007)(2616005)(86362001)(31696002)(53546011)(26005)(6506007)(186003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXM1WityTzZ6VmYzT2RpdmtLNmxyd0g5ZVJUWHZTOVR6UVRHelFDbk5BaGEv?=
 =?utf-8?B?MkpTeXNrMFFocm1odXJYVUQ5eXM0Q3FDOVQwakJsanZhYStOM2l5c1pLeVZV?=
 =?utf-8?B?V2lMdS93TEhFR0RpK2NVWXRuWTQxanYzQXFNMm5ZcGxoOTErbXFycUpRUUhq?=
 =?utf-8?B?VXZaRW1rZmpVWG85K29MTXNsQjVQUlBYbWxiMW5jSFlxLzhOSXhYazcyQmZq?=
 =?utf-8?B?NkpWY0tZYUtiMHhBdkQrS3E3cmhYTmNxUWEvVVJnQzZDNUFyRHE3aDhCWlVB?=
 =?utf-8?B?NUt5b01rdXFHWmNPQXpIYk5taktmeXlwbGx1cXF5S0hNT1Y4dUNBdkN3aEZC?=
 =?utf-8?B?VkFPaTIxOEpMMnRSSDg5Z3VqS1hJWlRmQUVRb2ppMGIzdUQ0Y08yUjgvSDVN?=
 =?utf-8?B?MjRnT08vcTFOUU5NVDFJTHI2SkdVYWl0M0NxSm5MYlhPZlhtL084UTB0YmFo?=
 =?utf-8?B?ZXVlbHpwZjJHbGkzNllvdWxtTGpXc1Bkb1Q5QUFFb25pMEZxc3hqWFJJbWxF?=
 =?utf-8?B?WUZqKzFqWnZsYkdHbmVKY21RMEtTZFl1amQ0WklFUmU1T0xFMkl6WG0ydklz?=
 =?utf-8?B?QW4xT08yYzZUck83bGRsbGpLK3R4cmpKby80TjV2OWQ1a25KVWJ4L051b1Fi?=
 =?utf-8?B?UVk2bXNqOG9JT2dQWFFRQmlZWDcvYjV4aWFNbit1ZGZwdmlNcFNMbm9OU0lt?=
 =?utf-8?B?aTBlUFVsbGJmYlJ0alAzRmhmZlhXeUJEb2E0dlR2SVk1emkza2p0Y1l0bUx0?=
 =?utf-8?B?NnZpZC9BVVRZdm5FQmtTL3pVd2srZmFHUCtOcDFSQTVIc3JUcVA0cDlzY01n?=
 =?utf-8?B?MktwcVdPajlLUnArcjFIUTZ2TlgxRTNUMHVkZzc1VEJ1bUlLUDcyYmtXMEtX?=
 =?utf-8?B?VTJWeElnZXhrYXBOQVRkbmRPcktxZ2RpQS9UN3M1WXFkVGkyK0Evd1luMUYr?=
 =?utf-8?B?aG9CcGtBazZlaXAwanN0RU5kNXZ0MlplQnlxbEpHNFZPMExNSy9zTEhKdUVF?=
 =?utf-8?B?MWx0OFFZQjBTY256eExWd212Z2VDZnM3Zk1OZWU1TnJxcTRSWkpHSzBBcThn?=
 =?utf-8?B?RUE5MTdQaDRMMlRNMGJ0RWcvQ0JwcjdVdFRaNmZqdjJwWW40MTZjeFZzRGNs?=
 =?utf-8?B?MlNvNkRqcUowTGpMbHVReVZyWUdPemY0VUErN0xYYW1samFtTllGdERLNE1X?=
 =?utf-8?B?Q1hnamJKVFZId2xQZUx6bHV3dThnR0ZiN0hKVjg0MzVaWi9kYURTcHd1UkVJ?=
 =?utf-8?B?VFFPTUN0NVlxSDlJSkRKWEhFMlFONnZhbXBYSkFlMzFhWGo1ZnhUeWNUQTR4?=
 =?utf-8?B?OTZTT2cwejNKa294d3FENWgxSSsybUlvdXRXK1ZrM09Cd3RCQW1sdmRabnhG?=
 =?utf-8?B?ajVQbTVJSXZCUjI1NG5IZnpNT1JXbDNIS2g5SGV0ZENLYU9jS3RHakttTlhO?=
 =?utf-8?B?UER3NEd1YmpKZ1Izem9IUTc4Ym5SK0ViLzd3cGlZT0l1ZnB2ZHlyVTNCbGpn?=
 =?utf-8?B?L0JPRmVzdzM2c3N2SHpzVEcwYXd0SFhCeXdHcHNqMHBJZjJrSnRYdjlzZjJo?=
 =?utf-8?B?ekp2Vy9DVTZuZUZhTnNIdjhWVldIUlFtTHRNTElPdEZCQWV6dE40OFc5RW4w?=
 =?utf-8?B?LzN0VXQ5Y1NMUDg5VjV1QjVDa2RSU1lCeHBBTTFueTZLalhmQ2w5blpmbVc4?=
 =?utf-8?B?R25MamRNeExBa09SY05BakhjVFJDd0c1cFV3U1AvNmVFS00rQ01tZjZuYkI3?=
 =?utf-8?B?dWN4V1VSTjc0RmVNSGlTU1oxMVF6a1Z2VjJBTVY2aXkvRExCT2cwb0dra20r?=
 =?utf-8?B?eElxUWQ0emR1OXA5V1ZOZU9TRzNMR2Q1cUtsR0VhYWZkR21lSXBURXhWWnZW?=
 =?utf-8?B?Q0x2RExQUFZ4RUdnTitiUncxSFowSEhxQjlDNE8rWXZCa20vUlpLeDZaOE1y?=
 =?utf-8?B?d3l6WUlhNU5MQ1g1b0QrdXVIQTlPZXBjZ0cyN2ZxUGZUMkVzU2tKM3RybE4r?=
 =?utf-8?B?OHQyTWJYR0w2Y3Q5UTZVOEZsUW5LUGdxUFpTUmY1ajhub3RoU0xVU1VBSnZE?=
 =?utf-8?B?a21LTG45Q0ZjU1IzdXo3M3ZDbWJ0ZVNudmN4WFZFeFZkaUN4cXcvYjBuUUpF?=
 =?utf-8?Q?jzsatZXOcUpQe8GXVnQpoOlOE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febdbcbc-d829-46bd-e56c-08da73bbc076
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 12:45:45.2379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Yv7JUGY7EggmmzEe+SKUCc/mQWsk+u9A+26dP12qMltYft/q70e7aJp9ttpsF+ZLR2R1KJUGoHpnZ4We0voUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8011

On 01.08.2022 14:21, Xenia Ragiadakou wrote:
> Prevent header file from being included more than once by adding ifndef guard.
> 
> In order to be close to gnu-efi code
> - for x86_64, use the same guard
> - for arm64, that there is no guard in gnu-efi, for consistency,
> use a similar format and position to the x86_64 guard
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


