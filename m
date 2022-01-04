Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020F483FDC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 11:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253139.434211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4h0S-0001WP-JW; Tue, 04 Jan 2022 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253139.434211; Tue, 04 Jan 2022 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4h0S-0001Tu-GH; Tue, 04 Jan 2022 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 253139;
 Tue, 04 Jan 2022 10:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JPIW=RU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n4h0R-0001To-5u
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 10:25:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fc9e791-6d48-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 11:25:24 +0100 (CET)
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
X-Inumbo-ID: 9fc9e791-6d48-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641291925;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xStOGfvbfzC2fB02sEB6SIhAPglO6dXVq+UGMYOFy+E=;
  b=P8EwQ5srYwgLqYXrfv8ex2EjEhAuYWsbKeMbaBMhZRyfG2r4sJ7WAJcx
   jjaK/XayU6eJ2uU2XmrA5ADIgGHjl4G0pX6P87F9vqnXQZDyTRkMfS/X0
   Uh/ZYC3PHqORWstq8WzrvFG/CzCt+4XnQy30NjM31KZtSbxmg2eVmRpDw
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yfrtZWW73y/8JpfOKtAkrjTXDqdPBOAPyjuEzpVVkI4dQ82d6vmTdefJ3LPegBbg7X2eCiYQ1R
 U7Gar8QZTi6+8WI1NZGgOHqoCOB3uAW3DmXLtEwZZepvU7awFqWc/oGeOeinqRBZEA2G0m2rmW
 2/8iFduKk9qp7zKUtGFCDccvjjhotKWa6O3MmL8LsdE9XSzrNuKz1GzziE2711MLpOj3RQ6q19
 ygQetqCkRPIB1Fm0pZAaMHvAfnlzqpy7Kq6TFuvAM6aDb9t4SO2oZZRELJiYDka8z1XxmNX3Zn
 2mkT87sr1l1MDGVgWucUdIDX
X-SBRS: 5.1
X-MesageID: 60742754
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y82r+6O3naKXr0XvrR1vkMFynXyQoLVcMsEvi/4bfWQNrUp01TFWm
 GsfDWHSaf6MYWP9fo9zOoXjpB4DvZOExoRkHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eo/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyegwulPy
 ud2iZGhRlogM4qLxMc/biANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uSuoMCg2ps7ixINbH0e
 vcbYBZvVT7JWRdBJW1KE4w3tt790xETdBUH8QnI9MLb+VP73AF3lbTgLtfRUtiLXtlO2FaVo
 Hrc+Gb0CQ1cM8aQoRKL82ihg+LTkCThcJ8JGaejsOVtnUeYy2IUEhIbE122vZGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQslfZhyAeaeFsHvw1tQiA7e2IwCSkPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj70hu+aTNT8D2BN1bQ8xawaRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8B7rGnwoSL9Jtg4DNRCyKBBaJ1sRNMUS
 BWL5VM5CGF7YRNGkpObk6ruUp93nMAM5PzuV+zOb8omX3SCXFTvwc2aXmbJhzqFuBF1yckXY
 M7HGe7xXSdyIfk2l1KeGrZCuYLHMwhjnAs/s7iglE/5uVdfDVbIIYo43KymMrpksfja+VqNq
 L6y9aKikn1ibQE3WQGOmaY7JlEWN3krQ5fwrs1cbOmYJQR6XmomDpfsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:g6ZeK6OxNZ7vr8BcT1n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,260,1635220800"; 
   d="scan'208";a="60742754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOk/BMJ+suUpgiC0G/Z/dadW/r0WYJ5l7CoJt35LacIuhK/xK9G6oj4Z3H4FDXRwAGXGNfQXqJZk94uIT/9k8bES7YdbGj0NFJ9wH66PFFiSWaEdA32WdSRZE8E2k6qD2ZjuQlmAz01Vny8icNSSQTjBwMTwxVQ3ltO+RIZU6hNe+th5UY7DK5FmnDRUYe5CPJWrKTODjicz5gayFl81f1DHtv5fmo7/hw2P3gffEKaKe9l7HjX4L60eMbgZJYo5VbAejY+3XT/MAfTWbXjKD2vRoXMCKnxNL5zSieHSrA1rNleR3WWxpQ+UkaCosaWk5ZX4Dfg78uv320+6MojjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CoJ5Z+gCsz/TXYsj4JV1gOcEDecdibliOyT7JUOI8E=;
 b=fV0UjfmWeCT7o6RhXB+TX15c53u5tJW0dlhoXeXEvmEqtmQTaJhfcG4cmo9Lso73kmMwFgrSLH2mW0GBwG2BSmrFLjA6SwTExoQlgxAeqkZOmYH3KvbAyzdoqKGsqSMlKvfhXXibx7bpH13fMGqAuimlOs1KX1y7FvuySVekWwjs7sYE/Cj67F+Uur6TxAwXIGxSwpqyahEVGi/AjYziiR1jius4GUtvx6IMisCctAhNqdz04r93IFGFJU1gOlyiBtDpxav/DsCOR/aLJ2RgiuC2Op2DrRpc1/Z0eVWJxYHWUMDHjDBRsTF/5Lqy5wWhpzWSmcT9PSsnuWWbJSivOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CoJ5Z+gCsz/TXYsj4JV1gOcEDecdibliOyT7JUOI8E=;
 b=rYCCQicx/aOf9DyYq/mIhPaIAPi0FEU+hZMfnDCr7HuOWbmT8UpgDBl4/TmfE1RFCJJ7Vp9H9zrG8ZZqeuMpOOZO3494tjuOApCzxtRYB/Imn9mQgbSlUh0RholBuF+CkdWzJvw3kPI8fJIey4aTmUKKgmADstgq9+8S1gyWiT8=
