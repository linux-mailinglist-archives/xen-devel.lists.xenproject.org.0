Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F443919F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 10:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215669.375002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mevYQ-0002x0-10; Mon, 25 Oct 2021 08:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215669.375002; Mon, 25 Oct 2021 08:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mevYP-0002uV-U2; Mon, 25 Oct 2021 08:42:01 +0000
Received: by outflank-mailman (input) for mailman id 215669;
 Mon, 25 Oct 2021 08:42:00 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mevYO-0002uP-9f
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 08:42:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29850afa-d715-40db-a267-211ca8ad57b3;
 Mon, 25 Oct 2021 08:41:48 +0000 (UTC)
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
X-Inumbo-ID: 29850afa-d715-40db-a267-211ca8ad57b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635151308;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=68+mFZW0uzDPX9wO/4RtE3gbw3KtdWkFvpoDpDAj2JE=;
  b=Wyf6uUFT7c/GVQqLkrG0f5GEXNnfV7prVUEJAr30mfWdLWkwtHUOjyiL
   rZBQ5mvWiY+T2G6x5FXEibJTUM/lvrdbWyavPD/2omqj6Eqox9HTHWqO6
   IcRg/izV7xCBc+GcP+bNCsGpPGi7MXnJ6WpaBIf1JZwyzom0zc7eIOFbh
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gzYzcB6pF+yuqzlrao5ZzTfOfky618Ec308c1N7OYuEMsCPC/ezL82AxSYQj201pCGyCVPKxN0
 w8kHVhX4GLCYnTRND99NXtRUHa2M8kuWvU4+B0ETs2Hx70dOvN4chIvC7hXdEK8abzhYpePYR/
 JQfHEpGrOsbKVzb7dJ3gOg0/ftRbgrYAI9foHPU5iIMoK5W/BxvPf9GMbfTU8d+eCZyw4oZAQg
 n53hvC3kzDOrY/QLXmgFVAEOTRgB29QUmvej+jtqRlT73RTRNKMQmuxhy5VuU9kQcTEasm0+nC
 7MvIUJqThPBO8mCUbpNKAPdK
X-SBRS: 5.1
X-MesageID: 57879429
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vAWuKKp+n2Cz9xlImqrQ2Pw1IO1eBmL6YhIvgKrLsJaIsI4StFCzt
 garIBnQaf+PNDD1coxxOY2w8U4AuZ6Ay9YwSlBlry5nRitDoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbu1ayYAI/3toeU6UBtFLCVlMLxX3bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0RTamPO
 5BIAdZpRBntSjhsM3knM40nwdiDhmDPdAZU903A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru523kBjkKOdrZziCKmlqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6+A0olZyMRSeUnk8w0WAMuz
 VKYjvbmUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0UqRFocL/Lqdy4SvQ2mpk
 m/iQD0W3u1L1aY2O7OHEUcrat5GjqPCSRIp/U3pV2ah4xIRiGWNNtHwtwazARqtKu+kori9U
 JosxpD2AAMmV8jleMmxrAIlR+nB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI5FoJvMUCZCPwPcebhr5d7exwncAM8vy+DpjpgidmOMAtJGdrAgk3PSZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TXMGm9ZcPLbXdc2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9xrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:bcdF0K7orInsdGXIjwPXwVKBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,179,1631592000"; 
   d="scan'208";a="57879429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc3RHe8qm9+5FwwW3xwF3YX9Q5mKntb0loGyiGC74Pj9z7NHUB35VU+SiJiZ1geyiOqYc+JkpiPHLgJguZuMLY0VVkWoKALQmWpAN7HPrVP50EF/jj9Y43DB2UgpEey8HuybeB5K1PnMF7dSdUbp7xtlvEaVbQJ2fxtlUnY99dVCVOxOPvFLSZml1HaCq+LVLaMax0sn3rB3GPQc5PgCDciY66T8ri1WttQbm81qWTbUeltN9rWcRbsxx+/0UF6oDYR65sN5Quplc67h8AIx2YJrMXyeNMWOuxecNT4Bdbm9j/fk5Oc2e1koqgM4IF6i7PIjFseDzpohSkMsH2zVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcoCoCwpF0C5d/Kg1OE+tUYQhaSjK7jInv6zyutyTPs=;
 b=AfWVE8qGWU2Suod2z59nZ/xzqT8Su01DGgDaqwbDeZIaIUaGSXJw1EpJkdkCNFtS/4xecEWazDQlngIUCpMq1gNGQ+wZyi0i+hXjjnvYoIadDzuRxX0xLNVOHV10WW1qgxsq9O+8fOXUgHSoF0x4m5PDzuMis8tp/l+qzTNCLl/8EpaJy0IzYt+y26t+67XEztPRJ+NrkktH0xXd/2rwPUQbAkCXjJLqrdBXD2xXPI1hZAUQSufkqDdiE4xIBu1zzNJ1pFarVND+dbY/+wPE4EoN0YtTpfZyB15qwkbYxp4kghG4Oa+6PXGLUX+cPpCpDeEi55Fg5GT+ienWti7gVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcoCoCwpF0C5d/Kg1OE+tUYQhaSjK7jInv6zyutyTPs=;
 b=kpD3aOFY5+UwwPwaPFyj1Vb153K0c7Ec6Bld3Bx0hVI3uoA7UKiR140B0ImmxGlkn9WN8UbXnco/MfFpd37uZkXfM1OPN79d7Cw75oWMJBzLf6ozYelZvpT3vHyIzzFBh2xZziA3DiVBIfV9CRIuZclTUiUYrjrSE+axO6WU9uA=
