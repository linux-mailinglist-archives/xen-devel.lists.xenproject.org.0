Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AEC4336D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213217.371377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcozm-0007Yu-HU; Tue, 19 Oct 2021 13:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213217.371377; Tue, 19 Oct 2021 13:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcozm-0007W1-Di; Tue, 19 Oct 2021 13:17:34 +0000
Received: by outflank-mailman (input) for mailman id 213217;
 Tue, 19 Oct 2021 13:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcozl-0007Vv-KE
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:17:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea67decc-30de-11ec-8312-12813bfff9fa;
 Tue, 19 Oct 2021 13:17:32 +0000 (UTC)
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
X-Inumbo-ID: ea67decc-30de-11ec-8312-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634649452;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4iTaz/xo+NFNzJtIKYClCdTC0sCjbo8XTUzYjtsNYEE=;
  b=RJnqZvTYhaHeYthmg+yrZ2u5cTmBbEieiqjG5+/sVhsOqBOiXVV1iQtS
   bi8LJZptQsX7mrmSEaHlRlJwvZgR6/0n7VS99ZsKwXcSxyCLRmc4Iaw4L
   +Cjx+feGJrGMTOiyogKZouM3kmpBocy3O7LxHu+8ag4wH3u/Od4A89W6Q
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aal6IIQK3Zr7GkymtztptSSGR83gaQCkHPWdLDVLQimWbYwadwc9s5GeRZARD49NQrApJUQvo+
 GH9UiaxfzuKEdKpMNEvya+DampG5PY8wkV1uAv0/2Qc1KBmncQ0h1xktJ3IafTm35zaUtHjNVX
 9Uy+a/86g4vVCEOgI8EjZPMY5mRSUCJzu8LLr1GB8zBJa35MT5Z9IKQImMsm23kfSaJC4ErJDk
 9VZbB8E9s13q5k2tnxJYCWIDaXuwMbK+KigPJl/wzKQFSMfzxDbL7qAzec7g3+3g/n2PUf5M5m
 N9+Y9ypSQuRZxwE4Rl500Kip
X-SBRS: 5.1
X-MesageID: 55564694
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z2JaQaP/nCz+AvzvrR0ZkMFynXyQoLVcMsEvi/4bfWQNrUohhjdUz
 WdLCmvUb/vfYGKgct8gb4Wx9E4DscfQz95rTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Usyw7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo261mst22
 f9rjJq9cgEQM62UorUfehYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXuIEEgmZs7ixINbHme
 ZUXVyVfVU2eaDlGZRA0MIIaguj90xETdBUH8QnI9MLb+VP71xdt2bLgNN7UfN2iRshPmEuc4
 GXc8AzRJRUXN8eWzzafxVuqivXShiPwWI8UF7qQ++ZjhRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+8ywyUHHQeRzhNLtkvrtYrRCcC3
 0WM2djuAFRHsaKXYWKQ8K+OqjG/MjRTKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxmr/
 zWRqzkUoYwVgPUN7qi7pWqWgRuj882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 yBaw5n2APQmSMjXznTUEbpl8KSBvq7daFXhbUhT847NHthH00WoepxM+3lALUNtP9dsldTBM
 RKL5105CHO+OhKXgU5Lj2CZV5tCIUvIT42NuhXogjxmOMgZmOivp3kGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35lmT6DH86jlUr+gdJygUJ5r59fYDNiichitMu5TPj9q
 Y4DZ6NmNT0OOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNnJOh5pbw9l6Aco
 jtsU5zoP8mjgw/volw1RZL8sJZjZFKsgwePNDCiez8xY9hrQAmhxzMuVleHGPAmAnXluM0gj
 aen0w+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBeUfZ2z+X9
 weKGhNE9+PDlJA4rYvSjqeeoob3T+YnRhhGH3PW5KqdPDXB+jbx2pdJVeuFJGiPVG799Ki4S
 /9SyvXwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+YA6wWsW
 0+J9t1LApmzOZvoQAwLOQ4oTuWfzvVIyDPc2us4fRfh7yht8bvZDUgLZ0uQiDZQJadeOZ8+x
 btzo9Yf7gGyh0Z4MtuCiSwIpW2AImZZDvciv5AeRoTqlhAq2hdJZpmFUn3655SGatNtNEg2I
 2DL2Pqe1uoEnkeSIWAuEXXt3PZGgcVcsR9H+1YOOlCVl4eXnfQwxhBQrWw6Qwk9Is+rCA6v1
 ryH73FIGJg=
