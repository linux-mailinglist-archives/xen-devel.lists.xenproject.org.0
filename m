Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C972E770B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 09:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60116.105409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuWw2-0005OH-LB; Wed, 30 Dec 2020 08:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60116.105409; Wed, 30 Dec 2020 08:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuWw2-0005Ns-Ho; Wed, 30 Dec 2020 08:34:22 +0000
Received: by outflank-mailman (input) for mailman id 60116;
 Wed, 30 Dec 2020 08:34:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2v=GC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuWw0-0005Nn-Gw
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 08:34:20 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7266975-0f45-4b8d-88e2-e7bd714c099f;
 Wed, 30 Dec 2020 08:34:18 +0000 (UTC)
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
X-Inumbo-ID: c7266975-0f45-4b8d-88e2-e7bd714c099f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609317258;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ydfHFhm52oL5qGO40g1JepkxZy0WMgmVXyR+OgTq7XY=;
  b=Pgxr7/oMwcgjcvstJ5DGV4CTxv1M9bD6S4GuBKMCeYVUKoGFMT3YptMZ
   AyqAXjoB956rUS9E0u/o3h+qdoox9QharpLMfut6mGrxio6zbvXpzKtLB
   /X/hJ8iFQyjVrOQqalBDui6HH59xWt+4ygVcyowe0RteMhKalBbXD+40l
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rLyqQKk8jDa4D/UphsdpIgz8WSO46vsv/km5bg+ZxhL+Tfg1ULPuIc8q7xubeBYFK/2E75sGFx
 uj1Aj/J2X4ogFBE0GSS/JdtiOhGFrnx2hE0vfs4XzAVqiomwLDFXoz4uNNUAxNN3dBeBGntP4Z
 G0c37XrT/v/LBpjnqND+RTzpDrKKTNl1CTb2rx8HDDF5olaDjiVs4bIlucTp9S+e4Qfs68DdXt
 yqBMJLX/040be0CipRSef+cAU7xqcIAumxiKnlS49jyH96FWgcVisLLhC9obdr9c0lsX84B4Sn
 8CQ=
X-SBRS: 5.2
X-MesageID: 34367290
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,460,1599537600"; 
   d="scan'208";a="34367290"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAiOA+OIMCITfAGCQB/M89otnnY03xPFDKU5RRLruD3z2eIgiI493R7VjzCSNUrcy4sBMhWELYmEd/cOW/pFvWaaCIyCzTBWdSdE0U9AWR+yGpY3Va1Sy0VpPjgAOgPSwTgOYNXj9nszsB1C/+VVx2mwiIahq7nW7LBXTvuFikFkrkVBqO2T7vnWy/7a5E8MJAKXaU78r2ojeGIrtTdKNW8gWI6AfCAokWBnKGYNK3444Ba6jTpCYh8hF1XWtYIOQfvcwTrXb2uXwd9rdpN7LCS1sA07o4+SG92GTm57avzlnqY8hAfGJb7qdH5PfvyMzL4asKEKqoenUmvcGR07GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydfHFhm52oL5qGO40g1JepkxZy0WMgmVXyR+OgTq7XY=;
 b=d4I9u2asXKfYJQDt42QKD1ZVpihxe0U/pHAcL1EhZuyNKUvH1PmsHY+XfTTv8pCBWkWpokKvNlgoOfiOdvKN/pFP0YYevPfoJQCMLnVqjkRhtrPLwP93v++2K/dzRZvd5J7j/rqZgoEsm7t40VSWw7RanIH2MY2WFhS5KxqQQEqcaJLTRdDI8DPj9y//GIxJx1e1cxiC5x8r5u5eH7r/rfdZGrOQOgm2OKGeKvnmVpo8R2jYIMWa8kDN2rqm+o1RjHqmy9iriDm83PFxxBuA9YOIwbI+xp7PYVwfiRTsiVhJbXWGD9OFtvSEmKuoCQz72T3SlOZgDdBFSt17gal7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydfHFhm52oL5qGO40g1JepkxZy0WMgmVXyR+OgTq7XY=;
 b=galRoqk94A5uba02+8+v4DckMNpuFcOx1f1duyTYwmrKErmhtyKkJS+LNU8HrpQS1H0hBsSy3iEnJHNW02khwGAGctAqW6dxHkBOicdA2tQn19ftqkCzhH7CLVKcsuJgHNU6GyjOdPReEAzz26OtOtNJvwJi2wsEsua/znFHnAM=
Date: Wed, 30 Dec 2020 09:34:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: YANG LI <abaci-bugfix@linux.alibaba.com>
CC: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen: fix: use WARN_ON instead of if condition followed
 by BUG.
