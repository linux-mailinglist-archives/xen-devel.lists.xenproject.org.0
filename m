Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45E453398
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226284.390973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmz4H-00040B-Jb; Tue, 16 Nov 2021 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226284.390973; Tue, 16 Nov 2021 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmz4H-0003y7-Gb; Tue, 16 Nov 2021 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 226284;
 Tue, 16 Nov 2021 14:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDL+=QD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmz4F-0003y1-Sd
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:04:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10431f76-46e6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 15:04:09 +0100 (CET)
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
X-Inumbo-ID: 10431f76-46e6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637071449;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=sUFBtkNG0DdW0fFyMdmeF5ormp5B2EtliG0+IlSXaCE=;
  b=atVH2t+xOtCvzC2USlGOzs5rjLoaDR2RoLoWXqpXiSQ7fajBz1gdgXBc
   6c3S2I5/X4K/tI8T0evhSOWrSK98caxZpLmMo1LCku4nOu+PYgcbaKlsz
   mTCJ+7fsQ7EtK0V9itKqtm5rqb8YKKdQom50tJEp5+YtK9h576gYjZZxR
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HxjY3slT/h9msQLQ99j5Bsiobprb8IjFv59Tb4IhVxHIMTbOFG0S7k/lcz73EQhvm2oOiBeXal
 /pPEVkiQ4YzpwgfxgnmRFxmuU7Y7B2zIV0vvlKEFxKFia91fDsZCCjd0XdXjV0doyRanet2dpC
 1lMgryb5BvMoCVLoDFoNmcgMfpAlm3Z4JbeLjXPIQLSDBFc7j6D9+ZDxVfriSXIGMRF5/LodPB
 GXVtJ7yegyPPi1LdKcKeOSo9UnmVsFLctoPMVoGka6U5Tx6AaRTXsaOw3a/Fgd757TVNCSAFb3
 FPsnIgLufA9yiwfQY5zoN6aF
X-SBRS: 5.1
X-MesageID: 57958739
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W1MB96zwU5e/iYlq5UN6t+fDwSrEfRIJ4+MujC+fZmUNrF6WrkUOy
 mJLXG6Hb/6KNjfyfdh1O9nl8kIPvMfRzIdqHAY9pSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrdn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+5d8
 s1Oq529cBpzFanAttoMfgFcOj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIHjWpg2ZsfdRrYT
 5s4VmtwYQ+bWDxwNHcyJ6oujL/5jUCqJlW0r3rK/PFqsgA/1jdZ27/oNcfTe8CbA8BcmE+Xq
 3ju72n/GgsdNtGU1XyC6H3Eru7QnwvrVYQKDrq6+/V2xlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA6YgRZa8InufYrHxcu2
 nG3jv7xARVw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A71JZTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBYy6ByD8hUVPlhcRBhps1XRNlFAN7fblXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusQMZCPzNvYrPtLqYyjP8UQGPY6+PhwzRoAQCqWdiSfdpH0+DaJu9z2FfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5ANK7PYfFM5QDpJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXZE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:Gv0pk6kzDnLzFDGQLD9CIARGpl7pDfPMimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMqftWjdyRGVxeRZjLcKrAeQYhEWmtQtsJ
 uIEJIOduEYb2IK9foSiTPQe71LrajlgcLY9Ns2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qLOMexfwqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.87,239,1631592000"; 
   d="scan'208";a="57958739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF2pbrZwsaqEnG+Kgt74paGS96z35hO5RKEKZiB4JscCGzzKKjonUh62ZUcOV+yMr7uveQcNxy0wEiPRP44AjcSJAtrcwqKgSnXE9OcyAnJqW7dTZs1+YGMyI0Ffyfgaj+31TdSnALzw4SBy27MNdQTK5CHUynSSffGet6JzOzG0L4+IKavagHbyCINl81518fSI/PjyIOuvlto0L8j0WdrZ5dJ5KS2lPtP1zuvzwyOfheLB14u1NvRHydWAjR4ZCDQbrFx9OmQwiqnW30pLq1yKe7UWaXiRl0Z3gl7NDXLnpMHqWSXXikfyI9nnhx2+ILKsM5WRl46pmH6PgRQbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0728ae18qVcn+SOKHa2RdOtsaTnDqwGIcLeYw4Lyic4=;
 b=dDQq7p8y/LWOMTXd+xexDWPtt6tDmCbhrGP9SRTIBcxNI9wwMjSSPpBmyqYozLOTAMwLkPJYd3pDHaj3F48JBAH4zsdn8IaUm0uB5LpbDyGQ0n7SICyz3gTim6G+ZhgwzZTTtvXN2NLbTDApAfy2oMtPIctAXJZ+kbD4rK65YD2DOQAMJy1FOaoqN8M3cl7DjaXi2zarUSWje0KLFID/WkzOIjUCIeSvx5IWx34kyLbZnffvlCA7H4MRHrsEHFwuxyq+R/XzZoQG2zgEAYHONoFhBVVJNFPqjkCFOCtP/fwsGfo0834oj+R2ioUgKnOy59KpQkjRya6tTSpehtNKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0728ae18qVcn+SOKHa2RdOtsaTnDqwGIcLeYw4Lyic4=;
 b=rELunQhCs/d2jCAjUsAZE2iFvcOPRi6CKeiw/G+B63JDC78S7daewSHrbYc5xV93lSwzklb7oycye+71Yj73IAte5tOhip1gkz9gch9VvvH3G0DTQOci9ZeTLqlRGczYRubkocEU5RR5OcrWyHAtRyK/ZaCb9H/rV1mM3k5klcU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.16] CHANGELOG: set Xen 4.15 release date
