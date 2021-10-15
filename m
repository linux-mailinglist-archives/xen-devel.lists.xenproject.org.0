Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192242EE2F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210071.366788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJuX-0006yZ-Lt; Fri, 15 Oct 2021 09:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210071.366788; Fri, 15 Oct 2021 09:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJuX-0006wC-IP; Fri, 15 Oct 2021 09:53:57 +0000
Received: by outflank-mailman (input) for mailman id 210071;
 Fri, 15 Oct 2021 09:53:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbJuW-0006vz-BA
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:53:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cece8754-2d9d-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 09:53:55 +0000 (UTC)
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
X-Inumbo-ID: cece8754-2d9d-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634291635;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cFT7MuVWqsioz3dLk2GIV0Q8jEBxk5Ryti6eH/nBGxw=;
  b=Q8xHXezpW0kj3EpNPumDCPMNJ0VExFFsP1yft1p6GRvCoT0fJmkc3x4u
   IcUkpD816N6H5ilubroDMsVFJEf5PVdsFFFo/7zygslzE7BhldWh8mAfI
   rasl53YJXqfzvC91DH2GYUnaifpeDFFtizdras41zAvQ/21h8a4lf2Z3i
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0CoA2L2E0fZ6hI+eOTvPl7/5iiLcwAqavrJ84oFDIiICyygqoKBEhIryrPh6WLWfmTRj3olXUQ
 VdbhmAOU5tojjvTjB/mqBB23sB4u6tcFvf8Bq9ZFzJAgVf0ymYywLJyV2fpUr18SY8aNjMNtVK
 uWgHf2U7/bBUsCaMjVF3xte72WbG1qWdMYOIQXYyj14v/GSFNuw9m+QHEkOVDDjKqXpMJc8T1R
 jnDRvAvk+cNIFRCAwEVAn+t8LYzetEGp2zhw5slzB/W+b8ZMDEgP4ZA7EXdaCzt7Kik4CCLtrL
 pQUoL35NfiDf2o/HPejkVgcY
X-SBRS: 5.1
X-MesageID: 54836120
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9YNXRqoPqgOFETNUQrpC24ze0m9eBmKHYhIvgKrLsJaIsI4StFCzt
 garIBmObPmMNGDxfopybtnn9kwD6p/RmtFnSwNl/nozQi1ApZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZKXdF0sfYrIoboyb0ZZHwVeLLJ+/6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0STa2AP
 pBBAdZpRBb5WE0SOGk0MqsvhuOOmCLTcQUAt13A8MLb5ECMlVcsgdABKuH9YtWXQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTR4Y6BLC+sPlwjzW77GEJFAcfU1f9hPCjk1O/QPpWM
 UlS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmkbTBZRZdo+rsg0SDc2k
 FiTkLvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsQyw4udygh4UK0D3zEddvNI6kkeXyBmSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BT39sFsoDGKxT8nxswKDtKcfRGqMZgDZ5
 CBspiSI0AwZ4XhhfgS2S+IRAKrh2f+BNDDN6bKEN8h8r2rzk5JPkIY53d2fGKuLGppbEdMKS
 BWK0e+02HO1FCD3BUOQS9jgY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhY
 svBKpz3UC9KU/oPIN+KqwE1iuJDKscWnju7eHwG507/jer2iIC9GN/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnK/zGLnFnhTdSJTLcmv86R/L7ffSiI7SDBJI6KAmtsJJt0695m5Y8+Vp
 xlRrGcDkwGh7ZAGQC3XAk1ehETHBsgi8yhiZnJxZD5FGRELOO6S0UvWTLNuFZEP/+1/1/9kC
 f4DfsSLGPNUTTrbvT8aaPHAQEZKLXxHXCqCYHioZiYRZZllS1Cb89PoZFK3piIPEjC2pY01p
 Lj5jlHXRp8KRgJDCsfKaa3wkwPt7CZFwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuYnRhhaEmDX4KyYLy7f+mb/k4ZMXPzRJWLWVX/u+bXkb
 uJQlqmuPPoClVdMkox9D7c0kv5uu4qx/+dXl102Em/KYlKnDqJbDkOHhcQf5LdQwrJ5uBetX
 h7d8NdtJrjUatjuF0QcJVR5Y73bh+0UgDTb8d88PF7+uH1s5LOCXEhfY0uMhShaIOcnOY8p2
 7586ssf6gj5gRs2KNeWyCtT8j3UfHAHVqwmsLAcAZPq1VV3mg0TP8SEB3+k+oyLZvVNLlIuc
 22di6f1jrhBwlbPLigoHn/X0OsB3ZkDtXimFrPZy4hlTjYdusIK4Q==
