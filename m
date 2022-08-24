Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E959F7E6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392380.630694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnj5-0005Jd-1w; Wed, 24 Aug 2022 10:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392380.630694; Wed, 24 Aug 2022 10:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnj4-0005He-VF; Wed, 24 Aug 2022 10:35:10 +0000
Received: by outflank-mailman (input) for mailman id 392380;
 Wed, 24 Aug 2022 10:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQnj2-0005HY-SP
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:35:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c110aae-2398-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:35:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6369.eurprd04.prod.outlook.com (2603:10a6:208:169::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 10:35:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 10:35:04 +0000
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
X-Inumbo-ID: 6c110aae-2398-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpTtecJW1cVut6dodSkBca8hCBvRgW1Gs2Zs5P/miZd/coXYqMZInHg4GHgvTVQJ0H8/+/8h2NSLmsjKqPJLpzNMlZhJusKjDG1wZsOBPTfMAN98l7K/x46v78KJbRjYmNee0q6QPjQ2fJx5bbUydGE8oR7yfNoOdGlO+6HXIZCYa2lXUgtBC6SsA0RW2HQREiDNa64LLnWbBx/IFWZeRCnIznq5t9ZlRr8IkRF14CTzjX7EN3LLjIAO/lITqHzvuvxPCqOGgkz02H7G413HH+jjC6KaN2BqsnuIxMyfDZBpWetuYjwYVVXwv8sK0oF4PFLbXhTdpDz49edI5HxstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGEKUeJzVOvF7VGb+YX3a3KvhIR3n0h0gLApfLqs+xc=;
 b=I5uhoHWZsKdTti6yvAOThXoNM/ZPWX989D/JtSSBc87ttkR0+Caedv3QIgMtoMBXWwS9DyZrI6uHL+JIlOOPSfe/xrMQUjFYoinPlNKU8qq4FB+s0Ov+2iiUJnqmeFg066z+bkNgGSpn17eegT6MxXfMd+Z3h0E6e+atkKavusMFU/l/Cg7dF2htow1iBW+9uknpGlUQX+1zBmjaMCktnusgzTHd1bXgdRQY1eilz1tE/HhgVVgr9bZ2QRBMWqn8p235RAZMPvO655/BVYM/PjkEh9GGMM1Lokh+x7iRm+C7qsmpg9amAIv+j3KZzu+QateFHZdPxnMMSgkjbFsymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGEKUeJzVOvF7VGb+YX3a3KvhIR3n0h0gLApfLqs+xc=;
 b=13c0cUZqNfNL/OyG6q4K1PrFzbQ8lppnxnKf/eTxnc0bFqBYNbEQtQVHhgRXQ++I295IE7U5H4WtemOz/xyCCB1o7zfqUKnmI1XH72HYY+agGhjSXkHVLYb0muET/X/+SjP1QWVBBSHQ4XyoJ4gI2SX2JULry5CTyk7bpt/ZjZzWLXedqaNOFsUn0IWtOXaW5yyr0uztMi8ByPbJDRDi95Ck4R4y/MtXE1dEw1BOOnb9aIedA4FJSfRPG914jlimEvkvbos7YtBFPgBqbL++eNMxUt6A/9ubCL8c6U89giKYN8cWOuaB1Gr3sR/XR3ti3nMZZ4RDyRAH0EQwVWD3Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
Date: Wed, 24 Aug 2022 12:35:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220824102225.11431-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824102225.11431-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b27fb34-746f-489f-66dd-08da85bc4eaf
X-MS-TrafficTypeDiagnostic: AM0PR04MB6369:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PwVo+jh+X++1+9+JYmrzlfAZX/w6cJFWfhwKoUmL7fHLLdorRu8t/ryz5Q6ZY7F8LVqVKIlhYKK5telxs5AJjNEKZUKfo/q4geFlpOhfhFNGK3/v8HsLFxt6F777bAf+0rlWMk09YFM5JTj8hwSj0NYWZyxHMZUqna2HFhgmHNmrFxbV7hoeU4UBpldvFv7g883VwYXN8dPJxZJaESgYVb/2exu4pIPlF4EDPo2iaD1Wv1UFs0d2eNzapYkEfy7pDVY8OIwUV0n87sXcoEQ4xp2IBnuiEVyPuIMz4gNRn+xXlxPMkJxC2Q+0T1h1iGhq8kSm16J7JmDiWPoMArzT4fdUarrgx0JlSMdLYqvS7ZJgokVaQVLxuIE9ychqmgSXenh9pFMZERmiNj4EkVUsoRfHWZ3BwPC/2O6CVIj4zFz/1coPD5sFIBHFOmBs2niqs0lFEONo9RUK+q9n12VN9WifTGdZzWZwUgFGrD2Isahv01pFDZaYxBV1zr3mIXq41BPagk3Ahuv3xkLYp68VWNR0iOTHwz59CkSQlYwAqLpB7W2JuMDZy188lXi7qiDDBzrM741EsX4DlzOCN7TyPFMf7BiWOdJYLziOMGS/w4UaE82Slgn8nsV8J+TNW+hLnWIn/cuLJqKihS21cbK/oi23XLn2AJssSNVoqUBg1zjtplBvaFafNbLIkrEuOd7yfxM3l0jUuI8vIdHHqlCuuD3QHpNTOBZbd0QOJVe8ukWRTRGdUpFJf+SCDVKl56PmGSy6M9axA0f0RsT+/GZ3UFZNmEHXISrpxTd6fdpFJ6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(36756003)(5660300002)(4744005)(8936002)(6862004)(2906002)(316002)(6636002)(6486002)(37006003)(54906003)(6512007)(478600001)(6506007)(53546011)(26005)(41300700001)(31696002)(86362001)(2616005)(186003)(66556008)(66476007)(4326008)(66946007)(8676002)(31686004)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THVqeUVzVVE4MFE3NHhnV1JSbG1GZlZEYTVsRWNuRVdUVm9NVkIyMzhRUlZW?=
 =?utf-8?B?ZzlSSTVhVUk4UWtuTFN4N3hyazVOQ1VXSVlrYmpmTlAydmNWS2ZsOXZJZXk5?=
 =?utf-8?B?NmxzcmEzRWJxb2FneTlhYlErbnhSTTdDOWlJU2ZmbFYzRGQzWEhSeDZYSFBJ?=
 =?utf-8?B?YW1GanlBQ0g0a3l1VzY3TTZFWWVsQVRzVGpqR3Y1ei9iNTdwek9SQjBMNDR4?=
 =?utf-8?B?R3VsOFhIa01qaEhJRWlLRmhrN0pBSVV6Q0RJNnNQS2pTMFFGRDI4YzUzR3Rh?=
 =?utf-8?B?S1pEMkV1YUNUNU0rNEhQUlQzVVRTUVJQZTkvZjYvSS8vdEptMnJHV3lYZVVu?=
 =?utf-8?B?NTdHR3lZeFJxRG9aU3R3SGl0T0ZZYTRYdlpZd3RjSkFqOVpFeUNWbEV3OWpU?=
 =?utf-8?B?Qm9VYUNjU25IVEducHpTVDdkN0ZaUmdVdWNEc2dBYm85ZzZmNXRwUW1QMzkr?=
 =?utf-8?B?TGFTUHd1aUNBYTJWZFpicDM1YkxFQTN0YU1YRE9OMklVYW1yeVdWVG53eE5a?=
 =?utf-8?B?cDdNb2IybEV3NHUzbXRXVHJuZ08wcS94RStmR3FjQndwM0RqWXhueDlPRVN3?=
 =?utf-8?B?WXpCZVJ6TGM0UW1hNXZvTDE0eVNJNW4veERuM2huQ1BuamgvWWF5aTh6YUNo?=
 =?utf-8?B?NnpmNWNiQndQWlFPdy9mSm9XTkVKN2tOcFpwUjViRXlZTWRNT1haRzcreHBT?=
 =?utf-8?B?Z2t5TjRpUm9CbXFtNWljaURzVnJpckMxa1lpOWJPcGt5VzRrdUhERVZZVzhm?=
 =?utf-8?B?VTdHYkxqbGpPTU5TUXk5c3NHQm5TT3J0aTlvWmVqZXNJT0c0MU1LNWY4ZXVP?=
 =?utf-8?B?MXFRM0ZoZ2N5dW5rS3VmQ2s5a0tPL0dYRkdPUjVFSDh0dzFmcXBCWitleUZh?=
 =?utf-8?B?bjdlbmxZN3BaRi94enJweVpVRWxNUnJnZlIvRWZxYkZiU0RYK01kV0xOQzM5?=
 =?utf-8?B?Rk1FcVhDeFJiY0p1NWVCY1BhWjZnZ01NNXhaTGNSbzRKNCtGZWR5VmxkNFpJ?=
 =?utf-8?B?eXR2V3lWY2thbXE2QzM2Vngzd1Z6cU8xSE92ZytQU1BaVmJ1bjNzSlJIaXl5?=
 =?utf-8?B?Q1FsemRJZHpBTFNpUzNoaXpsYWRGaWkwK0xwamRIZERsdEUvNmxHc05BQWFX?=
 =?utf-8?B?Yk5JZ3JJckh6MWNPOFNxT0Q3c08zb3ZRQTJkMGNqcnBxRXlPazJZUUFlQU41?=
 =?utf-8?B?bThxUER3Y0dTZGdML3VPTXFCcHZubGpMcHl5UzArd0pYSzdjblZQa29NZFdT?=
 =?utf-8?B?bFlsZnJqQ0RQTFZUbWRoRWpWcXROK0R3Slgxa0l2dDVrL0dvR3JHdkFhUkx2?=
 =?utf-8?B?ek5FbnMybXVURTZtVVFSajZySDJIbk9Md2lNcEkyRXAxYmhxU0ZwaTg3U09x?=
 =?utf-8?B?REtra2dXNmpMK3NsL0RlN3NZZXBoVDBOVWxiOTNLRmxZRXBwelZyQThJNkMz?=
 =?utf-8?B?OU91UWI4NUNnL0lPbFEyZnJQSjhla1ByQkFHQnhpelZNRzdTbEZ6eFVta2Zv?=
 =?utf-8?B?akJrUUhOL3l5U1gvdnVNNlZYQVJ2MGticDlSZExjTVZIbzhpczdGbitJYUVv?=
 =?utf-8?B?WGN5ZWJpWVA2a01SNXp0ZXpjUkRhV1VnejRockN3aXVTaDl4K2NTeFNEZktQ?=
 =?utf-8?B?b2lCajBGMWFzSmxYVHlKd2lnY3ZaKy8zdjNBZkc5b21uV2xpWEhTZE83NjRE?=
 =?utf-8?B?NTY5a2RGSzR3dWttVHFFVWlyNm5VOTFSME1CTTYrVXV5Z1NvNmZjUkl4VGtY?=
 =?utf-8?B?L1RUN2RSaDNWdjlVWDVueEVubjFoSHZNS1dwVUVJWjdUdWEvWUI2Tld4eXBx?=
 =?utf-8?B?OGFkMjdkVkh4alRUb2JvY1oxZ3lUZFBFZzkzcXp5a0hxdkZtUGpOeTd4NFpH?=
 =?utf-8?B?Ymp6V3U0NStvZ3BNLytHZzc2N2xUQzlyZlVvSDg4djVuZmRtSk9Ucnk4bUNw?=
 =?utf-8?B?L3kvNHlQRDZ6M2czOE9HRWpOb1Zwb3l0ZWpnZGdXek9DamlYOTdEUVdhemVP?=
 =?utf-8?B?TFVka0tmdVpVRUpwa0EvbDZOelRiT3VHd3BNMG9MRTlNby9zQU80N1M2WFVr?=
 =?utf-8?B?N3daWXhjQit2cVJEblpuV1RZRkkwdXJjMWwvbnZ4cUgxbzJoeGozSlFOR290?=
 =?utf-8?Q?DiIHYM2VyUHEYjF0oaYspLzkg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b27fb34-746f-489f-66dd-08da85bc4eaf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 10:35:04.9153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2gycTvR5pmu9wivOMRgZweH/J6MteJoHqRMMIOD3HUvbMmQMhgHJ+IV2NefNfqBb3DQ31MClIljEsoWdjOuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6369

On 24.08.2022 12:22, Juergen Gross wrote:
> Hitting an ASSERT_UNREACHABLE() is always wrong, so even in production
> builds a warning seems to be appropriate when hitting one.

I disagree, for two reasons: This violates the implication of NDEBUG
meaning ASSERT() and friends expand to no actual code. Plus if doing so
for ASSERT_UNREACHABLE(), why would we not do the same for ASSERT()?
There's a reason we have ASSERT() and friends and, independently,
WARN_ON() / BUG_ON() et al.

Jan