Date: Tue, 16 Nov 2021 15:03:44 +0100
Message-ID: <20211116140344.10766-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2c4ea8-2955-4f62-d231-08d9a909eef1
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068F1F39AFE614ABD9F15E48F999@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZadQHc8XS55ncwhMlX6nXT74cTf+/W5f8AV0q0/VeTjOhcQCM4r03vzThaGpC9sfIUfQJlsvoKSINUGWJbYQuxClTQ8GocAJsWraECFFACsQb8Sqj1bcenWdxfA5vuleYDg0VpFZCg8Loy15A8qoJJLoZYrB23tjIYw0/ONGu134pGAy+3S4JAYG+OTVbVTnkzkM8Te0d/rniYUujqhQm1QcTRLekJAWgMfP+o8+8fZ4zJeRbaPG7bS6T4S+hRGoDi6Lsdn09Y46I7wj8MNHoo2OF4HDHQLhp2NiU/XRyUIrx5gaA4lukFRHOzXi4NmfdvSeCRrS4e4hXacO3pcjrO9lit2AGZWVnewbTGqdw8u8IrxcgWhx9lDqCcjZ0uZ+v18gKb0JRATxGFcK/bwIOQXlclfiSNigaReNxoewsePxxE+NtIm3YJVDtLdX26sA/Z2Ce5g621gGofbRgojwAMq0Ph6eQoQ0x41DEhHNI7iPM+b9YYZCxJtf+72J08uy+HPlK4GY3tmD8zyOlinhOY4aDGXVoCfIeu2BZsCTBeqM2crKJoKS/FD0ZpVrq/b8d94vXQxYMVdVtu7DClMLFSfpAaBW8pWsDZd+aBBmqaTBfgiYTBNypabMuD5sTUqwqW9z2V44bsXyIUIvnItiS4nWsaIRgWzj8hd0n2chl+8uM0JXcF+ywx+iuX6OJVLFpO4qK7ZIYp2m6AGKTQDGeS5dsi6NakTWCDbQ6F6q93krMYIfIF6Q8Rqp5vpTFpC5vW/eznbshF+MruYoM6gedqKyHqXCDUYUBtnvS/QqC1mC2pDxKaAd/Q6OzuDU8Gcf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6496006)(2906002)(316002)(66946007)(83380400001)(956004)(2616005)(66476007)(66556008)(38100700002)(186003)(8936002)(54906003)(86362001)(6486002)(4326008)(5660300002)(4744005)(26005)(6666004)(36756003)(82960400001)(6916009)(1076003)(8676002)(207903002)(219803003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1RJUElka0hNRHlvTHZycVl4ZXZUN1ErZk1DS1gvZVY0SW00cG1wUkhtTi9m?=
 =?utf-8?B?bHNxVEQybUxBT3BmdXlYbjJRa0EvK0xJTUxPemc1RlhqUkpmSXRlNnBuQWZw?=
 =?utf-8?B?R3RiUVR6YytsVVBXNmZGa2xYNDlCODZYWkdFSFg4RGgyM3IvMDBYcTRTNGNa?=
 =?utf-8?B?d2gxRjFGbTZaZXJ0eXZWK2Q1RllMaTl6bXYvSUpQZktRalYrT3RFRHMwVTRm?=
 =?utf-8?B?RDduaTFDaU5nVnZJM2NVWTlBU3l0bkR1ZG1GdHZIQ2NjS0VpeVRJNHB5WUtV?=
 =?utf-8?B?VjE1NXVEN1MxcG83eU80SHI2TGhPWkJ4c3BlQWR6RXk2WlV2S3hFYUg5Vk4y?=
 =?utf-8?B?UXIxT2JUMit6R2Q3TE1EQkRhM1U1bzJXQ21hZldDT3lMRWFlKzhOUm1KeDUr?=
 =?utf-8?B?TEpoUUpuc05qUmlkN0g2cDJqM2JDZFliUFZxSk5nQmxKUHFMUUx1a2huZGlv?=
 =?utf-8?B?OWIrV3c4OVltRjUwQzk1d0RoaGJGa0k4QUZHbk82dUl4NUpVeDlCWmw5UHVW?=
 =?utf-8?B?bk9UOThsdnovQ3kva3lOeEJ3OGpUditkOEl5ekZOV2NJazZuZmkwM0tsVCtU?=
 =?utf-8?B?enltMkZ1T1F0U042Yk5BaFNwdWMwMUhyNitROGZVOUwwTnpwSkFPUHZFMWlW?=
 =?utf-8?B?UVdBd25yUy8yOEROYjdjTVdxZG1hTlpybjhlRW5xN1VkeHFsYS9uYTZ3WWlB?=
 =?utf-8?B?ek5ZL0gwRXJXN0FvNjhwSHN5RU9rczgwZW43NjUwWDUyUXBqMGhEc1UxU29O?=
 =?utf-8?B?YnA0Q2ZhWndLYll0bHhlZzlmOGg4VHd0MTNSenJBMW9iNmtvd1VmaGJUK3ZN?=
 =?utf-8?B?UTNMeGxzUnEvamEwTGpzdHpsOGVsNTZsUDNJR09ucTRVbEZ0cG1XUFJYQXQ4?=
 =?utf-8?B?WmplblAyRWxJM2ZnQTIrUTdCOWZHejBIU3k5K1AwdnlUcVEwRE52cWNGS1k2?=
 =?utf-8?B?anpoS0ZjMmpVUmE1TURTT3JVMjBXcVRhRFZaYjdVR3U0YWRmdDVzeWNxY3lG?=
 =?utf-8?B?Z1NmTkJDWlgvNjNIRGFtQ3BqQUdEUFhBNjBveHV3SHU3QU5sLyt2NDJZRVRQ?=
 =?utf-8?B?OXZOUUtEOTJrNGZKQ1J5cGZqajk2bFhMVVdzd1dqODNvdCtFM3lGQTlBeVls?=
 =?utf-8?B?OGJHOGxFK0lSb0JwR0NVTzMwWkFsSGFXRWROYXFFWVRjeVFaTXhia21LT3Zp?=
 =?utf-8?B?TnlucVBLWk1SWkpqclpTV0QraDcySEphOXdZSW85ZGYxYmtpY29WYXdsVzhh?=
 =?utf-8?B?M1pOTTVrYzZtWG5xeHlCelRQd3A4a1dWTEJJVDMrWXVaZHFLdW55Z0ZNZVVs?=
 =?utf-8?B?OEhSNEJSaGZLVEw3QTRrMVdwVm1KQnhkWjA0aW44a3dXdWdDbklHRU1LQmRT?=
 =?utf-8?B?TGhzMlMzODFWNERqb3oyUnRIWXhqTGZuNGFVNitRZHR3V0M1Um1CS3F4OWZF?=
 =?utf-8?B?bkpYRG1YazlEKzc3amd0d1YxS2UrdUVoeXBUMnY3bkdHSUhLYTdWMlFOVURz?=
 =?utf-8?B?WEZLdWtsZ0RJTEVJSTM3OUN0emZsNWVLZWRNdmdPaHBOWHdRbTBjTjl1NHFy?=
 =?utf-8?B?YURqMm5kSUg1WmpwM0dYQ1g5S1hvdjlDNC90U0o5VGM0aW5rc3lQWm5zckp6?=
 =?utf-8?B?dEtPR2JhUmtJU0RJalJVQ1NEM28xWGdYaThabTRuaDZmMnlFcW1VZUZBbVlr?=
 =?utf-8?B?MDBJRkd1bURYUzlnY3MrNW1hRU41REszTXV2WCtLM3E2M3lXQVR5MUxWaEFF?=
 =?utf-8?B?TksvajZ6VUI2YnAwMWdzRXN6OUFKNVpNS1hJdkZXa0hzQWd2SzF2R1hHR3pI?=
 =?utf-8?B?eDdyb200QXFjZzlzY0FWNVpRYzNnVzNqNnAwbExnVkMyL29UTXBrcHhBZ2JJ?=
 =?utf-8?B?UFJDR1Rha01FQUFPekxDdTQ2ODMvR1g2WDdsc0FiOFNYeGQrb0QxRW1ENVI2?=
 =?utf-8?B?ZE1lV3YzVHRGRFZVK3lXOWpmRjBWUWZXS2lpaElNWVlKaHBreERJdkcxOVZC?=
 =?utf-8?B?Y1I5YUV2MFBOS1FldXZYcDBPdjdCVTBYRG9lZ3U0eUtiMC9Vc1JwRm43RGZY?=
 =?utf-8?B?aFBRempscTFpd0JDUy8zc1ZUcnpTUFFuZFVKV2k1ZkJEQ08yYlFYWEJnSjc1?=
 =?utf-8?B?ZHRzWndTWjBaMXZvckRSanJ3dVJKYU5QZWJGWkFxYWRGKy93b0xVOVNsTmVV?=
 =?utf-8?Q?1YYKY0jrQREdasj6U2do6V8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2c4ea8-2955-4f62-d231-08d9a909eef1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:03:57.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd8XJFH68i3QMlcAVlQMCT39q56Oas/hF0zWwYgY4+M9e0hOufQy3OUJNME2K3kqO0YfnaHPpi6V//esmx2P0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index e5ab49e779..7f3114a96c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
 
-## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
+## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2020-04-08
 
 ### Added / support upgraded
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
-- 
2.33.0


