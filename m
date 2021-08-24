Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195EA3F5D39
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171254.312526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUnO-0007hW-Qz; Tue, 24 Aug 2021 11:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171254.312526; Tue, 24 Aug 2021 11:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUnO-0007fe-Nb; Tue, 24 Aug 2021 11:40:46 +0000
Received: by outflank-mailman (input) for mailman id 171254;
 Tue, 24 Aug 2021 11:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIUnN-0007fY-Of
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:40:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdf65b0e-eea7-40cd-9916-bd1cf6dcc370;
 Tue, 24 Aug 2021 11:40:44 +0000 (UTC)
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
X-Inumbo-ID: cdf65b0e-eea7-40cd-9916-bd1cf6dcc370
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629805244;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Uoabe4B8/+aFCcrn+3Y8i+nKAfV1baY5lduepoRvWDw=;
  b=ZbWMWdhLFpAKpQ8IKv5VTRnBjW4mlJ75zeB4LFBbdO5D4T/SVG6J3QiW
   934TR/g/tlU118qWtgALJ7NMCGtCDr74iPrUoelXYKY+Q3iCOEYxjMmRt
   MTrabP7OSx73UOkfCdlDLOtWN29+tzbmABbMQmjMNzPYSjdGJaNJoUV+M
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ftvs9FKHZst2zFUwFzoZZXtcmRoPb9CpggDswphX7RS+tzpFDMCMPBBRbrLLVifaWaqKXeWsWi
 E8lSmquO7u8Ct3oU1QRUQs1IdTA/1M6kUFQe7Ni3LRrrP5bu1YApGyBl2VAaTW+e6eARKUP/nZ
 2o5DPmveiqyy+YWdWTT17q1yh4All923IUuno9BaX2OmQD5kcfyejX+Q3F7o4cWdt3T2/FUXw7
 495wAIvqgUK5fEvglzPu134FGGD5cIhFOTeIOFasj4K5xz0OX8TSAhU70dV8EU/mkxkugOoGnK
 /aszzCEhwn12O3XMhHKKEwo3
X-SBRS: 5.1
X-MesageID: 51133618
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1yGcYKjQPU2nTGlyniYvyQtP/nBQX1913DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkZNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGZ2IrT0JbTpzencGNTWubqBJdq
 Z0iPA3wgZINU5nFfhSURI+Lpb+TpDw5dzbiVlsPW9Q1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVkza71eUXpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qt5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwblUdxPIgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTp2Y3a/paVJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHiuHV1ytDEZAVwIv6/eDlEhiWp6UkRoJggpHFonfD3301wt67VcqM0o9
 gtac9T5elzpqZ8V9MPOA8DKfHHQFAlDyi8a157jDzcZeg60kn22urKCYMOlaqXkawzve4Pca
 v6ISRlXE4JCg7T4J61rdJ2Gi6kehT0Yd2q8LAF26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51133618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXQImHBh0PjyLtLVbsMGrMvwdtsmHVRK4OXhZKIqfKGYyIuOqkGmPXAWQygg7vQ3KCHLeRg4pv9GQFqCdd+OCyOuX2QHE3ilF2h+JjW1gwQeEQUPppRbPJ8/gTyuERra1TuYvccLOt41T8t7ogJLzOCfq9X6QZp5Udlva8pO/wzF3LXflfsc/Y0vxy5C6tI5cNBZw87D8lH2ZVd5auJAQWe3EeHPpy2wwT2NKCpm5sowb/tAsfgLrbWrpBIgln7xahzYlY/tzuKRfTF7/BY2o+n1FBCK/DlsgFfn/jFz0VMCiabP8kBSxoa0vLlGhxS84MGgi6urCG4NWNB7V8L94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG/fbwnPrTM30Rkgzh56dT24dm44KQsvFp/l9APT/dk=;
 b=e3AOu5/yAmr1UbUjF9II+OhSyFLnQDUq0B9xMDF6MEDBu5LefihkIiGKoJruq8CaSOsd1YOlqpHDvWaHxpmbKNk74Yrq8fTz/J9zk0e4OSH9HIR794B99KqMdv+ZTAELrGXncTZ90vfRwcTPYdqnVNpd0+rvR/zXO6wAoRYsnti9UMtaKRwkBpuQNT3j+dqcfLjZRM42dXj+3rWEQ+Q5sfFG1YAp+mzZ/2Tx+Cfqq+CDVT15Z0WudWErIE/oqCd+n1Gi1S0CokuhuPNixotnuoJ4IsPCXeZ/iywb//QPybwYlkfjv/RUhBqPsUhX50B0tGBML6QChS/jCPTGG26smQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG/fbwnPrTM30Rkgzh56dT24dm44KQsvFp/l9APT/dk=;
 b=omYlIyVGCtli5ODq+EKxU7Avucw/hYQdo96vhP2Cx0Gs8Q8XUQIMnWo5M4IPLXXUnUpmPtcINacq1eb4+Xbse9z0hL4hlU2s0iV181ctTc9EjJUGj5dGAXypfRONnNp1TDQ30A46yzmXAB2JB/R16yY6GLBOSkJrI2Gi+t51nnw=