IronPort-HdrOrdr: A9a23:/DRkBqvKkZoO2SxEvKXGOlya7skCkoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5pau854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.87,163,1631592000"; 
   d="scan'208";a="55564694"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWUbwaFBO4izLyTY3mhiXqUMLNaX6ffNA7kOl2EpYja3ZmDxKfoduvG4czXXkJqSGRRJourSUfyCBMPhuHBccWE9MRM7ccPiTpVwcV0hEcgfvMnOyZVX89yO8D7ctj/6C1wZV2Jo7m2I6/eI017MCVkd7XxS0gGb5K8rHgcy4C3V3UINiiUOuUn+I+elxlu/u0iQfYUrOqM/emNhzypTVV6xQXADPvlmI6OMHzE7sfU/jRhFSd7KBo5MPznBc4zE3fYsnqaff8KzPhd2AcyTMSsG5DgZZsobuyGbGvdnc4HE1UCOU1vRctWI0ydfhUfSqLCqhg3jbdApF+TwjHK3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqMeKL7+IsnhaXtLhgzJzblM3JZ3BaIXMuZ2591rQdo=;
 b=oTxknLlVcxNFqoCAeuX2phzDXVUFdMphqX0NKaOe2x8AUPjLyo6GZgoNdKM9+2EfxYM3L2I3CznMTObrp0it4nKJZdaeNJHKsqRAjHjn8z0RAP63E9zpNEw/aAuSs9AtfWTMJ9DcvHoKmGLygtgucT+cEVwV8ZamJkBcQAzWUDXpJZPkphW2qFczKY3b6jKIMSenZcdf0luDR6vzXdL2MhZF3AKFUdFEaA8HaEvQi9FUXigrVM7gXeo3ge2/u4t4tyZ0bD3EEKOfERlcMQWrKJTPvaVKsJ3v6QvTFU16km9LGXgz/+sC3oyVDvQdgaZQ1uRv3ywjA9g7EoqTINDaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqMeKL7+IsnhaXtLhgzJzblM3JZ3BaIXMuZ2591rQdo=;
 b=CCYpRji2dCNemAnN0V2ZIto6UDrFdD9gueKzOERE7Su86/cMQpBLsOK8UAAcrvs/wDvHfousdtjlhhPBCfieSljqfSMaRh7ULTVPxCLY2qT8g7ERxx0wfK2S5/RnjTRyxF1JGYX0AyN5VQo5Yb9/rPDYHsxzlj3s75FpigF8e88=
Date: Tue, 19 Oct 2021 15:17:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, <iwj@xenproject.org>,
	<sstabellini@kernel.org>, <Oleksandr_Andrushchenko@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
Message-ID: <YW7FXibf4DRS2TPa@MacBook-Air-de-Roger.local>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
 <116f5313-f2a3-376b-a0a3-af0d14d82125@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <116f5313-f2a3-376b-a0a3-af0d14d82125@suse.com>