Date: Mon, 25 Oct 2021 10:41:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 2/3] x86/APIC: avoid iommu_supports_x2apic() on error
 path
Message-ID: <YXZtxMr+MrbDcmhC@MacBook-Air-de-Roger.local>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <35f9099f-1111-1a66-83eb-bc5a3887f9aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35f9099f-1111-1a66-83eb-bc5a3887f9aa@suse.com>
X-ClientProxiedBy: MR2P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4372d8a4-c67c-4354-4c47-08d997934703
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538582505FF7941D0AC5AEA8F839@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBautpSB991bjDipLDqa/gGUhZMBKxg1Z52JoB5TYyXpI7wxwSquUoQ82SPoYnk1MuEK+muE8fEPFjFxRpGlIymC/di5z94U2Am+y1v6HyiUz1/w74lkElZMfQZ9VN1BnypuAyGM9mq2LYn1lvX/L/HUBYgTWX+naQESol805VroRN80VZOo1+6NBKsCWoO69uFiLV/Wkj7534dYyewCdmfQvUiu9En4Zn8LzdCuXS/FoGvfxnkgTKcydKHarOL29mPzd00bM7c6RTAEDjJ3lM6yh6Ao0RIuPHK/dDDmj+LEW52IjBZbZKK3LmX+tt3AnygnkdC0w+LzSbf3joNnupggHNAkJuzOSTRDJnzF/j1i4hKpx/PuJtcq1mwpOuj1bQA1QYHD6UW5aMjk2odelOoCZH57iS+eU6xxOGcGd1wdnOLelLft/rNZfFSx94hYrLDfYxByoP6+mT2gR7x6Zv5mryhepmFg55bfUVNzTD3MDJZ78oA9fI8xapSprUx0s/uqO4CjbkqZ3Buh5J4LHInzbPnFKExgI/LqSrBsbXh5Ucq6jZLDnVSKJcczVpNv7IFbcKdTvsWqh1VWBUVcaNQomUTG8vY2+8bkotF5uMDmJ3jV/fYdJcZeNzBZZoo6hVjwyp13v3N78piRrj6A91HkU7+XNmFAk+q65/1gcR6e6RuFpzaQ7TmZjwJR8FezMYc6Qdl6zm1A0cCybo3WcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(38100700002)(4744005)(26005)(8676002)(6916009)(66476007)(86362001)(66946007)(6486002)(6666004)(8936002)(9686003)(5660300002)(6496006)(82960400001)(316002)(54906003)(4326008)(508600001)(956004)(66556008)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTQ3NlhSTDBXeEZ6M3p0QW0zQk4vQ2p5RjM3dmhSYy91MjZxTmkzWVd1U1NO?=
 =?utf-8?B?bXpQREU1UzU0VGNsSVF4MG9ZNDZmaER1amhneDhPMkhMcTcwditTb2JDSnlP?=
 =?utf-8?B?cit0WDhtVkpUYkg4bFhXa1A5dkFwUTUxQUtFSG5FRjJ2cFk5ZXJjd1M2d3FO?=
 =?utf-8?B?ZFlIbnllc05rZTVpU1pjcnhsazdhWTJwWXFva24rTk5nVnpWeU15NHZIN2ND?=
 =?utf-8?B?NXFBd1JYNFozYWg5MTBSUlFCYUFWTzJwa1Rmb3U2OWsvVEFsRGNEY2FjekdW?=
 =?utf-8?B?THdobWFDZUV4YWhzRUR5djYvWkV1eXV3cVRnaVEyUlQwK0x4czhYOTFMQnEz?=
 =?utf-8?B?QVZyelNnWVlmQ3BYTUVFYmNnSXlGOE5hT0NVNzNpV21qM0FUZHNiZnZMd2FV?=
 =?utf-8?B?RVF2aTJxb3VRQXlEZ0RJMHE5WjVWTis5R3FBTUhidGkvNWhBVHc5eTJFV0hO?=
 =?utf-8?B?Zm5YWDlETnFtbkpHMzlzaDI0cEF2L3hXTDlUWThqMUI2NUZnRXdVZzVkTVhS?=
 =?utf-8?B?eXlZSS9CYjAxeDFoelROODh6eXJHWmV4L25yd3hNTVZoemNqK2I4T3pMNklL?=
 =?utf-8?B?ODY5cFRUNDRjQitTaHRzQWdDSHdCTi8vMnp4N0lXQXdkN1FucWxKZzd5cTlR?=
 =?utf-8?B?SHc0R3JTaFJVVmdhaDByRlBXQ2NHQXZuUEVacHIyRTBtQXR2Rm92ZEpMNnd2?=
 =?utf-8?B?aGkzN1UwS0lpL1ZWNXlWeWhuNlR5SmVxaGtJYmhLRGp3b2dodTVFNVdFS21v?=
 =?utf-8?B?d3FSOGdTN2JYT01DaEZna2xxVDk1YytXdUVPVlFRa2ZkeTRzL0VWRi84b21z?=
 =?utf-8?B?WDRFZTFOTE0xdHdENE5tM1ZqaU1IUmdEamVKK0NBWjlyR09xTDVreW0vQlR6?=
 =?utf-8?B?bER3MTl4YVVIOUR3aW5VSEsyK3BkeWc0QkF5L3E5M3hwbEcwQ0lFVWxRa2V5?=
 =?utf-8?B?WHB4bXFjb0RvVHdxTnFlbVhJZU5RYzVtVWtLb2R2aktmNkRWTmI3NGJWK0Vp?=
 =?utf-8?B?OEZlanNIOWU5Tmx1cUxkdCsvdzZGbTB5ZllkUTlCd3VWaGk0QWVCVW1mM2dx?=
 =?utf-8?B?SWk0TS9uaVFPY0s4ckVsUTY2VWdYeDVmMEhINE5Oc1BuZWJSMXpKQm9PZWdO?=
 =?utf-8?B?Z3kyQ3RQdlBSUHN2TjRaR2tvWDU5bkdZYkZTQW5ocmFSMDdxaW9TZmlFaEVI?=
 =?utf-8?B?dW0zd3lwdzJYWFpJcE13WGM3Slo3clJvcGVEekJPUHVSVjdhNUNnR3A0dHQy?=
 =?utf-8?B?UDNZRkxka3RVMUZBeUlka25ENFNHbzI0L1NkVDd5TjlSOGNMUzhxYWRXejV5?=
 =?utf-8?B?Q09BamJEQklmL2JJMTdhbzlINXFjaDhneDlGQVFlNWVFNWo3Qk5jWGlHbTZ1?=
 =?utf-8?B?VXBORURMNmkzNjdkVmc4WVpKQnJsYVBGUFJ6V3ZpbTU3OXNXOGRhbUNCTHdL?=
 =?utf-8?B?RHJrMXM3NW8ydnZ6TXFTbkRUNDVmdTIvNUliOG1iRU1ENHE2NHlrcVNaZUpX?=
 =?utf-8?B?YnJnODduV254UE1SbjBwVUNmeEtKMlhVbWxzTkNta3d4RXpWZlZiT3RaWXVl?=
 =?utf-8?B?WFJLVk5uYkxTcnBocGs2cTNwZVg3bDBpZ2RPZFBIY0F3MFR6OXpFYzRZZklK?=
 =?utf-8?B?OE1wOEVpNUFjU0J3RTlmdkdXc2pBSlduQ29nU2h2WHZvRnhpN0wvenBhZ29o?=
 =?utf-8?B?VTV3ZE5JMkNadFZoa1R5bTJJSDBvUmw4WW5JOERVMzg2QVNMTmlhRDVySG1k?=
 =?utf-8?B?V1pBOTAxWVZlTTVkaVNDL3g2S2VwRE9pSXJBMnVaeFZuZCt2dlMwWU1XM2VC?=
 =?utf-8?B?dWVXRUp3emFwS3drQVNDelY0dDRnbFRIZVhTMDNnSjZvQnM3UkwvU3JaZUls?=
 =?utf-8?B?czVFenFSV1pjVGFyRnZxdEprTFl5Mk9IK2JBOGdjbTFFK3ZaMFFCR1lhbDNP?=
 =?utf-8?B?emp6WFU3OFFBSFprSU1iNHBsZjdBWWQxSC9JNGVuNEpTM0ZBM1pYcU1nNXJZ?=
 =?utf-8?B?U3RrUGNZWEdvcWZQbnZDUUhiWlNYTmNyd3ZTaGN3VWN1Tjd1YzNWbCtoZDBR?=
 =?utf-8?B?VnVYZjNtQUlsUXJuUE91VWxZaHFNQ2pnZUphc09FbEhWaXh2UkJCWXI4OEV2?=
 =?utf-8?B?NDhYK0ZmWWpaZCthaUY0U3I5MGYyTEMwUllvNVZ0V2tkRE9sYUxiNjJSU0xS?=
 =?utf-8?Q?xu9+PvcM0go7NC67QYX7o6U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4372d8a4-c67c-4354-4c47-08d997934703
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 08:41:45.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc6O/nnaVT0c60Lrv86t4WLgQ/8B4jfNW37KOv56hi3WhaXuv17H6X3MDlI3VGCtQ3YvQQO5lQ4dNXsMD1wjkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

On Thu, Oct 21, 2021 at 11:58:37AM +0200, Jan Beulich wrote:
> The value it returns may change from true to false in case
> iommu_enable_x2apic() fails and, as a side effect, clears iommu_intremap
> (as can happen at least on AMD). Latch the return value from the first
> invocation to replace the second one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

