Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9B4556F9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227175.392828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncmN-0000xS-55; Thu, 18 Nov 2021 08:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227175.392828; Thu, 18 Nov 2021 08:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncmN-0000vg-1x; Thu, 18 Nov 2021 08:28:23 +0000
Received: by outflank-mailman (input) for mailman id 227175;
 Thu, 18 Nov 2021 08:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mncmL-0000va-83
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:28:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae09631-4849-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 09:28:19 +0100 (CET)
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
X-Inumbo-ID: 7ae09631-4849-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637224099;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AqjN0EaMxlB4fMwGU+2y80IO2OZOEXGU0gV7jqUmP5M=;
  b=gQ1R2+1eFiJfY9CrzkbX5Qq38ny+PITa7F3SiVLEkG3xa3Dh7rIF3K3X
   NVimfgt7nh3YLdg4gY6eq6OPH+xxLq7NtXy6P/XrhM+20HpPqd+P+Sb4j
   3LlZBp5itP+c2najrDVWGd/9F8HtQvrOD0hiaH1sVu23HBZ/VTE+BZwDT
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KwRLzz7fyEzqornLgetH9Q+NvIYLi0hbFwU1G41ue/BcYgi7Xtd9cGDvyGPvjYGFos4VtaXkKc
 8z0aYINN8Ch2+4qhdUd++OgdJf3EcXEcEnEsuvQWnTGc7nI7chT/7myMNxm+NPyygEk2fdmu+f
 MO0CSVFwOjR7xHidfaTJzS5NT4ufHJLmuBdPPQJfy7HopmKZWL9G0GhC9SmtsIfMtXJRJ2LkNs
 VJZAq6xJsHQX23jbIjrU09AdmeAQRS9XUKSUsrh+GQBe0FjllSpB/0bMx58ymIcTCR1vTiHGnu
 OBRiVT6OTmeKY2ZEh08KhaFc
X-SBRS: 5.1
X-MesageID: 60089337
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HtaJyqI88ayM06inFE+RNpIlxSXFcZb7ZxGr2PjKsXjdYENShDwBz
 mEWWTqGbKyCNGT3Lop0a4i1ox5Q7JPRzIRrS1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2EsNdd1
 ucdsaWzF1d0P6btvNQeeB5HRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvYcIjWxr2aiiG97sT
 ZQfdwJpdC7gPUdNMxAUIpA1p+qB0yyXnzpw9wvO+PtfD3Lo5A1u0pD9PdzNYNuISM5J2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0VvVXP/MIuAW0yfSEvgeSJ0w0TRVGd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 iRsdy+2tr5mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lex42bptYKWK5O
 ic/XD+9ArcJYBNGioctPeqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:HtqupqmuKeMeRylBaz4x5y/oRfjpDfPCimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlgd6VbI/lvgtQpGpRGsZdBmlCe2Om+hocfng6OXN1Lu
 vV2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnT4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUrZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpwoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEM86JX/r1bop46zuNMd3Bz3Z
 WwDk1ZrsA+ciYoV9MPOA54e7rONoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.87,243,1631592000"; 
   d="scan'208";a="60089337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ9DEGfjAiUMnAUwZP1pcwKCggI+3d0WuFYKNN5QcEow5Tck3RKWZwCk2C9PVIAIqh7/wL/jEn0QZgjPo6JQdxD3ZMz426LBYD6eZ+353MH9cJGgp2YI5rdJhWd+VWc66G0oev/9fNUuWSA8dZLsQfcRnpCNzse2DkQfw06Qa0KpKl83iLoWcaqGjFN/IAKjdSuwUDuKKyi1a1VQyK70CrtwfVKqxAsHB4OY2ovNb9Vxo6aBeCZRQ0bEP73Z3O/Y99MC4VX8CrS2cgChVdNgoFFyuJfkPwx6eNTnvf2mGqanVB30A4zqLHAC1cGp/BUFo7GPSrqelxFuMdm6hz29/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iI4sG5ccFDAseKHYLIAbbrV1FZm8Jj/ahp9xsvOjKA=;
 b=FfaHf26vRCWOGaE/p20/C4Dyazje2sUbh0e7+U4psu2rqx/Q8d9ZncLSWL30eis5QjjmpBarpRMvrPLAJTFy6HAICUKFOLXrmiS8bo9OLPKgSDimBa12u9Uf1aUglh/xHXm3HD7A3t7EHVzOb1RpG0ZQ4oMTYhXalfJvohq0FJQzYbqpDoI+EtZZUZ/gmEQDprY7+yo/Q9sl4B9mzVZCYBuGWUjNx+rlKd1gW/ftGxk5belM4hLUYgqOPMI1kLcqioYJADqVq1ocJ5NjA7VZrXKpD7bPeUFJDdnG29Hd/rlH5MPGmKZAsp4dJN/M8g0Y2Kzvf2o+9zSLOrniFwJdtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iI4sG5ccFDAseKHYLIAbbrV1FZm8Jj/ahp9xsvOjKA=;
 b=d/lxnz751aCPKRTaqYRqcJo3oDzqmp+rCxql52cUmfFBVcGAzbomlyxGhhu+qNlz5sAvNtKWCOWfIc3QuwjMZYD9WTfhNqqJkOEVIwnpm9Dm62j99A7xD2FvNQAowpTLIaiYWKnhLDcehOM/m4++p9fzGiKhd7RaQZfKpvlI+ZA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16 v2] efi: fix alignment of function parameters in compat mode