IronPort-HdrOrdr: A9a23:WfwB66rRu9TWtimGvRwFE+QaV5u4L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzpmJ/V9MLOA47e7rDNoX6e2OEDIujGyWUKEg5AQO4l3fW2sR+2Aj4Qu1E8HMN8K
 6xJm+w81RCI37TNQ==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="54836120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc1j+yKitTR5OCgnE1jGBog4CSeDGEUz218nD/Do2Ovceul6Yp1sWi7+RxKUlkRDcP81YSrcPkbNtuc8/QfEq98nkJwqepOZ/AEITDOjTnhjWZE2jRhN/4gTQVsj1kC/1h6SY/0dUd1tB5j55/NmvhKftpp3iaZDJQBi0rl1HsaT1Hw9zjRxJZFlAQ8PLB2fhycs3TCoDHMI4QLtSOBfSSv3z2uk09byKOAJv79ZVyFZtvOOBhaG3KUyy6r1fDm2I+jn5YpjI1LN+wzCJNd1AtyhHunpJ1lj8QDV/px8TO+/EsmYESjxSTkG0j7yZuaeah+s0GicPYWnFKIxOVO/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRGrxkwCGoRmDJVmWtGcVrqCKpbBMU/fv95Cgxayhus=;
 b=Nq5AeOQ3RvYsJaGkt75+F/TyZTnDK8Tv42oXQZnoHFkMeM/oUJ4EdnYUMg1hBril9u8U6l8lrw4AIh9lET2LM10jHdKtLe0WmpE9osMTBK8FEAyncKI8xvNnJB2AjuNqBeqOJxGsqLksbQDmeSdRhJhxR99TGBFxdqMzafuul0SUh+eUVPgIH1CNYXQupn9Z3IrjOkN1thBLQzABM4s/qSIcKsJKielzI7GX6sEvRNSmQr/wztexjKm+RsdZnDxz+NJMMgMx1qd7SxvM/rxSo//4q4t22mXvZEwR81VWYI/ZRi+agPIRhCFtT7WnzrBn2ZcDWZ+XkSrfun9bnGzDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRGrxkwCGoRmDJVmWtGcVrqCKpbBMU/fv95Cgxayhus=;
 b=AA6sPdSplfBOXY7j02sOVR1vAAbsWzTp9RHg/N9rI5mv7xqEw6A9is+FYIkvcsgS3w8oiPzXey7w7Q1t9VUgLwvipZROF0AAxr5OwWX3g8BFGzU9YhG48TlvMkFrIp9tlI7dZRO4cXSxFcHq+t23YtNVpPhxlZjqVCV+w6pZ338=