Subject: Re: [PATCH v3 6/6] x86: change asm/debugger.h to xen/debugger.h
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <f341cf43ec2fb32a78d92265740e595f56fa76ae.1629315874.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a49192e-6557-64f0-2314-d45f82d9a6b9@citrix.com>
Date: Tue, 24 Aug 2021 12:40:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f341cf43ec2fb32a78d92265740e595f56fa76ae.1629315874.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec992db1-a570-4da6-112c-08d966f3ed45
X-MS-TrafficTypeDiagnostic: BY5PR03MB4999:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49995EB529474485035F4EE5BAC59@BY5PR03MB4999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MUDitez1gza001K6moJrcq9mN1i0n3G+LRGIhkWdh2uu91FBLMXVNwnm+WejqqhVnZVQW1W/kgUX15wG37gg8s41hZsDaAOTL3jdImDbuPQJ/LvTi0iBBQQSWSVgKLu1PF4p5Pn5ls/0RIytbuthF+PTls80BJXtJw//WUm8SDh9Tp9ETGz8t1aVj1gLAuGqGgaeDqc4OvSdKjUf9/y3JSB5Ep9Eh6iSOTNHv7JpGkfhsSTobhqh0rvKHA6igUx/5pOtxWeyi4OZNG46WIP9Km4hHUKFjyhnQjZv0U3Q10gA8DEgEdwvv0TrpbEsBP3zj0XewU9F5xFFpG2BXCX4CJIi22gDDhrBPruWdj+tVslmMo1K4pm4NrjId5uC3/tkKm/wAkvei0Asc/6I6lU/6dKOi1h+Klh1VQj6MhLjmRtq0vjOzfb8wLSjuej2Py+BEMSLi/wbB0YkporyU58E0k/pkSuFX4bv+bFY+tizqtgLbKynhhEyKM74LIJz2gTs6asUkdl6ng7qn+mXirG5CeuQKSyRoFviY4p1QO24p6PDWLaPksRsr60+Xdws8h6qUkCvjmXtxVcO7IU/7PTzu6Mvbt5h4Lra0bEpbBYGQQ9I5jBQ5dqyxRKCerjuMnEAdK6iGcNd8PXoExvcJHYFoLbsyPcqFSoUX5kgicigzhfv5AYuUbT5W0Rwf32t92W/ev+muQef4x00Fa1Vtjg6jHPfX8o0xuLUR8aZg7ZMBXadIMY7ItApaxzzSGI8PHzEqi50uAXX+gLPlj2lvqV8LQS5rYg+lg33qjRo/0cTfll72pqEaGSUpdAHthDjD8S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(956004)(2616005)(478600001)(7416002)(38100700002)(2906002)(8936002)(36756003)(6486002)(316002)(5660300002)(86362001)(31696002)(66556008)(6666004)(4326008)(66476007)(31686004)(54906003)(53546011)(186003)(26005)(55236004)(8676002)(83380400001)(66946007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhlVFc2ODhoWUh1dkw1ZWZiU05ZSjhIaE1vN2c3VCtGdjhXazVNZTZUci9B?=
 =?utf-8?B?NjhIMDhWeFQzUUhRbDdRRXhKd29uajdSQkhIemlObjA4Y1NnNGhSNDBXeUt3?=
 =?utf-8?B?QjVUbXVFYk9QMGtoVEs2NTdlNk9mZWdJQk82UVpnR0dOZUxiK3YyMTVlSW1Q?=
 =?utf-8?B?NDJBaWpidHhReUtOVzJBby82Y0hSTkN6SVIvcmxtMFJaK21kaFhUOCtYVGtG?=
 =?utf-8?B?RjcvMWhMWElCeXpYU25kRDdzTGFzOVdLNlRCRC9jUG5YaHBCcFBaTEFyZVhN?=
 =?utf-8?B?WU0rWWRUc0xzcG44WWxjbWJKZlZpU3JDeHJ0TWh5dTljYjNKTEpuSW5UYlha?=
 =?utf-8?B?OW1CcStiQzNUVVRIRWZFbmhtUGxtRGxzZS9nM3h1Q0cwQjQ3bEZBYnh4S1FX?=
 =?utf-8?B?WU9LMmJ6WWhwS0dOTENsN2ZpdjFrR1FzZ24xRFpjQlVCT29SZTBMNzUwMDY2?=
 =?utf-8?B?K2h5bWN0d0NqdEtvWTk5QkphWVo0SDRudWlPbzdPS3MxOHllaEdwTnpFVFJB?=
 =?utf-8?B?ZWxUcjBIbGVjYzdESE1GT2UrR3VMSGhDOXZmcjV5VzBXa2hYSStvWmd4ZFc0?=
 =?utf-8?B?d0ZlcEViZkNTT3JMV1BPbm43VzYyTGFwNmMra0FLL2I5VFZ6M21QSHFnT0d6?=
 =?utf-8?B?NVNaODZzekxRU1ltdEl4UkRpSVdBM29WaXNhVDVMSUd4QWUzb2R1eVVmNzRW?=
 =?utf-8?B?MDRJcWVMeGJlTWJvNkZacVNDYldOYUNVampXY3J4RG9GWXJta1pWWjB4MFp2?=
 =?utf-8?B?Mkl4bnVZc2I0ZU9GaVhNZjZBenlpRDZCK1ZuYy9hWURDRW1IQXlmWDhyYVpO?=
 =?utf-8?B?djNycmlMUE53ZTdicVRFUGVnRVNzTGVyQ2FOTnducWxJZkxXRk9LNXBXczlN?=
 =?utf-8?B?OXlnMDJ2TnZ1Z2ZKSWc4SVNoQUVYMUFQbEthTitVTmVaNHVpSGNZdTBtbVJQ?=
 =?utf-8?B?YTY2ei9LZ2FrTXdJWUU4L0lWR21NSFZvTzNOQmFVMWVwWms1aEtGM1U5dW1K?=
 =?utf-8?B?VUNsQkpLQ0g4c203VkdocERnTHNJeGlYN1Y3c2pBNkcxd1pyUVJYQUdKRDd0?=
 =?utf-8?B?Nm5GY0gwRlNkV1J6NnBLaXprbTNsQkJLYU15Ynd5REsrZXpYa1ZFdDBlVHQz?=
 =?utf-8?B?M0VYelBXV3pVZG5heGxMQVVPa3Bkc2djNndMbjFINEhLY2JZWVByaGs5NFFV?=
 =?utf-8?B?d3hyR1dLSitHRDZPbGIxdExwUVpLYVZCakVmTE83Y2ZLTWpMOGhRL2hKeE1Y?=
 =?utf-8?B?RHRKbHo5WURVb05taTF4d0Z6UG5JVFZtZUx2SFo3eDRPMTdFQmJpeG5yQ3FG?=
 =?utf-8?B?RUc0TEVHOElJZGxIQVQrWmIwamloWHFvc2tiZ2l5d1dmQitZQVRjTmltQm5u?=
 =?utf-8?B?clZFTElXRTBjWjlrUlI2WmxFRUFqckgzOUR6aVE3UUs5Q2tEYURBcjRlY1c0?=
 =?utf-8?B?elprblNsZlBOejBTdkkwcDZMS25EUnQ1VjJhZHplMHF1eVY5YmxzbUdYOXdm?=
 =?utf-8?B?YURHNWJsa2Z3WWdxZFRLTWo3RE1UMmJ6SFlKT2ZycE84ZEFlaCtrcXd2VkZu?=
 =?utf-8?B?dVNiOXV3NTlxa3ZUbDBRU2xKaTM1Q0lKMmdidTZvK1AwLzhYdS9ONkZhUzhN?=
 =?utf-8?B?TkhELzN1OGNYSzJqZFN3bUIwcXRMeUFzSVV6aDJYUmhUbWFBNktzYmlyMjY0?=
 =?utf-8?B?bDVMSytLZE83eDJld21GaXEzZ1ZwRWxLdmN3aFlKTjhsNDZ3Z0hLbEhtVmJj?=
 =?utf-8?Q?bBwjl8NAxqd1+5+UvkVY9tPYvcZSmdH4IZsNXYp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec992db1-a570-4da6-112c-08d966f3ed45
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:40:09.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6MwUyhUq/mw8pfHW46TuDuuOlaKN7/LYIkosGk0HYy0MighSTCJRjNeQ+zeu9Iu6MkCRII5s21VRUYU7howsJIXl+ZcRvDNfgYC9e+G9Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999
X-OriginatorOrg: citrix.com

