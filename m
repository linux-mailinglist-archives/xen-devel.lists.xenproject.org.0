Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CE4E2811
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 14:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292999.497642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIPt-0005Tf-Go; Mon, 21 Mar 2022 13:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292999.497642; Mon, 21 Mar 2022 13:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIPt-0005Rq-DV; Mon, 21 Mar 2022 13:49:49 +0000
Received: by outflank-mailman (input) for mailman id 292999;
 Mon, 21 Mar 2022 13:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWIPr-0005Rj-EB
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 13:49:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f13f83-a91d-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 14:49:44 +0100 (CET)
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
X-Inumbo-ID: c2f13f83-a91d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647870584;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7QK8byW02Wtfu9bdkdjis1zeyUXdiJhL2fR6gBRWUoQ=;
  b=Sj2wRimr0igImfye0bveqzXvUC1VRSO7prJCxVFg6bYm1S9lAScY8aHy
   i1rnVhrMLuWl7kSuog5c0edIXQwilq9YLZHC7sh2c54YOLT+Xp9DGoEFP
   ensvttOj1weR1QmsSIAjO4+iQ6CiZ4MewgSZtFZ3kXDVrOl3WGgUVDB9G
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66683744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qOKiGq8p4CZ+XAFse+SbDrUDq36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WMbUD2BPfqJZTb2fo1ybYyzp0JTvJbSnN9qGgJkpCw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZb3QCokb6GTpKMyDxl8SgNvGrZUv6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4QQ6aFO
 JZFAdZpRBvLYTMfY3UXM58vw7n5hCLyUWN39mvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmLfSQF+Qp7vLkXSdZSgxdE0TQjQWChRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7Ya1UwYnY1RvHNEghBHFb5IehtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S/RY29D6mEN4EfCnSUSONg1HszDXN8Iki3yBR8+U3BE
 cnznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMDp4WqGLnu95JdANcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSdzHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:uNKxz6Eb9je8vb4tpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66683744"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMpT6+Z+0gGcuXaaX+8+F6qD7Ci8K89+LMhFuADWNsNwZqd3Kf1v2vPi8EgvZtrm6C2FiUvmecl0CVeaij9NznxwO5AaBDeTL4CcxPAl/Pt8jlSnZJu3TJlY7Wkw+G0Ncr9Br0kHw5CPUsjdm8/AlAujRNyfWW7FLjqOQwrHwyyfxLFayLZImdZ9Fuo/3jW94yAZWeWqhSRrH1aummnUliPnPWCC/6iPYcsDG4IPxIT8N4HQOFO4H6hc74lAPKkWm4aZ4lCFX7RjGloQt89CB4oLgbpEHfSJGQnCGIvmWJqolMiABF0xsIzMhjnwY2S0/qmFh3DnOaJFT9jJPW7tfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr2mzsHIC2QfZ1LDBPA4YxmJvMuHMcmE/zp3ADhDDY0=;
 b=dIrG4JvGpFa8hjRt7NKB/PAlb68BRNYDCnHdMcBc4gzAI40xsBHOWVlBceu/Pevbry0C8wPWuVZUtWueYuh6tm6/5nCOrC9vOoEkJG7QDQhabJy5TLEBL5WABxhIlw04cr10nxTVzJmOXAxwh+4RHFGbeme/Mdgvp8ZgF3j6AEPkgrTrg2uLdG1jrsZuOS6skUDLdfyj3Pzh4ilULlVItLxr1M+0klcmyCX6c5ifvA5HGGKJIZICmszBQhpCG1tV2WiIAtdAvVzh8fE/d9rRiKZlH6mecdQ+BdYDhYttimgx8UlonY3ED9hWB+f1VPZuiOdbsAD2JfmV6ZGLyUWHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr2mzsHIC2QfZ1LDBPA4YxmJvMuHMcmE/zp3ADhDDY0=;
 b=PMMlg0YRb2YhrnxeFBVAjekWiFGDBYuHGNABiWV4oEDGiex06OLRmN/n71PVKHDWO3bKAGT4fzTkYkbqy3AtAI3k2OzqqKHZtgl7CVhb7bzh9MQXLw15tey62BlLwWq2BVt3jOT3TmpQalu6KMMmNdl76pFWbKHs9pZ7EHBZKEw=