Message-ID: <20201230083408.b3p6hrk3fuyc332z@Air-de-Roger>
References: <1609310286-77985-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1609310286-77985-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-ClientProxiedBy: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d10c0f0-d4ce-450a-0385-08d8ac9db0ea
X-MS-TrafficTypeDiagnostic: DM6PR03MB3914:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3914BE49B6B577CD9D1D2FCC8FD70@DM6PR03MB3914.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPtBAnuwMusCRHxbgMDrMUzyxJcp2M2mocHBg/b/aHCJrbVu+70sff5+BmlXOgQnqLNzx+qRFezCwjlY1a34B5PukMOqOgSK7eyWxr45ucdYk0JSbRVha6OEIws5ZTTB1IIKyXbcY3GXeeL28ZybLsB/ZxFJ/j4aQf5bctpBNj+jDGqCmHYcJZbR0wROJFU739BQD/4w72kDD++iRbBLnsZqXWOpQIIP/AkychhhagNEIQ00TewVtLvRLLLxBNyQXbB6dCAm8pmYCYthcoNfzVkCnvaH58UevVNSyqBnJoLQY3Hd37uhd334KMhIMXXUf16yp78nE64PH2R7bKGfju4nwdeqbSlmJatSAT1p1j8/rpKM/7+RV7JigGbegZLv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(4326008)(86362001)(9686003)(83380400001)(6496006)(66556008)(2906002)(8936002)(66476007)(33716001)(316002)(85182001)(8676002)(6486002)(26005)(478600001)(4744005)(5660300002)(1076003)(6666004)(956004)(186003)(6916009)(16526019)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2hZYjA1cHhSREZJZGlIQmt6WUlORU81amEwUDNXNndqcGlZUTdYNjZzQy9z?=
 =?utf-8?B?TEo1RDJ3RzRoOG1ZQ3c5YTJuVVIzeTVheGsrUXpwaUw1T2M5aVNIVlFocnFw?=
 =?utf-8?B?bDdGQnRSdlVxanBzTDRmR3JyL1ZCYzJ3dEd6ZFV5YXNDMDhIQkkwNHpOZWRk?=
 =?utf-8?B?RDNoYnZuek95WlVzdzdvZDh5aEJMdEV3QmZvd2N3ZUJCclVSeFgwbjF5QThW?=
 =?utf-8?B?ZTd0YkNrMFdCWmtQY2hyS2QwbVdONGlEVllkeW90SU14akE2TlIvYzRrc1FL?=
 =?utf-8?B?blF4eGtISTVpU1B1eCsrTTRyc215VXRDNS9KQy8xYWNyM1RaSW9aSENoUUJH?=
 =?utf-8?B?SzR2a0hzK01OYkJYdy9XSVVaZ2JiRHJxVWpFcDg4NHIzY3FFeTFTNWx6b0VK?=
 =?utf-8?B?cGE4MGZNTDdrbVpyWFJ1SG5BV1ZRNUxRSzk2di9lb0JyNTdGa252QVh1alJv?=
 =?utf-8?B?R0tNU0crTTFyeUFQUytGT1RvVWp5WnRreUs2aCswRlpFSHdnUGh3bjhNanYy?=
 =?utf-8?B?TTFQdHdkQXdLUkZsQSt3cFJTelNNR3czZDNWRmZPNjV5M0pPTHAwaGNJZS9u?=
 =?utf-8?B?a0hZbUNUYTdyU3llTWcwSE02NDZ5VVlPZGNTbkY4K3dwa3RLVlVycVlGQ2sx?=
 =?utf-8?B?UDdIL0RiKzdjbFBhRW5aVkFkV2ZmTU5raGZ5bUVveXNIUWxhb05ScDMydkta?=
 =?utf-8?B?d2pDVDNJWndydVk3c2VwUzkwUm90cXErUlBsNUZqa2xlOXZNVi83UlFaVnV2?=
 =?utf-8?B?aHk0bE1sekU0Y1JjaFFRbnlIOGJDRWV2NmJacTFMd3MxVG1IYXZWaFhkbEgy?=
 =?utf-8?B?RUZ6VEZRZVYzUGRjOHU3VWJjUVVHS29vZXF3dnppaVZJcm9GaEZLY1JYZS82?=
 =?utf-8?B?a21nWGJBcHpQVzE2ZGtxMEZTMlNhZWF3eEVzd21iWE95Sm83eW1nckhRS2Np?=
 =?utf-8?B?Rmlqa2Q4OU9CKy83cmYrd3ZXQ3ltbThUWVFqQTlVQ1ppWjZYU2lnVEpPZ3li?=
 =?utf-8?B?NlRCL29XRUFUdTN3K21zTUxtWFU1QlA1dm1hb0NsUWJ3WTFIN3ZVVTh5U2pq?=
 =?utf-8?B?ejBkcUZIMXRHTmNtTnVxeTVteFRkaW1zUFNPOWFkc1o4aUpFT29aRjd0RTA4?=
 =?utf-8?B?U1lXd1ZtU3RRWHQ4TUswbjlWajlsTXdpSjhSSzlrSmwxZ2NjS0Jhb0IzOU1V?=
 =?utf-8?B?MFIyNERKNi9qOERrZVNKRHdSalhWTm5kcjFLYXZ3dzlSMld0OXBvd0dEdERo?=
 =?utf-8?B?czhJWDhxWVB0cWMyZDdZKy9lSDJwOXAzSTdKeTJKTlgrN3ora2dVU2hRdUlT?=
 =?utf-8?Q?GZMeOScRBcKge5LMiZ9bWkHqyJZB2fANxw?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 08:34:15.0396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d10c0f0-d4ce-450a-0385-08d8ac9db0ea
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC7RTGskD/kdRWvSaifFUZdB0dH1QnJ7v7aN2nRQe1mfmP1dJVBR0B0FolbRQuD4OVF6P+OzC2opbSaj4DkjKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3914
X-OriginatorOrg: citrix.com

On Wed, Dec 30, 2020 at 02:38:06PM +0800, YANG LI wrote:
> Use WARN_ON instead of if condition followed by BUG in
> gnttab_batch_map() and gnttab_batch_copy().

But those are not equivalent as far as I'm aware. BUG will stop
execution, while WARN_ON will print a splat and continue executing.

If switching to WARN_ON is indeed fine it needs to be explained in the
commit message that returning to the caller(s) with
HYPERVISOR_grant_table_op having returned an error code is fine, and
that it's not going to create other issues, like memory corruption or
leaks.

Thanks, Roger.

