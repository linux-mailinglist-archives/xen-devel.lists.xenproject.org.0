Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0449B705
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260431.449906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFj-0000il-6b; Tue, 25 Jan 2022 14:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260431.449906; Tue, 25 Jan 2022 14:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFj-0000gU-00; Tue, 25 Jan 2022 14:56:59 +0000
Received: by outflank-mailman (input) for mailman id 260431;
 Tue, 25 Jan 2022 14:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9S-000334-SU
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2ea454-7dee-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:49:48 +0100 (CET)
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
X-Inumbo-ID: 0a2ea454-7dee-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dL8SRFdX0K4/Jxg/plqDNDhq7sj3+sWn0uTEuGyqdXE=;
  b=f1JO5tDaUCeX/OKJKfyVI6UPJohSgRuQTLdMcXgVXtgqXLynfVuZR/Xv
   pUnMRuwv32snXhcnE1O7z6iqIVOPPHm4kj266VES/HwLhTLmsg4b6rpxq
   gaZ348AmZ5sqIGE8nEfPKaReshmZIvf6ZosdyahPZ8sfJjrlwG2sMTLpL
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p+ezTLY20VA6JKIuQSxqZtJyALluGiflJ3VpgFK5ZPkBAF09QjBL5v9dtKNj/dM/PNHCT1+xwG
 V3Ya4Oevcj62Wz85CvHcXzjtJ/Z74vZY2mVSYP01rBy9qmWaIDcTx9tlsJa8Po+SgN72u++nU1
 u+qDU1Ymp33d9+6n3Ndls9pH0swUjOLanD96mw/5HXQySkhz3e9gt0+Z8Fe+LGWq4zYl8PUlpj
 VCRycSd/WN1Ozx/QBE/4oJQbLfAQJdQmySN3/7K2utRlO/VVarvDP4umnIB/q6UgXcwG+pYSmU
 KUVIoE7eDtXImHaK1IpYL0Sn
X-SBRS: 5.2
X-MesageID: 62717093
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TEX0rq/akcNAtS1KqDumDrUDcXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 mZLDG6DP/qLN2KjedlwYIW+o0pV7ZPRnYA1QFdppHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhA9
 NlLrJuJSzx0P7bB28c8UQV+CAVXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmhp2ZgfRp4yY
 eIcVWVKMTaeWSRLFUpPWYNlxOm432TGJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT80jqVAHEDdzx6Nd09uYwVZD428
 ESttoa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHVm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7EFjFtX
 1BewqByCdzi67nXyERhp81WRNmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hOI4V8Au8ANbSryBUOSX25XI552pUQHPY+9Ps04k/IUOsQhHON51H8GibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OSDJIZ9YbgrmRr1pvcus/VSOm
 /4CZpTi9vmqeLCkCsUh2dRNfQliwLlSLc2elvG7gcbaclM5QzlwUqGIqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937ys5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:Q8P5YK7Tlqr3XGCuLAPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbq6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsNmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZSbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczJgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenUPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesYMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO01GkeKp
 gvMCjg3ocUTbvDBEqp/FWHgebcEkjbJy32A3Tr4aeuon1rdHMQ9Tpu+CVQpAZFyHsHceg22w
 3zCNUdqFh/dL5nUUtDPpZyfSLOMB20ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62717093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8eXTc1PK0jHeMWTtnytvE0pxmTI+OuC7nXFGbsE7LdV7ZVsiqCFPm1JZok9jePiG++Znf17XrsabIhGAJV8sTY9CPwvIYXSB2AjQa33vq/WKWVmudKhZ9U/108qQ5WpUAodLxMb+UCxTJMwGRmeJtPwYVHvlOp1opjJR2OhZ74NQL3Eb6kZid6AgnT20EcNC7HoV87DazWYeTCB/ATk4HYvJYmDMX/diEcBfj8iINI1VDw23U84g9BTe/eRVv8QAVhiCHxfRYDrvgrwZ+So6W5ddDS/1CVwxF4AdUQXQFja1i9vGsKXuiNltNtr/TLoAh0ol+oEwzrryu/eSOzG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVUUpETo8tBhrRG7mP8uRuKx+shqlWjcNlIhA6wzNMw=;
 b=l0h95jcR7ithh8p+9RstWRg5Zgntvk431krhdR+0qx49l0uKW7t0uUksIHRsUUrCiqNCGhGT9PwqDIXj/Dt0h08zQ6/PUQfwi+i8cI0cBl6J7NbQNJbG/SCKZ0+SfIj72HTp+IhCtMK4+oyjp4NZFZHaXJ7mHbK41J1XsMbLfvnzpEb4j+ZZtn/IyE8DejnLCjkuI1IC+nG17MpMH5AcC/ex2k1ek5qEN7iDISeuDvnhirog1FOfMmdy1qCqWIDCqDEehRj7JVX0IZucv+bo+kzcj4GMJpYJcROhZ/XliBoCcQrQ6RHUZjvDPqh1SED+0Dqqwy3CrzSgegHfdfAktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVUUpETo8tBhrRG7mP8uRuKx+shqlWjcNlIhA6wzNMw=;
 b=Sfln5mn8KpQmPMXOgyoDfMxwQo0c+IhTGxKLs/8EOy7hqDWcmkwTcKNwMudUynil+Hu+c/31WpJ/uYZZtQonsDhCEVjICZyZQrC0kxDWcaxGxj19OoUV/eca0ZkEOfv2L5tIu3d/noXtWyiBMV72jrKYE0aUp1ACHf18Sa5j3Cc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v7 08/11] libs/guest: apply a featureset into a cpu policy