X-ClientProxiedBy: LO2P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a64a685-948e-41b1-6b73-08d99302c9c1
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371DD27D8151E75CC0BF4288FBD9@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dd0hYnkt9KBVsc09GIfWxrdt47iJ/5tQfzIIWpmrI7Di9181tUP6X4M3oMfNkSQMD23b0uGRnlP+xEXI4Dg3BLy7bGjQ4HLfcrE9dDWJqzmciZTY3EzdcBUXOtEl4sktnNsoZ165XfTXbpPPdXDMXJlrIqC7hXOFHcFcxgocKahckPeSSMGH3rS2Jd6RBg8tXBJ2qqGSen76aqFQX1LrwFROhDe6/EYW6MLsoFA+HEFK/DPdo/5F+I1r8/qRD1mXDZRZFq1kb201iLSoyHSf/BiTFUqcjPLPKHxRZrBjQnSHHMvXOAqpIcmfDIPNrv9p8DhKsLqKCLg77eAtjho/tCOqFJR7dVfhEBAAamusPhNLZz0kCdHZDgikgakQQSxhCaTUDfIIiIRV0zc1fD4bJuYTJSSD0gnHCV/MOZHt/leeNhBxIp1WOsMGXWTDJQxFOhgMNzlCRWkx/yAgKBYhiBilHPOwegmzeBkmcwRYXKKnKJUFkwRSA3wOVNBy3Tk4pglAQqIydEwQgf5LaPo4NY1K18SSbRPVW02Tgz/2cTR7q/nJnOonAhRKkQ5Y9M6OOM3meP502XWqolcMyKO32GrUmHIRGU1PEosQK9NN68ZnSzvXE5ifDipsZpBIWyjP8Wtsqt7XeLMbhtoSqJDcBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(508600001)(9686003)(85182001)(53546011)(6496006)(8936002)(26005)(38100700002)(316002)(956004)(86362001)(5660300002)(2906002)(6916009)(6666004)(82960400001)(66556008)(66946007)(8676002)(6486002)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBrazc2d1hrdFhqaWRvME54NktwQkRzRXpMN21DUjdnZHIybXdFb1NVWFZ4?=
 =?utf-8?B?VE1NcWVxdGZOZzF4MUVJK000azZVUEwrOFZ6bDBJVTJjci92Y3RxMmJTVEVR?=
 =?utf-8?B?UDRIWVNDV0Vsb3NkRGhsejlCZVF4eWorTzlzQWN2T2NZSjhGWGtSR1NiQjk2?=
 =?utf-8?B?cFE2WmxHeVpBWDJyTm54UEF6MFdPS2tzTnZFNndHUDNSRzMwQ29Eb3NuYzkw?=
 =?utf-8?B?cjlrNUgxZDRHNXNIRGRhR1BrKzR6aCtTU1F3WENubEhSaEErR2FRRHJrS1B2?=
 =?utf-8?B?bUFtY0lTM255eFRJYXN1Vlo4K1pYVUxxa2gvNDZEQjdMcmRzeGhtMHFtZU9B?=
 =?utf-8?B?OHRmLy9lQmZvNTBDSHZNREo0WGFlMzNLQll1Y2dmRzNNR3VFWm9URGtYclJX?=
 =?utf-8?B?ZVdDQmRuRUFtYWdmSEFEVmQzd2ZlekFHbkdUVnFSVTE3a2xJN3d5Uzk5WWVp?=
 =?utf-8?B?RVlhUE9SUC9HYUdncW9jeVVkeDl3bkRBRTRIbk1CNWFhU0R6dmtpcUhFTTJX?=
 =?utf-8?B?bWcrMHZlM3NETWNUaU5Md3ovb3pRZHJTRHBEOHlnUU1MVU9VUzg5c1JDZFdZ?=
 =?utf-8?B?dFlxTEVRNll0S3ozMTdjUDIyUEdGMEFwVWVWcU5HdHBKczJ2UXc5NnBWK3dt?=
 =?utf-8?B?Z1Nkd0RIcXpuUmU1bWlISk1JOU5QNUdvUGZKcENodnVCd2FSV0NSNm9DKzFj?=
 =?utf-8?B?VlNEUzBoWUVRTjBaZTZsWWc4V05KRTlkVE1xWHY1QnVLejF4WWUzczExekJi?=
 =?utf-8?B?cGVtdlE4UVdJcUFUM2R3SW96NG5IK0k3M1ZUQjgrUHB2K1hVV0dhVjlxaFYz?=
 =?utf-8?B?elJhVUtmdS80a1kvdFlVODNjWGhDUEV1S3VldHlQOGFleWlXRS80S2FjOTNN?=
 =?utf-8?B?eVBBd280V0g5SEUxSGpGZENTZ3J1azZOSHJ3amtsZWhJbmdPRDI4RXZJMzB3?=
 =?utf-8?B?VHdsTTh0UWhSblZkYnM0QmF4aFdJdW5UemswL0g1dTBNdHAzOTBXR0p0U3By?=
 =?utf-8?B?Rk9ZTFVzZW4zd2RYZWFjOFoveE1naUVNOU5VTTY3UjgwYW84K3gxb04rT1ha?=
 =?utf-8?B?QkVMZVhONHc3RTc0eTNPWk9SclpNb3Zkd2N4ckVNMkRRRG11Q0N4aHhjU090?=
 =?utf-8?B?eUkzblNGWDNiOWk0S1Z3UjFNNGx4b1JOdFFsamt1ZTc4aFcvWDd2TklFMllQ?=
 =?utf-8?B?Yzh0ZzcwLzdjRVliZE4vaCtaSmdwWitLcDVPRWtIblJYaFEyVDlzbW83aFdT?=
 =?utf-8?B?MTlHRDM3dDZRcjVJWEJCelRYbytHN2tucDk2czNsc3o2K25LaElxNWRJNytt?=
 =?utf-8?B?Y2ZBeGVOSGVCNlVwWnhOVGg4eld5eHJ5dVh6ZTh1VWFGTlNhQVUrNWdud1Fo?=
 =?utf-8?B?bEd1a0d1QTE2dWhCYzh0dXM2ZDQ0ekdxZ3paSlFSWjUrQ0d4Q1d2WEVCNUZ4?=
 =?utf-8?B?Q1RLbFhxUERDanRJdlJRYm83bEZuNkdTbUp2KzFVN1NWR29NbGJZamRURUpK?=
 =?utf-8?B?MmJXTnBEQjlzRVBMS1FkTGNBc09NUXZRSUxhZmNMVlhLbEtYYXJ2b1lEdVE3?=
 =?utf-8?B?MmFwNzUzcGhnMTRna09HdFhhcGdpZjFjN1NCK2FEbXhaWllUWjV0SE9vYTJK?=
 =?utf-8?B?L0VDY1A3ZVIwSHRlTDNVZTdOYVcwUEJTQkVMMUtReWE3MGtrSlFMWlBTTHNU?=
 =?utf-8?B?bFg3WWJQQkhZbmNYNlkxVzkzRlc1c2g4NmlQQXNNN0I2RkhKWUlSUjNoUUh3?=
 =?utf-8?Q?nZLWC6FPsShsF3xjXDc5gJExayFUBsLfqZvdesJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a64a685-948e-41b1-6b73-08d99302c9c1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:17:23.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfqRYQYUhjh/Mb2UuMycHPeBtn0Mq+GCQvh9Bo6aL4Sk9wlDHmjbx1xIeXVvqgqsqgPZpBKqC7M04nK7y7/qWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 02:39:17PM +0200, Jan Beulich wrote:
> On 19.10.2021 12:40, Bertrand Marquis wrote:
> > --- a/xen/drivers/vpci/vpci.c
> > +++ b/xen/drivers/vpci/vpci.c
> > @@ -54,7 +54,7 @@ void vpci_remove_device(struct pci_dev *pdev)
> >      pdev->vpci = NULL;
> >  }
> >  
> > -int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
> > +int vpci_add_handlers(struct pci_dev *pdev)
> 
> A fundamental requirement when altering section attributes is to
> also check that all referenced entities are appropriately placed.
> Afaict this is not the case for __start_vpci_array[], and you'll
> need to also adjust linker scripts to deal with that.

Indeed, we need to just keep the CONFIG_LATE_HWDOM placement in
.rodata.

> Further
> you'd have to check that all functions referenced by that array
> aren't __hwdom_init. In taking an example (init_msi()) I'm
> actually surprised to find it's not marked __hwdom_init. So
> maybe all is fine as far as these are concerned.

My bad, I've forgot to mark the initializers used by
REGISTER_VPCI_INIT as __hwdom_init. I think there's no need for a
change there.

Thanks, Roger.