Date: Thu, 18 Nov 2021 09:28:06 +0100
Message-ID: <20211118082806.23335-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66dba142-702b-4046-9c6a-08d9aa6d5c25
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-Microsoft-Antispam-PRVS: <DM6PR03MB43968440FE3F705B55A900F08F9B9@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9jiONIgMjVpDiNBi0q6qdX363TuVGn7XkMlBDO0jC3eIi+m96T/+Lkyxt5yuizFeKTCdJ6kjWSi76zZHzuof1t/x9E1ZN/xewqQfjzAbk9v41fcCM1I9GqqAclgNzymh9a3sMsBo3A+v3AKs6GGc3k6ZDnVSRGVFvdPc+ktLZYO3L+vUCXSgsfy/H43NWUrsYVf8VpXAFIUnlXR/FFpkF7auKbMDbRmQoVlIPB/NRaCXIYtnx1xtE3uKOuunakKi/rdORBwERfFcirc+WpBtpzyCLD/XncpjtRJc2qkpkOQR3MvrCWXSCMHlEDuMWu3fblEpHoLIdwrxcWf/Ebj7Pt1Ia9ycr0diz2RDAl60WPtCIDZzgUOW7OmuscpbodVADMcPXYe5RgoBLw3jVeDXbo2R0TFacxpySQ4LkcUxtEQm+ll+faO20fWSZMoSFFP+r90nw/u/9DdlKTqlBUAUfQ47Z6dkcwErAwhC8oUn6Ega63vt5QhE7S1uorGgaX+CHyI6c6E7FwshPKIjaIg+x6cRS1ZUV2ZTQOXwVpdVQKtMThsF/iBX04uTnE7dDpwoogIzJJ0xKLMNWHynvTh7rzJTD+WkIl9T3s35aCX3oJTsMBdyKogZFVGgn5l71h/O/rDyvBo3piNcPpAEqOvwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(4326008)(83380400001)(6666004)(2906002)(1076003)(86362001)(26005)(36756003)(8936002)(6496006)(186003)(38100700002)(6916009)(6486002)(316002)(66946007)(82960400001)(66476007)(66556008)(508600001)(5660300002)(2616005)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZRbkh2aTJvQ3ZUYWYxamgraVZHRHp0a3NTYTczWUNUaVJXbFhVN0hGUnpx?=
 =?utf-8?B?akZ4OXg1d1lveGdFMTZIb3lFZWhEUlo4S2JRSzh6ek1vSkhTN0RGMVJsR0pL?=
 =?utf-8?B?ZkZhOVQ1SjJ5TVZBQm1PZmFGWUxwVDIzSXJKSDN2ZGNzekRaZjFXSnZSTWR5?=
 =?utf-8?B?bzh5UTR3ZG1IMHI1OHl0NG1OLzJFNjRIWUFXQ2NZaUxiNm13ckJQalh0ckwx?=
 =?utf-8?B?MUVqZDRlbFZDQjNoWUEzeEtIOEd3dzZUWER4UEpoRnBIWWpXNThmYlRVY3hY?=
 =?utf-8?B?UE1pdmpSN1lHMEdiV2sva1RSL0lkTkdpcG10Y3hnOXYyTEh5VUJzQmw5azhI?=
 =?utf-8?B?dlFzMWxkNVQzZ2NmSXdtS3JoRTVZbzFNWUx4TU93TmNKTG9HdkhqQ1RlVzM1?=
 =?utf-8?B?YmU2Ly9Vekp2eEN6bkpTaURwdW50VHdTWU1HUmZiVG5IMGpnckZOWWUyOEhi?=
 =?utf-8?B?K2dTV2JaS2lsWVluMGY4NmNjaDNKdkZQcVZmanIyb1E3VldBOFIwN1ovRjZ3?=
 =?utf-8?B?WUtjVW9Tb0tCeW5ENFc1eGJ4MUJiZFkyZHN3elBGdzRSRHBmeFR3SUlPMW11?=
 =?utf-8?B?TG1hanJ4OEVCL0JTbnpnNkdIWHRPWEQyVmpSSFdrRkttbTh0eUkyNUg2bDFX?=
 =?utf-8?B?T2ZJSEVwMGVTNTYwTmhpQ3FJUE5xUHdaNVRVSUVvMG9nc2NoVjVidEt4SS9S?=
 =?utf-8?B?RVM0bDh5ek9pN3BuY1BPdmo0RGFCbXhOeFdUOUxtVlhHdTBiSTJWcjQ3SzBi?=
 =?utf-8?B?cU5xMHl2MUxMUFNPZDQzcTVIYXlTVWFrWVlLb0RVTlNQMXZBQTcwMUtMdzRF?=
 =?utf-8?B?dVd2RVZKUkd6QkMxZk14M1RxcExjcUdjbVdPcG9uMjNEcDhNRWhJUlU4TDRE?=
 =?utf-8?B?Zmw1M21tK3ZKTlMyRUt5YStZUUl0Wndyb1paQllOTFpZZEpaZG5hRURZRDRW?=
 =?utf-8?B?eWYzcVpmT2Z1KzZSVHNhSW1kSmN4SDFkdERxbUVOVFFoTXJYYkhrY1o5R3ZJ?=
 =?utf-8?B?aGJYVXB3K1h0aTdFTXNrckRmMHFJS0xsWG5rd1JudzdCRGdWUjIwQXkxVjBi?=
 =?utf-8?B?UXRJT1Jidm1CdHBhWjNQUnFPOGRQNm42ZCtJVGJaRTBPcEdjMHpMWFpFOUFi?=
 =?utf-8?B?SndrbSs2cTNLNlc4R2Z1TUQ1MExOVnkwdEM3S3NhSWlWS3phOW9wa0dCSlp2?=
 =?utf-8?B?Si9UZzVLRWtCN1hMNG5wd0pJejlYNDVUSnBQYjdwdkFhYldPVElyTXU0VnF3?=
 =?utf-8?B?MXB6YTZXQ2lnTlltWDV6bmx2L1dKenJJZk1QUjBWWE91ck16K0RXNy9xOFJG?=
 =?utf-8?B?dDFsMkhucEUxT0VsQTFNakROVDBHTDhaS2VoQ0pZWFcrYURqbXJUbXBEUXhY?=
 =?utf-8?B?U1A0Sml5czh4dUI0UnVqUmRSN1BsQ1V6dlVURHZPNDBkVEZFb00xTmJESkN6?=
 =?utf-8?B?Sm4vazF0ZWRNQ0F2SnQxOTRoOGZFYlgrcVBycmxnQzNHR0M4YnJnRmNlb3Zu?=
 =?utf-8?B?ZDRRT2ZtME05WGlvUTBsZXdSUFhic3dWTFZJYWY1NUplNlVjeXREcm1kVVNI?=
 =?utf-8?B?WmlIMVJnekJZV3puODJ3T25ucUdOYldvTXN6VkdFOWoyTzNqbStWd0h2ZDlW?=
 =?utf-8?B?ZTF3VURoN3RNcVduMU1OZWJDYmhyMklyZXI0SXN6UHFCdGNZSXRsU0UrZDkx?=
 =?utf-8?B?REIrVEdjcDFGeE5WbW51Y2EvbjdtTjdZNzVDbXY5SlU1Rk1kRVN0VVVxMHcx?=
 =?utf-8?B?aGpjYnlXaFV6TndZV3lnbklBc2g1Ym5vdVRURjk1MWkzOExVRmhsV01EbmVU?=
 =?utf-8?B?OGZ1LzVxeFhmai9KZWRWMWRPaE9qQ2ErOWZlakFJQlM1L2UyYVhhcEhHY2cw?=
 =?utf-8?B?REwweGFUd1liZEYwUXM3Qnd0TXAyWEQzYmFqVCtla0hUcTB0T0o0SWY2ditF?=
 =?utf-8?B?cEdyOXlZenc5QjMyclVXZUV6RWtyZlZXQVcxSEU4eUtWSmhuZ1ZZVWpxRVR3?=
 =?utf-8?B?T0lIdDhwR2pVbURCenpaUUROTGZjNWcyTzBsTHgxbEFnRHhnN1dLZVk5THhy?=
 =?utf-8?B?djhCVUxBTFJVcUpFWS83MXVmSnh3Z1Q4MlZHWW4yK294RDJUd29aeFI0Nzhy?=
 =?utf-8?B?eXlaVTJ5QVEzSlZYN2FFNmNiZ2dqbW9mU0ZDZHNTU2VqT0VOM09xZEVadTc2?=
 =?utf-8?Q?5KatdNuTi/XSKshVx0275E4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66dba142-702b-4046-9c6a-08d9aa6d5c25
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:28:12.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQ4clU7zljViU11rfnkUHmMhvilabj8qpU31opCmsVT/k8GNvT8XEHlB826hFrWSTUiw7sgbsyWi696MapGatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