Date: Mon, 21 Mar 2022 14:49:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] codeql: add support for analyzing C, Python and Go
Message-ID: <YjiCbCYmbS8kBtTA@Air-de-Roger>
References: <20220307164552.74818-1-roger.pau@citrix.com>
 <YjhLY1Wb4HF39gIC@Air-de-Roger>
 <abc6f071-694f-9b4c-1764-7b74d9d55185@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abc6f071-694f-9b4c-1764-7b74d9d55185@citrix.com>
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae9edc4-6575-4b56-3194-08da0b41a429
X-MS-TrafficTypeDiagnostic: MWHPR03MB2704:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2704D53B492AC0366843BB7B8F169@MWHPR03MB2704.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqk0Um/tTKGafeaKvkAh0tHwJuhmkcsZkTT3qiFHnB1DQqm6CBX1gt9Pu9KOXGIBGyhCPAnKqtGDs8ceaJIQ5s/xa+wgCekfkubfNA2Sk7+2/PtPNygPR6HFKe5QEqd7ZdgpsQBXe8Y266dMiqfhrsqOMX7760pfhzVgJNMPQJGMV7XYIc50nG2xPdtKGAqsh0O8BggioFJk7BYbekis/f83rfkkOxksqXGVCv1U0xjWc+IjC4WLd35AFo40hB+Ru4ONLy+CGuNHcWfzAtkHXvvZiTifBo0pZl+oUrEajKIxZxPK7xDF1DfTZITtCsjMYMs7QPB1ksGVqqlTGGj27VLRjHL5OaJK9OXYLanOWv8FnMZD8GOd25ycHs1oZ2XjXYkifOQMkxZ8iqMD6ZZx9L8s6ckCryMun9xqw3rC8W2Ee9PN1nzLvcF41QI2y2cg2Cv2Myj420B5j7p4sutEnAP5cEIA9YRFW44Im8JvppKcb+boW9RiPAJDoU22HMYVbT206gMMGG+u31k+b272pG7yeovpxinZvGoXQ/RcZ+tXeknzMwDQk7irWib1MGiANI0kRzykOaMuUe4P752H7GiVrwOEPmiQOCsIeR3eV8gD+mWJrXRD0NsO+I4iwwrQAVZEQMTxu6f3Bu86rmLSNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(5660300002)(86362001)(6636002)(316002)(54906003)(83380400001)(85182001)(33716001)(6666004)(6506007)(53546011)(4326008)(66476007)(6862004)(66946007)(82960400001)(66556008)(6486002)(26005)(186003)(8936002)(508600001)(38100700002)(6512007)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZ0YUlnL3g4TWhTWHRBTDlkZDd6eGlqRVVFR0laTjBpR2F1WWU5VFFOZitT?=
 =?utf-8?B?aC9rRmgxd2JiQUFWWFoxY3orUUkvL3BZdXRKSFh0V05LTmJONVlvWktVM3B1?=
 =?utf-8?B?VzlScXkrU1JNYjBsMDZFb1cvQUZ4dWVBTjNqcmlRR2NjSzJFT081ZUZuTzFL?=
 =?utf-8?B?aFhxL1FEbmtvSTNVYUI5S0xyNkJUMk5TU0xuZFhFZ0VJZGp3eGdqYVRWTG83?=
 =?utf-8?B?Wkpzb2RJRk91cUFvR0Y4YUxuWE1wZWxIVi9jQU0yd2hCclhVRXI5M0RWNXN3?=
 =?utf-8?B?MGpKYWprbXpzOXRFTk5QMVVBRktRMHNYU1B6U0Zxc08rbXlvc1M2dmtFRkQx?=
 =?utf-8?B?djluOWQ5ODBHTjQvL0hXSWdGemhkM3RUWDBML1I5RjA4WHRrQS9EeFFkWVVO?=
 =?utf-8?B?SjU1eVZpSjlWS0FqWWNzdEdQSEVlU1FmSWNYdkwrQkRFdjdzazNDc1hmOHZt?=
 =?utf-8?B?ZzNXUGJFSVZ6ZTFRSlFpQzBRbFZYTmN0blY0K1pXeERHM1J5UXNhZG5YZDdJ?=
 =?utf-8?B?Y2YxSmtLSGgxTk9iVEZ0TXJVSkc2RUUzSkxhaDE2VlZ2c3lyd3FJU3JmczBZ?=
 =?utf-8?B?VGxkUHpsc1ZTK1o4aWQyYnNhSmVkQ1JCN0dzbGk5TjlLT0R6RkZqZTBPTEI5?=
 =?utf-8?B?S2ZheS9LM3NqZ1RER1VPTm5RY3lpOGZreDZuckgvcHFjelRCSVdWc1ViTHZa?=
 =?utf-8?B?NmFMNm5FaEhYRHhra3MzZzJNRjU2MVloTXlFK3pMRW13ODVyOUNFQTdwbWNE?=
 =?utf-8?B?Y2ltOGhkRkgySmwwUVg2aVd1dGpWTjNMOE9BR3dYeVNZbGZWcDNkRFY1eEs2?=
 =?utf-8?B?cWFRSmkrQktHY2Fqa0pVZVlzaFJIODNhdktBdWRCWWh4Nk5RNytxTnhUamRO?=
 =?utf-8?B?RHE5dEFIT3hwa1VqRmtVbGFieFNFTzdHVUo1QTBKZGdQY1JOYkhQeE51VDNG?=
 =?utf-8?B?M1E2elRLYzFYb2lzM0hrQWVBVEZjYStENXZJSktadTRRekk4MVR3RTUxRkJk?=
 =?utf-8?B?b0RERCtudGtZR1JoWVNNU1FXM294MmtKemVueGxUbmQ4Nk11OGF3bXhIMDc5?=
 =?utf-8?B?WU12SnNXMG9iRENLS0ZUSkVvTkNHcVFtdkcwMG9vTGVYUEk4T2J5cTIrZWNt?=
 =?utf-8?B?akh1cjZOVHR2OVltV2ZucUwzNThRbm9PbUJhUjF6dXpybkJsUFVUcU10ai9K?=
 =?utf-8?B?RFY3cGI5eXNvdUV1RW1yWWxPRWJyUkZ3UTNuWVdrUXRNWGhyNXoxU3hRUTAz?=
 =?utf-8?B?dHJtVWRpSXoya1dMejdIVTZYcUtScnRCUCs0OEhKakFiWmVzbUN2eStMdHo0?=
 =?utf-8?B?UnhSYWE5c1RtbHhpeEFOcnJ6OGdJcXBHWnFrVzVuNXphcXlETHNIWnk4TXE0?=
 =?utf-8?B?S1F5Tm51RXBadU1hMldDY1Y2b0hCL2NDV2dleWRBMUZLUlNKVVUzVVJPdE1O?=
 =?utf-8?B?YWVTQWZkMythMmMvMVErYlZDTk5YWXRrMnNqL3FBU0xaS3YxSWFSd0U2djU1?=
 =?utf-8?B?SDJSakQrTW95SmxoeHFjaUE1blNtOHo1TUVZV3h6UjVvaGtJcDRNQ2VxN1Qz?=
 =?utf-8?B?bnRxOXB1d3dOWlZMRi9kMnlLWmE3RWNCMS81YkhvbEFTRlNQdG5JMlUwcEVa?=
 =?utf-8?B?U3JYc2RJYS9uR0JqWTR0TXA2ZTJ3T3Zkd2lkY0ZQMExTVjZQNVNZTlFkLy92?=
 =?utf-8?B?VnJhUkN2M2tEVnpHajdhWm5hL2gydEgrS0dvWnppVk1IbjZwZUhQd0VoekJm?=
 =?utf-8?B?bnQrRkhmSit3ZG96SWwycURBNHduRmNJSXFtbG1UWld2K3JwODJDTktCZE9H?=
 =?utf-8?B?eVBlenNLTHR0eDhpU1plc1lMVXFkcTl3SitQOEJ1Zm4vZWRMQXdGY0NsQ1o1?=
 =?utf-8?B?Sk1Ld1FTSGJwdmpJOVVSUTZoZlVZMVI1K01MNUY3U1N2L0VNL3R6Zi9lZGNj?=
 =?utf-8?Q?N+YOPQPDwEDizb5vL5HccXwkDbyqaU33?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae9edc4-6575-4b56-3194-08da0b41a429
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 13:49:38.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRQ6ybMu97zTa91EZ6E8mV6eBBeEClKiPZF1HuyzvaNYI1VYlcCATNrrBjNxbqV9X4q1XZc7XGbalNTRUJ6Kww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2704
X-OriginatorOrg: citrix.com

