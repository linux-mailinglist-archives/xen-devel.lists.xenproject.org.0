Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C684393D2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 12:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215726.375088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexJG-0008IF-8u; Mon, 25 Oct 2021 10:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215726.375088; Mon, 25 Oct 2021 10:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexJG-0008FP-4l; Mon, 25 Oct 2021 10:34:30 +0000
Received: by outflank-mailman (input) for mailman id 215726;
 Mon, 25 Oct 2021 10:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mexJE-0008F3-US
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 10:34:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20d82b3e-357f-11ec-840e-12813bfff9fa;
 Mon, 25 Oct 2021 10:34:27 +0000 (UTC)
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
X-Inumbo-ID: 20d82b3e-357f-11ec-840e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635158067;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YSZi544C88Nob1tjO1skucxBbOSO6+3t28tJj+zrt4o=;
  b=XzYx2/ggawu5Pyr9d9KEe53uK3CMg2keR4+vH6FUUzxKP6INa12zFiG0
   Nt+WVjGHhoDhCSqCAdCHnHtank1pDrbwr4IkYMF1r4UqmNXHuy9Iut3+X
   71OCg2vyPpkh1Harn9DZ2rzh0WJnGAoCIGl1MTV9sBHfkLDYZ9h572zUC
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: r8OzRXnAKkJn5Mwq6kkVEDgq/2g/ne2q9Y3pWvy45Rx9Zj0xztka3/6YnrtfrXJ+juHRO+0jLK
 N03/wMTN5PxJgvDNjHY23qmeygEjGlGILm16hNR7G7ksho+G6E1930n8Ad6enM4IePcYlc8mk1
 EtGCWhB3lR4KOSW+WC6aTLYgNyTYg08Vr+/1bcjHtOYPJkEYoKApUPyMpF3frmePEAs/qb+89z
 QTDYaZ48X4viRZACx+35aMmMbqfoTgFCWzgQsPc5dXwQ49kXbA6hSMHoBH42yazfEBSmuRe2ki
 1bjhSV6z5y+KmhpveQkIrIif
X-SBRS: 5.1
X-MesageID: 55968715
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:So8QOqvNaXfTSO7d/GpZdOHFDOfnVMBZMUV32f8akzHdYApBsoF/q
 tZmKTjTP6zZMzHxf9h3OYXi9k8AupDRzNU1TQA/+Ho0QyxG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrsW8dAgUD6jwnadCVTd+CX1DOopp0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY250fQ6aBP
 pdxhTxHXCbAPj5fEFotJI8sh+b1uF3/VjcfgQfAzUYwyzeKl1EguFT3C/LefdmPRNlJk1yDj
 nLL+XzjBRMXP8DZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6VG24ARyZOQMEjtcQ2AzEmy
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqfnYIcAQ40tzfpcJsiDzpVIpeF4map4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVqPADr0hu9tTMv8PdbwsAmEhRpVBN/BFgHpg
 ZQSpySJAAni57m2nyuRXP5FIrit4/uUWNE3qQ8yR8d/n9hBFnjKQGyx3N2cDBoxWirnUWWwC
 KM2he+2zMQLVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhD20yBB2wPlnY
 8fznSOQ4ZAyU/QPIN2eHL917FPW7npmmTO7qW7TlkzPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAVzbOi44MOi0A8cXQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN0251gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:Dko7bKuju3LZHZY7t0L+1t9Y7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.87,179,1631592000"; 
   d="scan'208";a="55968715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvJ2v8M6GQ51E1wJ0vNjXZyBWyrWCD2wTzAcnN2iI6z5FpZUoixjYnfxIDcP2UWE5U2AnUMBItmSUqWuoDQluebjvDZgpsazKOFT7jeYiSt8TZmc2SqOitCtrREHuSCQThJZr1xOqmqcScIzEFTmnMJGV2Vb+oFJw3w2C7awE50sALg7SOVdwilj+iqyh7L3OaVRAmSsqr1/Ffc1oOEuqhhB/sjt+HHCbY6veI27ESB/rd1V7w3cjC/QE5kvtUJuTCYkVQIDY+FFC+EYI5bT6qCvzlv92o3Qui6nR0VBv5vINv9a+clNWmQkG5RNYLqYJIF5mEyxE7c06zgxMVscYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nCphM0qehXxLpXMY94FrGKziRSZo2a3YJeA1Xj3s1I=;
 b=avifw8CMJLvcr0VeqtuDhwHWnadIq28VVzjFOQxpIiQyL7Ve+mCmFiq2El9F08YCJgg3Kk3muN6TD8lxJxxGHTXaryz+ZYqjrkeFeVoayDHG4FFGuHnZjqsa2e9YR0TBcyJRrV9Zx3VElmw9iwxUpWPSxZ5rDSU1S2YiewOCuULUKBEH7+Q87o+MyHzYfTlvItOugzKnZ2IEkpJ+7YVbCLn3I5IQjnlwZO0yTQsKFMEkt4DaBbREw0elOICD8Cuh337mJYTvDdece/4SAn7wX9fAWcWAB46jkoqeeRH2/tjF1PWEyGfgsQZfZGNalFXi4g1uyWteuGpEmZq22ish6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nCphM0qehXxLpXMY94FrGKziRSZo2a3YJeA1Xj3s1I=;
 b=heUb22s5LuDe34sjJdO2e36kyWySnsqzk+BSw/CsmT+dGyz/Pv47zr5s5vsA29mK0OhQ3KiWZZgqeh6KPgOznOVc9sYBPrlNqJnkADRo9nyetL5UNK8rO2Hq6o8liKMWKNFiBcBMWu6FEAXelhZqqa1Xt6Lq3cKobCU064ANeDk=