Currently the max_store_size, remain_store_size and max_size in
compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
13.0.0 complain with:

In file included from compat.c:30:
./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_store_size,
            ^
./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.remain_store_size,
            ^
./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_size);
            ^
Fix this by bouncing the variables on the stack in order for them to
be 8 byte aligned.

Note this could be done in a more selective manner to only apply to
compat code calls, but given the overhead of making an EFI call doing
an extra copy of 3 variables doesn't seem to warrant the special
casing.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Changes since v1:
 - Copy back the results.
---
Cc: Ian Jackson <iwj@xenproject.org>

Tagged for possible inclusion into the release, as it's a likely
candidate for backport. It shouldn't introduce any functional change
from a caller PoV. I think the risk is getting the patch wrong and not
passing the right parameters, or broken EFI implementations corrupting
data on our stack instead of doing it in xenpf_efi_runtime_call.
---
 xen/common/efi/runtime.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e..f1cbf3088c 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
     break;
 
     case XEN_EFI_query_variable_info:
+    {
+        uint64_t max_store_size, remain_store_size, max_size;
+
         if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
             return -EINVAL;
 
@@ -638,16 +641,34 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
             return -EOPNOTSUPP;
+
+        /*
+         * Bounce the variables onto the stack to make them 8 byte aligned when
+         * called from the compat handler, as their placement in
+         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
+         * clang will complain.
+         *
+         * Note we do this regardless of whether called from the compat handler
+         * or not, as it's not worth the extra logic to differentiate.
+         */
+        max_store_size = op->u.query_variable_info.max_store_size;
+        remain_store_size = op->u.query_variable_info.remain_store_size;
+        max_size = op->u.query_variable_info.max_size;
+
         state = efi_rs_enter();
         if ( !state.cr3 )
             return -EOPNOTSUPP;
         status = efi_rs->QueryVariableInfo(
-            op->u.query_variable_info.attr,
-            &op->u.query_variable_info.max_store_size,
-            &op->u.query_variable_info.remain_store_size,
-            &op->u.query_variable_info.max_size);
+            op->u.query_variable_info.attr, &max_store_size, &remain_store_size,
+            &max_size);
         efi_rs_leave(&state);
+
+        op->u.query_variable_info.max_store_size = max_store_size;
+        op->u.query_variable_info.remain_store_size = remain_store_size;
+        op->u.query_variable_info.max_size = max_size;
+
         break;
+    }
 
     case XEN_EFI_query_capsule_capabilities:
     case XEN_EFI_update_capsule:
-- 
2.33.0