On Mon, Mar 21, 2022 at 01:02:30PM +0000, Andrew Cooper wrote:
> On 21/03/2022 09:54, Roger Pau Monné wrote:
> 
> Ping?
> 
> On Mon, Mar 07, 2022 at 05:45:52PM +0100, Roger Pau Monne wrote:
> 
> 
> Introduce CodeQL support for Xen and analyze the C, Python and Go
> files.
> 
> Note than when analyzing Python or Go we avoid building the hypervisor
> and only build the tools.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com><mailto:andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com><mailto:roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Rename to note it's x86 specific right now.
>  - Merge the ignored path patch.
> ---
> It's my understanding that we need to force the checkout action to
> fetch 'staging' branch, or else for the scheduled runs we would end up
> picking the current default branch (master).
> 
> Forcing to staging necessary due to a limitation in Coverity.
> 
> CodeQL explicitly can cope with multiple branches, so when a user asks for a specific branch, they'd better get a run on the branch they asked for, not have it forced to staging.
> 
> It also breaks any fork which has a different default branch.
> 
> 
> 
> 
> Maybe we want to remove the scheduled action and just rely on pushes
> and manually triggered workflows?
> ---
>  .github/codeql/codeql-config.yml |  3 ++
>  .github/workflows/codeql-x86.yml | 60 ++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 .github/codeql/codeql-config.yml
>  create mode 100644 .github/workflows/codeql-x86.yml
> 
> diff --git a/.github/codeql/codeql-config.yml b/.github/codeql/codeql-config.yml
> new file mode 100644
> index 0000000000..721640c2a5
> --- /dev/null
> +++ b/.github/codeql/codeql-config.yml
> @@ -0,0 +1,3 @@
> +paths-ignore:
> +  - xen/tools/kconfig
> +  - tools/firmware/xen-dir/xen-root/xen/tools/kconfig
> 
> From actually running this:
> 
> Annotations
> 2 warnings
> analyse (go)
> The "paths"/"paths-ignore" fields of the config only have effect for JavaScript, Python, and Ruby
> analyse (cpp)
> The "paths"/"paths-ignore" fields of the config only have effect for JavaScript, Python, and Ruby
> 
> So this obviously can't be used like this.  You'll have to add them to the prebuild step.

Right, paths-ignore can only be used for interpreted languages, so
not really useful in order to ignore the content in Kconfig.

Pre-building the Kconfig in tools/firmware/ will be complicated. I
will leave ignoring those paths to a further patch, we can always
filter from the queries.

Thanks, Roger.