On 18/08/2021 21:29, Bobby Eshleman wrote:
> diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
> new file mode 100644
> index 0000000000..166fad9d2e
> --- /dev/null
> +++ b/xen/include/xen/debugger.h
> @@ -0,0 +1,51 @@
> +/******************************************************************************
> + * Generic hooks into arch-dependent Xen.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Each debugger should define two functions here:
> + *
> + * 1. debugger_trap_fatal():
> + *  Called when Xen is about to give up and crash. Typically you will use this
> + *  hook to drop into a debug session. It can also be used to hook off
> + *  deliberately caused traps (which you then handle and return non-zero).
> + *
> + * 2. debugger_trap_immediate():
> + *  Called if we want to drop into a debugger now.  This is essentially the
> + *  same as debugger_trap_fatal, except that we use the current register state
> + *  rather than the state which was in effect when we took the trap.
> + *  For example: if we're dying because of an unhandled exception, we call
> + *  debugger_trap_fatal; if we're dying because of a panic() we call
> + *  debugger_trap_immediate().
> + */
> +
> +#ifndef __XEN_DEBUGGER_H__
> +#define __XEN_DEBUGGER_H__
> +
> +#ifdef CONFIG_CRASH_DEBUG
> +
> +#include <asm/debugger.h>
> +
> +#else
> +
> +#include <asm/regs.h>

This include should be deleted, and replaced with simply

struct cpu_user_regs;

~Andrew

> +
> +static inline bool debugger_trap_fatal(
> +    unsigned int vector, const struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +static inline void debugger_trap_immediate(void)
> +{
> +}
> +
> +#endif /* CONFIG_CRASH_DEBUG */
> +
> +#endif /* __XEN_DEBUGGER_H__ */