Date: Tue, 4 Jan 2022 11:25:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YdQgf2+E467kuTxK@Air-de-Roger>
References: <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger>
 <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
 <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7487c276-2564-4499-2d96-08d9cf6c7b58
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3579D0FFC89C6E0411CAC76E8F4A9@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1Bkv9l4x3h5wYF1M1zLTgf2swbQq2CnNJVBbdtn7UThOK6KxaHqzhhau8wrC1wRWK7+8h0T2F84G41z3d2pLkdockJzsWdeh0pCqln6VlGuvFkzKhA+kRygw30tKNtbb0XK+AT/w7VpW9bs4lYUaGK9X2W4PaUAuPrM3A81dLQXh0HNchNBG0bmhUMW/+RBms5LC/5IX2830hTa5zbjGK4+PKvlqxeAsw0C9DJwn6i+Q9a+uQKsMJeQMlgy9xn2ldgEB5vH2Ff+0rIZVea+CNWdSbbq41ssKx/PJNVqsPz4pDAQGfk/sImQNlZA5HR4jVSSZfHUV59JD2c/ImG5I/5C2axLdoAyoKnW5LCheZ59nPshLuv3ke4ApnukOksro5sJv9jb7iUDGg3SCKCzHOeqWljykIOBQtpjyUyNmQpLgWUFhPT7HzphA70JrH6c6vtad7tqJrQYSyUBk0xNrn8DuHuMbeRGWb38IxZF+Sz28kYmxD7yb1M9/zr1Gzd60Yvl7NXB8qry68PTNvnKFdql8KfPlKTY3Agkanw2HA2IqkAqlHUS3sRmKCIwpTlcH/qC8EtYXzhruRkrxTXpg7iCYgS2iQcpuzbuRh7A2raIRPYtB3eB1O6v/M4Cmj0DxedflnruUPZsPnWV/70Vv04sk5oeaw9zoFIZYhJAZFTPjvVIBIwQtIcz85N8Uudy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8936002)(38100700002)(86362001)(66556008)(5660300002)(83380400001)(316002)(2906002)(4326008)(66946007)(6512007)(9686003)(66476007)(33716001)(8676002)(82960400001)(6666004)(85182001)(53546011)(6506007)(26005)(6916009)(508600001)(186003)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZzNUEwQVpxM0plQW81UU52bVkzazcvSVZoQThlQ2ZWQm1KM3pCVk5MS3VJ?=
 =?utf-8?B?WWdKaGtsVXM1ZUFoVllJUDREcUx1SHlIMVNkUzNiQXJrU1Rla0hybUJWMDBi?=
 =?utf-8?B?MDl6Uk5VY3NmeW12b3d5ZjBKTVc0UWxjanZFa1BxeHgvL284eFVLV3BHcll4?=
 =?utf-8?B?d3VPT0c5Um9JblpjZkhIb1pSMGJHWGpHdzZ3cGJxeFByVUxUV2tYdFRKMlRF?=
 =?utf-8?B?MVFSNlBRS2xzZWRMbVQvVGwwNDRIb3lXUUx4RkExWXd1dVpyeHlmY21vVmxM?=
 =?utf-8?B?cTFEcW5jS2FCb2dMWFlXR3NFVTZ1Ky9aK01DQlhLb3dka3hVemNBOW1CdExt?=
 =?utf-8?B?M1kzRkFoOHBndDJhZGc2eDVJWTdFdjBuZVdmNTZ4WjdqWitqaG1HYnBvYnFY?=
 =?utf-8?B?OGFVaHFxbk9QVC80ZThLbXF1TS9OTUpYdGJ2cW5EWEI0Q0pGRFFHRXYyVW1m?=
 =?utf-8?B?dkVnRklpdGtacVNpaHBQSVdMWG5zekhrWVdMZlYvTDJsc2hwVDUxN05vY0RT?=
 =?utf-8?B?bExzVitBSXFNYkllMG1NSHRnT1Jmb05PVkIrNU5jcExmZlNDUFJNSHE4aDFM?=
 =?utf-8?B?d0EyUzhYMXhHYzNFejNlaUdpdmtBQzBGUFJUcmlKY2xNZ3UyTzlrMUVvTE11?=
 =?utf-8?B?MnhSZnZSalN2N0NPZFdjWml4bnp1bEd3SmJxOGdxaGVBdEc4ZExuM1dQTXIr?=
 =?utf-8?B?VkgvaElaUERyY3hEVGdENDR3cUhwaG93cjRBYzQ0ZTk5d0dobjlWdGFSVENs?=
 =?utf-8?B?YWNTeERCUFJjVEFlUWhkSktkQVEyRGJicERVdGtQRy9vWW9SQUErQlBiYUZy?=
 =?utf-8?B?V2VnK0RxeDJnVWVBeklaTGIzaVNMQ0V6cklieURVM3FhL3B4SFFQbW9VeTJW?=
 =?utf-8?B?cUJLWWxaTVVTNVlaUmhZbkNobFlyOHVSUWkreGpSRHB2Y21xR3l4QmVvMFJ2?=
 =?utf-8?B?N0ZhZ2RKd3Q2OWZUVW5wWGRxNG1IQ0x0YVZHcURIUkNaOStMc3ZaVVQ3QzIx?=
 =?utf-8?B?d2NLQ3l0c2ZwSHNUT3RuTFNzaEp6R3dDVHpRKzJsb2ZBL3hkTmo0NGlzWDZj?=
 =?utf-8?B?SjNXampNeXk0WTFITG95aGZVelprL3ZFenhibHdOU05pTWV4b1VCSkM5NHRG?=
 =?utf-8?B?L294TGl5ZDFyRGYxcW14M0RrKzNqRkI2dFFkdmZRZ0VsdDJRdlVjdkJPa3NM?=
 =?utf-8?B?VVJuMTlxU1FzOEhzdTd3cmVRemxjYTNKSXM1dDQrTzE3SnlxcWl3VHRyZ3lu?=
 =?utf-8?B?ODVSZGFsdU1tT2pYQzF4YnlWOU0vMkg0aE4vMUNkMTJnbXVNbjZIcldzL0Rz?=
 =?utf-8?B?WGdnWXBudXBLNGVIUmhyM0hQZnVjWTdaYU1HNWZsN1BPZnNJOUdLdkhLRFR2?=
 =?utf-8?B?dTNJcGRsNWd2NDkzZE9saWp5dUo3eG40eHdNcmx6aU9ZUGRTVkFabXZpT3dZ?=
 =?utf-8?B?TllHUDJQYmFaZmVEcXBKNUliamRKZXVnSjhwSkVnQzBYRkpuZXdaSkJEaXZr?=
 =?utf-8?B?alQ3UmFhUFhma2NSUFd1dC9LUjJSTGo0OXNYRWRWZjM5YTNlcU14WkN0ZFRH?=
 =?utf-8?B?S1Awb2tHanAvYUlmZE5GUFZTWHdUY2VzdWZhVDZXMHR0cEVHTENzc1B2SnNi?=
 =?utf-8?B?SExZS3ZWMDZPc0RrODFWcjJDUEljYnpYczdIam9xNWRZZFVudkNPbHhuZ1pw?=
 =?utf-8?B?OWZERHlzbW5QYmlMU3N3NnV4Y1FDeUxzN1FiaFI4VS9OVTRMck5VQ0tEdEZm?=
 =?utf-8?B?Wm1sVC8xekduOVNDN3dWRlVQWng1N0tqWGhmUUlZTVB3MnI4bXBUNmlwQjdt?=
 =?utf-8?B?ZldwMEgvTmFlTHUrTWVWV1BuaTVaYldGbmFxSEJjbnA4Q1hDcVNJeitDbmow?=
 =?utf-8?B?RUJiWlViSis2SllIQ2poMkdSMEgwRnR4SzVoQTVFZVo0Mi9wUE9YUkJIbEFD?=
 =?utf-8?B?dk1tYzhNazQ3Q0tyWjRXTytnTUR6VS9naG5RRG15QUdpR3JPbWxSYnd6Syth?=
 =?utf-8?B?WEtDUVBEYkFPeGF5Y040YzFBVm14YXpUVG0yUGJ0UVJ1MEVhcE9rZklJWlpk?=
 =?utf-8?B?SjB1WkREWHg1eEZobDhhNll6cGFya01Fcm0rYXRQT2FhNHYreEZobUxoeWVz?=
 =?utf-8?B?U1NvbWp5Q011cGdodC9senU1bnFDL0UvZ0R2ZUdLMXBxdmFpSnlQODlaUlRF?=
 =?utf-8?Q?sTzwf/IKDSRj/Y+6pLBQobU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7487c276-2564-4499-2d96-08d9cf6c7b58
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 10:25:08.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhmzXJpEm+t6JSys3Juzq3F5kdUjB277tYX5XogiqEtGwoRjyDkXhXkD0NLVaTaZY3Ol8lOSP8FdqwOuUbF1gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