Date: Tue, 25 Jan 2022 15:49:32 +0100
Message-ID: <20220125144935.44394-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d9b4afd-a8e6-44f3-d5c8-08d9e01204fc
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB45688DA1FAB61B83C0492A7A8F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdd9GaC7W7k2D255AWG3S7Xc/rpsDTwp7NLJfwXLYf3YqWh4Yhaeji1OM9JXnEleBFr8Yj9d/6VlJS6WWIZeUUCW3livnuAunpOy1AhA8y+S9ls8pJTWFnYGCmRUIiTQO0v0xsrLGqe8WPfTP/I99bOtOa/W6Pha038mDPId6/A7n5goZVaOWn0RxU0PvEAcjgARspJ6wRKRDJSI6vXz9khy869VydPuce+tewC9XD1AcHaU7lhnenBtLhZ2efk6lYM9Vkn+GUDoVbfV/06TFHbejrNUYY5VNQYg9p/34Kq9HDMhRAJ6EtIL2UtvBLPSbM1jSy0ZeaW+0V4TlJeCbQtLzbpDGBUYVWQD0Ajcuc4kdjyvddKQQ6FlNLTI3HW5sAzwOZCfWE1IzbDYovCiEttOB8k4mhn/EYlStBnXyaMnR91+HyTCO109ipphUg59QQ4vNw2Qdp40taqq4+8eRmC4cqPeUwAaYQOR15mJCRsOTLVhutOiTfgqYQ/VNWufly91gADeYtqgk1fhSoIV6mjGDr7oDvBgsInJDGsdXQZLc+dv5634R69QxImUey+9NkqqOffkOYioE1nk90RPJYnOpN8KDOD/wHQA1ROKvlUkEVBtDj/i42BMNepItp0QjNQDDhHMhD2H08tLe/PVwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBoa1RZTjNjUWJyTmdZaHJnM3N1aVhrUTJKSElDbGVZZTNyand4R3I0L2Z6?=
 =?utf-8?B?Q0xWTHBObXlhSlBOejRLakR2Q0tqajdTb2JXOVcrTG54SG9zUkxRSFkwR0xC?=
 =?utf-8?B?RFROQUN5cVhkOEpsbVVuZDFobDFTa1l1aHY3R00vL2J1RXZJdWc5cUg0cDQ2?=
 =?utf-8?B?bW9kMExzTVl0SW9FWTQ1aGYwVnpERC84TGJZOFhZZFFUUjFsS2N2dS9BN05a?=
 =?utf-8?B?RUZZYkIxRTdMdWRtYU5lS3VXb2lGT2VTakRlOS9rWEZ0MWorZ3FVZER2NXFy?=
 =?utf-8?B?UlJZWW50K2lFY2tJeG0xZUw4MzcyaUxOUE5MSDdCdVl3L3BUbWErMVZhMXRW?=
 =?utf-8?B?bHF3Y1lJYlpMU0xXRngxS2hneVgrcFREVFllZWVYWk5VUzFtMVBwd1pCYzd6?=
 =?utf-8?B?QmVJN2JaNm9pSHdNSldwSk1JNzlFM0tSL2VsMlFCVGl6L1NzcEFqM0l4M1R2?=
 =?utf-8?B?eEUvWW5kOEY3bDlGeXltbEs4Mk8yK3Z5YVlxYks1QUx0U1MzM3lXSlRjZmRu?=
 =?utf-8?B?Q3JPYzNmM0w0MXdsVzJ3Wmo4bWIwKzJ6ZDlBZ0lCcFp2YTFYYkdSRVNxV01u?=
 =?utf-8?B?RXlZcVl6YkxidzdpTHU0d21pR1NFNFc2dzJ5YXlQdkh3ei85TXJ4VkFJQXdZ?=
 =?utf-8?B?RHdia3hoTDkrdnpiWnZaZ2hUTnpaeFVYTGprOExBcm9pRXBEbEQ5VzlFK2JH?=
 =?utf-8?B?bWNqWnpKUG96cDZHTFYxOGVPOXlrYTY3ZXEwL2dpUVlOdmZObXZDWlRPWEta?=
 =?utf-8?B?MGt5bDA4UHZDUzFpZHpvKzFDNGh4UnloNHB3R1NHNnZmN1V6SGptK3k4d05U?=
 =?utf-8?B?eTR4cHhMWUdZL0dIeHV0dGQvb1dBSTJPSnBhZVpuVXh6U0dlcGZsUUZXbkk2?=
 =?utf-8?B?K0lmUDJtakRUSzNBWTFWNzhzUWNTaEx0RUYzSjA4NU52L0o4RDNnbXdrU0w1?=
 =?utf-8?B?R3pJdXpaRHZSVk5pd2Mrc2F2aUhEdE8xZWZaQ3BHNHVvTWVjZUwyQkNRTHFw?=
 =?utf-8?B?OTZDL0toZC9ibGJpRDF1VU5tSGxZd0FLbWV6VVlwYnRLZWdtcjFoSi9EMnN1?=
 =?utf-8?B?ZnZCR2NFNytRanRmRDBBaGZhS2RHTkY2aWRnSDdnbXlhRVBCUDNtTCtQdDhi?=
 =?utf-8?B?Y3FjK1VTNk1GVHlqVlVVNXh2TUN5ZlJ2TUVGZFNyTDVQTWcvVXhndTY5Ykdy?=
 =?utf-8?B?N0dEeG5NVHZXL1hhMk81NFpuRXFkb0diRG5HVldQcHRYVlhjWDdyZVZRVnVv?=
 =?utf-8?B?YzN5ZjVwalBLVklZNCtPR2ZlMGU1R1Y5amNoZzNEZ2RzdmxMaVhrb3BzU3VL?=
 =?utf-8?B?MTBGekhtY09idVZzWnV4ZnBvSG5qTXM3VCtYSEwwMTJ2QjJ1ZEttbS8xTXM0?=
 =?utf-8?B?RGUyWkExbGduTkpQOHhaSmJQUkNwWUg0NGNSR3VMeE03ekxyVVFqRnp4alMw?=
 =?utf-8?B?MERZNEJhVU5YOXYyM2hFL2ladG4vYWppREpJRDAwWDVTK2VoVU9ienFwWmpT?=
 =?utf-8?B?eElCaVR5ZlVQb0s3L1FWWmh0R21DOEE0dlNTMzFCekpiMngySzVubVhKRHN5?=
 =?utf-8?B?bGxYRkpONGZtUlUvNzJ4U09hb0FCV0xqUThLR3FhN2QxN2ZudnNkV2UxTjBB?=
 =?utf-8?B?Qk4xZHlZZS9iUWpTbVBXem5lcUFNMWZJUHhUeXNwNStpanV4bnkvSUFucEpy?=
 =?utf-8?B?T01YL3lFVkM4aTJwVGZFRkhSQVhmUDgzR2pMbmMxMkFOOE1NMkJPRjY0VXpW?=
 =?utf-8?B?M0ZnYmpxakR4RFh5bDNxeEJONDNTV0hVb21kTTFrWTV2a1YxTTdrSTNqcmZi?=
 =?utf-8?B?U0R1YVZsaEFtNThjdjlraElYZ2RrRGo0eHN1aTZibzEwY0ZkVUs1QTJ3Si9K?=
 =?utf-8?B?em8vdlkwTEd2UHU5eFY0UGxIVE5vNU44RmJmQnNLd0hQSjA3SEdGSDNxL0xY?=
 =?utf-8?B?WE9GRmFQMGtjRTkvUnJWeU1VRmJ2aVpSWExjZlhyeU40QU1WVFQ0VUtnT01M?=
 =?utf-8?B?dXVBZHJETk9IUG1KMkZpUG80WWdHOWd0MFhaQ043OVJVNWhabVF4bVZFOGE5?=
 =?utf-8?B?TUdsd3JaSGRhUUIxRW1HVm9nd1owbE45a05xRXc3amFDR2xFdHI1TFJCa3Nq?=
 =?utf-8?B?cWNGckFyZXBIcjJmUEE3d2VueENOelN4Ui9zdmszcWJXRXh5R09reGNzS1Vr?=
 =?utf-8?Q?6Xbr7Y/QTAsd1NH0g5g7nUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9b4afd-a8e6-44f3-d5c8-08d9e01204fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:24.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jhhi2Qu+SD1l0nW+nxvUsBD09QWvOZXJ/wiC2DJwvsN160mO2CZrkv1ZM4Z4CBkHOdJoXATyjFPRaV2dCXQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 tools/include/xenguest.h        |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 98a998f11d..d3dc8719c6 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -835,6 +835,11 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xc_cpu_policy_t *host,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 3503f21793..a2e2f7c850 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -445,46 +445,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -881,3 +850,53 @@ void xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
         }
     }
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.34.1