Date: Fri, 15 Oct 2021 11:53:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Message-ID: <YWlPohYpgxs3gRlc@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
 <EB6EE7F3-80BD-4717-87C7-C54FAB0FD832@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EB6EE7F3-80BD-4717-87C7-C54FAB0FD832@arm.com>
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8ff2df9-b22d-476f-7eac-08d98fc1ac7c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31468139CB1D0C7913DDC0B18FB99@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wr8aTuniaI2r2WpKnMwKa8jr8EW1B3tR5KOR0cs4WKHuM+l6+6dkqZfbWpDFwurrbAlo3/5/vjRzeai0teGBY/s+qlBYdzkBn9WmCIImqX0LLbGghx3nYFXj9WZdJY16SM6TiFSDOAyqHNXrHZ7NEuAMOQFWU4JoU5alQRGagCt+wn1armjfnRfJ2PZIQM9su13JrkivXgw/jSfyswT15b+A8U9Qq31A6PafgRFHz4ynY46SRSetF+s8vfDXNvm6HXlIxlRt+KwVvr2OBGNo84VE6gz5SVsoYQ9Qj/yLa6Y8q70n0LdbAFV6cByHXz+zRLazK5rZBgxwRNiHd6P3doILTOmAGbNKBcGRnAbAnm3iMGO4IVuBThuFuJ9YTDEDaf0f3UbaiILsuAVOZBo2E2zEQ5p5w/uwN9IqIGZECaJGHU5lttA/r2yDV6sg+b636WWQcSSgalLahaWeCNfwZlFQE1iJKC7vSG+4/TLJyqoIMvordktX8n8wsevFoG+wbEYFkd0f9L8pMnrIPvxjz9cXuCf0/bgVWppG8ZqB4u+4tSwdXhv9bUL0WG1QIFP86UuzMAU4iyH9LG9NPFm88nMKYlVPeD0BXB3jvPJ/y7EStntj1qWEOJh+e03l+EyVYIQ+SiHyp7vWMhxPXvS49Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(316002)(83380400001)(6486002)(82960400001)(8936002)(508600001)(956004)(5660300002)(53546011)(85182001)(38100700002)(2906002)(66556008)(6666004)(66946007)(86362001)(4326008)(6916009)(66476007)(8676002)(9686003)(186003)(26005)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkRNTURvcVUxNWkxUFBvNmNlZHJlb2pZOXhhSWlUeHRoOVNzbTRsanRqbFd4?=
 =?utf-8?B?b2ovc2ZiVTZWdmRIOEFaMUJ1TTNhNmRhSmFSNjMvRFB2Wk1UZW1yTmZlMUN1?=
 =?utf-8?B?SHhHWC8rRU9EZVMxTG9qK0dXWm1jaC9HZ1V5MC9wVzdycWpjSTI5LzJBeCtC?=
 =?utf-8?B?NkhTY3JPeTVneXZQN1FJcnl4ekFYdnB2Rlh0cVEyd3V2SGMxQU9KeHJTK0pt?=
 =?utf-8?B?eWpRK3BReGU4WEc1bVF5K0l4NEVHYnQrOTRYaFlPK0NKYnFlOTFKTU5STlNT?=
 =?utf-8?B?TFpNTlJmQm1VR01OcG9vbStHOVg3cFBxYnpqc0ZiVHJIR2pxYXppc2VKSEE5?=
 =?utf-8?B?TW1iWXFpdWh6b2NCRWNjNFR4Wjhnb1RleWNTaWdEaWpnRnBJNDh4UWJpLzl4?=
 =?utf-8?B?bDY1RmgzckRnOGl5ZWRjQmZYbisxMklhQzUyc0pLZzIyKzJ2UkE2NTRSa1pP?=
 =?utf-8?B?dnBERjFwc0hmQVpmeVpFL2ZXc3p1MGhDUjFxOGdPNlNOMXRxTHphR1ZRWXNO?=
 =?utf-8?B?M1ByK2JIL3htNkQwVkpPUm1zeHVpNHFsaU4rL3hsTEorMWtFMU4vblZRNXpF?=
 =?utf-8?B?TlppT3hSczhCS3k1L3ZsME01SklNOHdiOXhDTmVueHF0MEtDeVFuT1NxcC9H?=
 =?utf-8?B?aUhOUEx2LzVQU1RBVTZCd1NHcHFNZWdqRklIb1d1bzRRL3cxYm5ueEZKZUNO?=
 =?utf-8?B?ZEkxZVFzdkxDK2svOFpjWWJPcy9KNjRUNzNrOWdtKzlQUFBEUGNhQ0txV2Ur?=
 =?utf-8?B?MWxOdlpkOFVvZUQrM2cyczFnM0g1TVBldE5mTTByOU43MEhaUWFWaG41UExi?=
 =?utf-8?B?QnREOVBRMGdRQjF2b2xETlZSNHN3OXA5QkdJaEFxeXNnNGE2ZmlPR2JWb1Ju?=
 =?utf-8?B?a3F3Y290eE94SmN5blN5RTVjcFJTQ2VKQVZkQnFWd01adVd3TGJ4T2o3SHBu?=
 =?utf-8?B?ZC92Z3hER1A4cVZkZTRPSlJKaU5uQlNNK0grMEhPb0t4dzFzamRJVlFVZGIx?=
 =?utf-8?B?eG5QL1QrckxPZUFJS2hyZWJJbGQyenFEM25pSTE2TGFQU3dBaW53cUVKeDAv?=
 =?utf-8?B?UGRLYjE0V3NXQjQ1UnltdDBZU1NwaXd1VHNUM0dJeW1SeG9JMERZbXpiMjF2?=
 =?utf-8?B?aVh6NytLUnA4MmtncVNOdHVMRXFtUXpoaFNRemxBdHJzWHNWWXZaMXpvczFZ?=
 =?utf-8?B?cmtFV005SDB1MVo3L1hDV0JYck8xWE83Um9HOGxqTXl0MlhEN3RlUFZMMWxP?=
 =?utf-8?B?bXMyQnhLZmQ5NHd1RkJWL0tkbndCOFl0dEtOcVFocC9SQ2ZTR2twdXRESGls?=
 =?utf-8?B?ajV0NzY0TGxSRGNlTFh5c1pzS2RycUg1MSt4ZVQzZmNpOFNGUm55OVpYV3R6?=
 =?utf-8?B?bUxTTFRLSTI3dm03Q3V4c1dOSytFYzgxdW95TlNsbkZkM1VTVFhIZHJkcjND?=
 =?utf-8?B?RWpXSU91NTdJQVlFc1Y4cTIweDFnanZjekpoMDBvVlJpRkVRUVlBOCt3bFpO?=
 =?utf-8?B?MjhucktXWWJpSE1CaGE2RFk5TTNzQVl5SldGcTlRVmVpM1B5QVJJMTRBRm9Q?=
 =?utf-8?B?VGlWaVFibmNCUTRIbEx0eTRwMDgyWjZFRXl5SnA0bVVHUWdvN3ZYQjIweW5W?=
 =?utf-8?B?VjZORFN3NFJxdEw2YThGbElVclRIMi9rdEIxVFlJTXdZbk5EZGhsdjVvQnlQ?=
 =?utf-8?B?c3FrTk5zaTBDZE0yaUFocXA5TG01dkxhWGpYTDJVeXF2NUFkQW9laXc4UkYr?=
 =?utf-8?Q?/ad7L87GuRbWo5Ols0ENcKvqIMNoWKCCtBimABA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ff2df9-b22d-476f-7eac-08d98fc1ac7c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:53:43.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bxw03+0XwsH93gBF/35HFTSPaDV9pJxcl6MJt3npGaWpBYdUKC79N89dNMDRdiehuRneHGhWLVnVSaqa56WgAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 07:53:38AM +0000, Bertrand Marquis wrote:
> > On 15 Oct 2021, at 08:44, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > On Thu, Oct 14, 2021 at 03:49:49PM +0100, Bertrand Marquis wrote:
> >> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
> >>     reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
> >>     read_unlock(&d->arch.hvm.mmcfg_lock);
> >> 
> >> -    if ( !vpci_access_allowed(reg, len) ||
> >> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> >> -        return X86EMUL_OKAY;
> >> -
> >> -    /*
> >> -     * According to the PCIe 3.1A specification:
> >> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
> >> -     *    in size.
> >> -     *  - Because Root Complex implementations are not required to support
> >> -     *    accesses to a RCRB that cross DW boundaries [...] software
> >> -     *    should take care not to cause the generation of such accesses
> >> -     *    when accessing a RCRB unless the Root Complex will support the
> >> -     *    access.
> >> -     *  Xen however supports 8byte accesses by splitting them into two
> >> -     *  4byte accesses.
> >> -     */
> >> -    *data = vpci_read(sbdf, reg, min(4u, len));
> >> -    if ( len == 8 )
> >> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> >> +    /* Ignore return code */
> >> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
> > 
> > I think it would be better for vpci_ecam_mmio_read to just return the
> > read value, or ~0 in case of error, at least that interface would be
> > simpler and suitable for x86.
> 
> I am not quite sure on this as on absolute to read ~0 is possible so the
> caller cannot distinguish between properly reading ~0 or an access allowed error.

How do you report an access allowed error on Arm for the PCI config
space?

At least on x86 I don't think we currently have a way to propagate
such errors, neither a plan to do so that I'm aware.

Thanks, Roger.