On Fri, Dec 31, 2021 at 10:47:57PM +0800, G.R. wrote:
> On Fri, Dec 31, 2021 at 2:52 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Dec 30, 2021 at 11:12:57PM +0800, G.R. wrote:
> > > On Thu, Dec 30, 2021 at 3:07 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Wed, Dec 29, 2021 at 11:27:50AM +0100, Roger Pau Monné wrote:
> > > > > On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> > > > > > >
> > > > > > > I think this is hitting a KASSERT, could you paste the text printed as
> > > > > > > part of the panic (not just he backtrace)?
> > > > > > >
> > > > > > > Sorry this is taking a bit of time to solve.
> > > > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > Sorry that I didn't make it clear in the first place.
> > > > > > It is the same cross boundary assertion.
> > > > >
> > > > > I see. After looking at the code it seems like sglist will coalesce
> > > > > contiguous physical ranges without taking page boundaries into
> > > > > account, which is not suitable for our purpose here. I guess I will
> > > > > either have to modify sglist, or switch to using bus_dma. The main
> > > > > problem with using bus_dma is that it will require bigger changes to
> > > > > netfront I think.
> > > >
> > > > I have a crappy patch to use bus_dma. It's not yet ready for upstream
> > > > but you might want to give it a try to see if it solves the cross page
> > > > boundary issues.
> > > >
> > > I think this version is better.
> >
> > Thanks for all the testing.
> >
> > > It fixed the mbuf cross boundary issue and allowed me to boot from one
> > > disk image successfully.
> >
> > It's good to know it seems to handle splitting mbufs fragments at page
> > boundaries correctly.
> >
> > > But seems like this patch is not stable enough yet and has its own
> > > issue -- memory is not properly released?
> >
> > I know. I've been working on improving it this morning and I'm
> > attaching an updated version below.
> >
> Good news.
> With this  new patch, the NAS domU can serve iSCSI disk without OOM
> panic, at least for a little while.
> I'm going to keep it up and running for a while to see if it's stable over time.

Thanks again for all the testing. Do you see any difference
performance wise?

> BTW, an irrelevant question:
> What's the current status of HVM domU on top of storage driver domain?
> About 7 years ago, one user on the list was able to get this setup up
> and running with your help (patch).[1]
> When I attempted to reproduce a similar setup two years later, I
> discovered that the patch was not submitted.
> And even with that patch the setup cannot be reproduced successfully.
> We spent some time debugging on the problem together[2], but didn't
> bottom out the root cause at that time.
> In case it's still broken and you still have the interest and time, I
> can launch a separate thread on this topic and provide required
> testing environment.

Yes, better as a new thread please.

FWIW, I haven't looked at this since a long time, but I recall some
fixes in order to be able to use driver domains with HVM guests, which
require attaching the disk to dom0 in order for the device model
(QEMU) to access it.

I would give it a try without using stubdomains and see what you get.
You will need to run `xl devd` inside of the driver domain, so you
will need to install xen-tools on the domU. There's an init script to
launch `xl devd` at boot, it's called 'xendriverdomain'.

Thanks, Roger.