Date: Mon, 25 Oct 2021 12:34:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <George.Dunlap@citrix.com>, <dunlapg@umich.edu>, <jbeulich@suse.com>,
	<committers@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] governance: communication channels
Message-ID: <YXaIKZD8g6kQukhF@MacBook-Air-de-Roger.local>
References: <alpine.DEB.2.21.2110221535000.2311@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2110221535000.2311@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: MRXP264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f66c1f1e-c187-4782-3f1b-08d997a3025b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47634EC415F0A4D01C41F4E38F839@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4pOzQoONUHfZO+9Wr4QdnmJPLc0E7uc9nrjPJGf4jeT6/6SQvCob7z2PcMOwFsKDXasn1KOIDPZHEMFYb40yRqFKrV6rod8vgR3+CE7XKG5pN2lyiYTJXQFGNUGqPVtprTTFIQ2Ply/QYTr3JDWWSN0zcwXHRwSTCmk2B0nzE8pEqeIKWzPvTkh4atQhPhNwnbsxewTohl6yYIPrDhs1LxlA4iXBkxJ2gFiLJHkuh/qkRvm/s/kZ7HhVwfH8wIsv11GV7lCeF/g/o6f42/hgFlMu6rt68816sXpGALv6fqBbl52TZV2tUnn3IdF4Lu8X0eIr5wM9GcanderBAVSn4czwyuplp668CT5ndXZCmssYc/cATz7FDp4qYJpGP1+G/dYDd+7QopvzQUPiF+Z3OvqC5svFbnDa4fFaIwjnbbPfrxWMOYwvzSEmRrKZgw0W9x8QgzUcF9PI4Htfw13nTiI2d6WvFo7pCflTDqa3tdIM8qdyOyC3i3ih4X5/Q7GOuOPYa1goluUeb2qwDpfHMToQbuf3DAkS7yV259jaYydMN1qMB4KC0LNZ6HjTWWmkjQxy+PqDT2PJ+2WSPlEkRJYZaAw911HbBOgKUhhPX/RiUrMoUKbzjD//+bO3/pjfoDtMQ1/hMfmL0T6nzBeyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(5660300002)(2906002)(8676002)(83380400001)(6486002)(85182001)(4326008)(9686003)(82960400001)(6496006)(66476007)(66556008)(6916009)(86362001)(956004)(508600001)(38100700002)(26005)(186003)(6666004)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkIybTIxRDlrVmVoV29zWitudjkvTDlGck1HdmkreWR1d0hiYi9wL3REN2d1?=
 =?utf-8?B?QVFRdk0xZUYwYzR5SDlrMjVDUVZabDdPanJENkl6MGdScE9NUDJ1RmZmR2Y4?=
 =?utf-8?B?S1hOMnRFYlMyYjV1RGUwUzNHVE1HaGk4RDFwaEJGZHBwTjN2aXdFdFNIT3Ur?=
 =?utf-8?B?Q0h6N0FPYy9TVEdyTllvY3ZwU25SanRSNVI0SVNjWkpnUFpkK0xraDBZdksz?=
 =?utf-8?B?NlBIMy9YcVpZM0xtL3AvUHZmYmlkTnlXcncwSkM1NFN6dkRWMnFXWUUzdjIx?=
 =?utf-8?B?ZzUyUGtlNEdseHFXUmR2QUNpK1R4Z0NOaXNWVmdwT0twcTBoTi9walZPTlo2?=
 =?utf-8?B?bDNPNjVHcW5ScVc0NkRVdHZhclpSYjkrY0EvWXdQQ2Evc2JFODhSbVI2Y0FE?=
 =?utf-8?B?VExLQWJBcFl2Q1hNcWNQbUZwMFl1UTNFWWxOQ3N5QWZZS1Z0VDdKOVpqdkM2?=
 =?utf-8?B?RWlhUkQ2ejEzYy9jSzVYYlNZWjdCejRCRXdzSWI5UEZBNHBMRmNLZy9jSjNU?=
 =?utf-8?B?cjltcmtxN0NJVGxmVTBNa2Nxakp4WkQ3MHJPMDZZSk03Z041RVhrRE5XUVZj?=
 =?utf-8?B?elRrOHdrUzhzMS9ZUFg5UGZvUTIrN1RFS1drUm02QS9iVDlTb1g2Si9wWTdV?=
 =?utf-8?B?aVlKNU4reTI1QXk3aWY1NnRldVlEamJNMm1MVXE3cDY3dHhtOVdaY2h4bXRa?=
 =?utf-8?B?ellUUGM1NEQ1VWlMSllTTjFKbk9IT0JEdEg3YUNhNlFHZG1QQzBWd1J6bkNp?=
 =?utf-8?B?ZkhzbGZHVkVIRlhmN2lLbm9IS09sS003RitmYmpyR29MbDJsM01CRGRwM1N2?=
 =?utf-8?B?VzBQSGE4U3pIK0lsSGR1eXQ4RVFjTXpVNHVUQzQxZnduL3p1MHpjZTM5TWsw?=
 =?utf-8?B?STJtUG5ORHFYb3E1N3F5dmlvTGtqTE5VWlJoL1F0V0l1WlNSOUYvbFhNMHBI?=
 =?utf-8?B?UVVTUCtHUGYxaHFiYit5T3diOHgrWnQyL3BVZ2J6WVZXTkxCU281VTJ1TmUw?=
 =?utf-8?B?Zy8wQXNnejlkUUx2WDBRZTVCZWVWRDVMakNOWWRWTElxU2VLMnpHWW1NdnlI?=
 =?utf-8?B?NXMveTliNG1KZktqb2EweG5KNnRRbVgwWFpYV3lCYUx2ZEhaY3pPQkozVnJq?=
 =?utf-8?B?ZGxGUEtTa0tNbmFMamV1VXphSVlac3NtZnBKYzB0ekNmN2tpcWdRd0sxOE1O?=
 =?utf-8?B?UDBteXlwVHRGQjBrRWJrZjIxME9RYjJSUU5pc3Y4WVozbmFWaUlYS3FxUkJi?=
 =?utf-8?B?ZWozZW5uSG5jTjA0Wm9zZm81RXFOdXFCSi9Pc041MlZLaUVWRkFLNUxZZWRH?=
 =?utf-8?B?Ulg3ZUZLdVRuQjhia053cUwvT1pMZ0YyZzR6OS8xNW1kRDBvUjJoKzNTUllr?=
 =?utf-8?B?NUZPaDYvcGg4WnhySVJjQm11di9JbzFZbklseEpmdDkxRlNZelVyVnlNbnZq?=
 =?utf-8?B?VDRQY3BZQkhtVi9nbUlIYzNnNStvWlRYYnl5aVlja1I5UXZZOWlsUjY5NWNh?=
 =?utf-8?B?enNsU3JhZzM3Lzl1c2NMZTYyMmxqem41VC91ci9xL2hmb2tkcHVwMkRqcURP?=
 =?utf-8?B?N2U3RzFJL1lpY2VtcDNSUVNaTEs1MzUrZ01YaE80WDRxMDdNNWNPbFNMb1R2?=
 =?utf-8?B?TU8xRnJVU09iMWs4QjZaV0FVUStvckpuY1M4Tzd4bzBhalh1d1VpZktSeWtL?=
 =?utf-8?B?UTIrRlAxVTYyTWlVNlNUSEdvckhwcVB2YkMycTZlQ3QrZjU4cmJ3anRsV01H?=
 =?utf-8?B?YWpMT2hVWkY3cDYxVk5lRFE1ZmQrYzQ4VTB1d1huNkIzbkMyWWZ2NTlxRW5k?=
 =?utf-8?B?MGlyUlR6eFBnaEFrSVhTazVYanEwUHpkYVBGZGF4MUIrQUtqWEp2OFppOHZY?=
 =?utf-8?B?cVlFYkZneTgxckpzNjE0MjVlZ0dnWkduZ05qYm85aXU1SHNqVVljRVNHOVk5?=
 =?utf-8?B?ampJZTZZR2YxWXZscGpSKys5Z0k4MG55VHBMYmFJb0lpUmdqU0tzdVJRUzBm?=
 =?utf-8?B?WldjUk51MHppYXFTdGJGazFXTE40R3hkNXVtKzBaZGhCeVNnT0FCUTJkTzBB?=
 =?utf-8?B?Wm5XMWNRT0NqVG1pcHQxNHd3UGgvc0g5eHB4djIzSG9tL0hxOFJhQ1lneCt2?=
 =?utf-8?B?UXRGQ0ZINFp6anlOQ2czSnJQN3VQcXQwWURUOUlKQ2xTSnZZRTZBbWo4cVJN?=
 =?utf-8?Q?13c+JZsC7NHVRYH3lPk3Sds=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f66c1f1e-c187-4782-3f1b-08d997a3025b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 10:34:22.6714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5swE7Z9DCMH3bo1bsa9qTg/rc1T/7qJ5yAQvPHSMm8wKUjGhlxSEDso59NORYnMzy0LtrBYH+YRFbU1TGZXAiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com

On Fri, Oct 22, 2021 at 03:59:51PM -0700, Stefano Stabellini wrote:
> Clarify that xen-devel is the only official communication channel.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/source/communication-practice.rst b/source/communication-practice.rst
> index 70f5b8c..356df7a 100644
> --- a/source/communication-practice.rst
> +++ b/source/communication-practice.rst
> @@ -9,6 +9,22 @@ This guide provides communication Best Practice that helps you in
>  * Being aware of your own and counterpart’s communication style and culture
>  * Show empathy towards other community members
>  
> +Communication Channels
> +======================
> +
> +All important communications and messages should be sent to the
> +`xen-devel <10_>`_ mailing list, which is the only official channel for
> +code submissions, acks, code reviews, and decision-making.
> +
> +In the modern connected world there are several other communication
> +channels available at any given time, including online meetings and IRC.
> +Xen Project has an IRC channel named #xendevel on the OFTC network where

I would avoid mentioning #xendevel and OFTC explicitly. We had to move
networks recently and it's easy to miss this instance and thus become
stale.

The rest LGTM.

Thanks, Roger.

