Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90F44AF84
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223955.386943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSAT-0003Gc-6D; Tue, 09 Nov 2021 14:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223955.386943; Tue, 09 Nov 2021 14:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSAT-0003Dm-1U; Tue, 09 Nov 2021 14:32:09 +0000
Received: by outflank-mailman (input) for mailman id 223955;
 Tue, 09 Nov 2021 14:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azzv=P4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkSAR-0003DQ-Cy
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:32:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cead20a5-4169-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 15:32:05 +0100 (CET)
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
X-Inumbo-ID: cead20a5-4169-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636468325;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3/x9jDsJ9aNuoTpX59EgydBmzEdAnL5c5kP746/OQsg=;
  b=CQhXKRiBrbLEQbIzyeBCpdNxEa1zz+H0rnALC7g2PK8mWlyLLigA29SE
   R0AiT5/tatSiFuI+G3kPbxu1e4mb9GPsF+tx0OVs+IT2MkAV6Z0InQZUu
   riqmsW1AoGnvvBVgOoiY6CkeZlgxTxBApYnSffwzI+VB0SU4LDMF+g8uC
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JS9+DaHULhsHjXnbk0Y3liHO66afTLAPjsFFALDbRKlWEn3nWyTYyup2exOIkeAfgYJ8q7h63k
 viwTPz2kh4rc5X/vGWh01QK4ZpwZfMgCWZIby5Cc20KkKgwG4f4mdj1suRNTRL+/PbdSLnsZff
 xFyfZhq/wh3weDAMVWLNz1v7KoGyYDy+IfYvEtPbiXaLJZ2sf9moNW1YoBrUKEVT3uH6SL7Jwc
 KSKGd1ZWDENQvvOgVDQAv87OIsZso+ucZ+PEtAwIbsnNlMm7hRM902exAjNSLrVhHC3z/omC4C
 ncc7bSCfi3eDoJSD6wvIv0Up
X-SBRS: 5.1
X-MesageID: 57432443
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zpJOo69snhBnROitvnyTDrUDwniTJUtcMsCJ2f8bNWPcYEJGY0x3y
 DEcWGvUPKqLYGrzKYx0YIri9kkBvJSHz9NqHQJkryE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhg2
 chTvseLETsQZKnPif0ZbAdfAQdhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFg2tr3JwSRp4yY
 eJDMzVNZUn5SCRVI3kdWahnmea2jVbWJmgwRFW9+vNsvjm7IBZK+LjqNtXEat2DbcxQl1Sfo
 CTN+GGRKg4eHMySz3yC6H3Eru7QnwvrVYQKDrq6+/V2xlqJyQQ7CQYfVFi6p7y1j0+iQcN3O
 kUS9ic+67IvnGSpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMH/t3irYcbnh/JCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vkiOxuJOSdVYJ31/TXXO86jxnY5yDeNn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdkIuGkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmPscZmOyvpngGiausM4bFyhVEfUYXY
 8bzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDOF+xUbgrVNb5jtctoRTk5F
 f4FaqNmLD0FAYXDjtT/q9ZPfTjm01BiXfgaVPC7hsbce1E7SQnN+tfawK87epwNokimvrygw
 51JYWcBkACXrSSecW2iMyk/AJuyDccXhS9qZkQEYAf3s0XPlK7ytc/zgbNsJuJ5nAGipNYpJ
 8Q4lzKoXq4SF2+ZomtFNvEQbuVKLXyWuO5HBAL8CBAXdJ98XQ3ZvNjiewrk7i4VCSSr88A5p
 tWdOsnzG8trq91KAJmEZfSx4Um2uHRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKxQ4Ys4d1H7tx47g54t/j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQdIdgQ/b+mF2fUFoRXo7Kw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgqu81IAILvjQZ3mFhObYaFV33z6ZCLLd5NLlMrM
 nmfg6+b3+ZQwU/LcnwSE3nR3LUC2cRS6U4SlFJSdU6Untflh+Ms2EwD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0ef2D8joAaBKvhIxw99Wt3CGkx3E=
IronPort-HdrOrdr: A9a23:g/qQ3a/Girp7L8ha2rFuk+E2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhORICOgqTMyftWzd1ldAQ7sSi7cKrweQeREWldQtqp
 uIEZIOceEYZGIS5a2RgHjaYqgdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngPObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lj1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESmti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1ifF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAy7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1SwKpsKuZAIMvG0vFmLA
 E3Z/usp8q+MGnqIkwxh1MfjuBFBR8Ib1W7qktrgL3g79EZpgE986Ii/r1uop43zuNJd3B13Z
 W0Dk1WrsA8ciZvV9MEOA4ge7rANoWfe2OEDIqtSW6XZp3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.87,220,1631592000"; 
   d="scan'208";a="57432443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFg/H4YTR7UarFJxBylOyT6Z7tdcKLnE8QhP41Vei9IQCHKU2BmfRzT6EC86XgpuDUFidNusGhFcIVzr4NI9JJNG/glBiC1sXh7thZQsTNX2jhjjFTpr2cB66N1B925gMTI+N4Vxa06v4sEk/7PfoojcmKSVVAQQo/Gk8yPcp3Q7pVSWcJUFaVs9a8wXwQZw400+Vf5GUl/mlPca7y/O6AJHq5qEZa0ZvRjCwSUTXbK4s/lMb/KW4THbUm9l/jgOVQr6jsMiIpKXENpEeEesVetyxsJ8VGmMUZDseehssMJcV89y/64ddaxXEziPLr9Sb2D1+wNAwTKMV1NWCKFPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfC9vjk9K/lIHQ9hlUGd7z2iP1+Aa/BXgsV9obQgD7M=;
 b=ZHeD53GonWRHrs2+grgEh5CeDlAf7cz97KQMaYsUhjFS0s9jzVstoWQySVoW1Aaa8GWNvV72WdXyrRRL9mzSWfDT39AkkUog4xmOYJGwv2dNxlMJ9jupmTwAF/hNYpGAGRemyN+tHd9x8t5fgZfC1fnqYGTmAEPpE1lX+caJxHY3SHN0N3arGu6AfD/shlyTl5xHQETQxS86Z+eSHQQz7OuE7YtM0RfRkIPtx2z2HNz8W8CJFmgQ4BjOsR/pmFWfzFvC99voSzWs0r2CzZvxjV4E9wsONYkit662ybV5HOCyzDQDfyjT1Cknn60U1yhlwBpVyw+6kggBRLp7bUCHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfC9vjk9K/lIHQ9hlUGd7z2iP1+Aa/BXgsV9obQgD7M=;
 b=PzeCsvgkxIDQ1L97ZHYq3CLW5w/QBaT3oMauL7aRSCDr4sgF9Evq0KQwFzDeV1+HqQu8yuI8W/g0EaxHVRqtTSKxSHYqNhYtBV93w/ZxtbV60gTdiJ9RAqwyepX1R0fBJk1U8stUdg0k5Lg7694N1csPFLmrchsI2JJbQMX1kKQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Hongyan Xia
	<hongyxia@amazon.com>, Dmitry Isaikin <isaikin-dmitry@yandex.ru>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16] Revert "domctl: improve locking during domain destruction"
Date: Tue,  9 Nov 2021 15:31:28 +0100
Message-ID: <20211109143128.56089-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f50f60-6115-4a75-2a4b-08d9a38daa13
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-Microsoft-Antispam-PRVS: <DM5PR03MB306812CAB684826D05F5BDDC8F929@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgONOUGFnyZtj3rW7vAjpBvZCqa2UEy2Yg3OOlprfQydHyGBLPpea4ID//FwavumPvtt1YwOWQlAuq2qLWIqyKDRUqh9+daICLjKkWuJtZ9MNNmPiD1KnAy6kRAO+HfurSA22oPA8mXIbrDN2hFnJTyfuN4YwgjnbIcejC80sRP0jr+pi9jAJFVpFTKrjotXGZqwLPT9XerchFyD8oBVgflrXQZl54d4VlL0Hg3RYez5g/9qevZu4bc0KUKkTLP5kyYbzzOgcilSiCVV4UXY6kouGGLbuHqy3/WKkAPiwVbTR37W/2fc7lsNKvdA2W/+o8opwjqJThNe58t3HsxRbUXwKjaZDm74CAuSADYQUI+8EswRMXwwmkW8JOoFmKGVbxSxy414y2bZhbrisJI42kP288KjfTNBP1TWyQSf4o6ET50w96oOwK/UEkLMuZjO002TIRtplgPqNI+DzKZvYtrAyEbQcVhQdOTvN0behFu8i2pN1GNfSJdmZg0KNJRTRETrImmlxFj+RAmMJtuG55XPjiqRKnGT7PVm2xInIiEJ3pHsGCBxDOPjXMY1NubXMzYnmm8xOvXrfoUKS4IYA9KHjGbXTprD2sr3i1FjPQ2wbg3uOnMFiFZkTaTC1Y7t1Z2xdt7ODcQkoW+JjoN1KF+Y9mhqXE1eJuiYEXX0vmhEb2IJ5aYevhs2071v7oEeNdgFodFEFpiHuUTiVi66Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(36756003)(66946007)(4326008)(82960400001)(26005)(1076003)(8676002)(38100700002)(8936002)(316002)(6496006)(83380400001)(86362001)(6666004)(66556008)(6486002)(66476007)(2906002)(54906003)(5660300002)(6916009)(2616005)(508600001)(956004)(23180200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlNem4xSFNvZGJwdkJUZ0N3L216b05OY25FdVdTdGVUM1lycWwzanpndWtF?=
 =?utf-8?B?N0NFT1hnYWR1bEo3YkRObUVRWlB1aWt6bGlqYk9DczYrbjRKZ3pSNHBsQmt1?=
 =?utf-8?B?UmkwUGFTdURDb0hCTlRvTkErOVJNUXgxWjRSWG01REk1NHdZdmd1MkRkZGxQ?=
 =?utf-8?B?VEJUUTY5bndWV0t4TU9JUThEaWtnSUpFa2tiOUxGZGlJbVVHbm1Wa1gzZDdM?=
 =?utf-8?B?UTJaSURrZU5XSGdDRVlmdTVQRmVhNWtkSVpybTZCbmV3cW9jRVNBbktJcG9Y?=
 =?utf-8?B?N081WlFzMWtQSW5xa3JkTXlpam9SdXJ0WTNaVEM1OFNoNVFNVkViWFViWm5M?=
 =?utf-8?B?MDRaWlRhOFpZRjgvbmYwc2x1MEJEM3BJb2g1bkpEaVRpYzBhVU9RN1RyZmR5?=
 =?utf-8?B?RkdrMW4wUk1GZFd5QWF6TGRPQXQ0NHN5VXlMN3FJMW1QTGVRcWljVTFRTk5E?=
 =?utf-8?B?R0NzY0hHOXFqc0s3Z0hQTHk5NkNjdU5kTVFXdWtLQ3lGa1lLNUJURDY0U2Mz?=
 =?utf-8?B?TWZMRC9SR1VNOEZIS0o2NVp0RWtIdXVybkNmZ2ZweHlaWXR1YTZGRlhBOVpX?=
 =?utf-8?B?N1NXNitDemxrbU5MbUpvZGQyMkZDU0ZaZGNBbjJiWWl3UDJTdDZPZXB3MWFy?=
 =?utf-8?B?VWdUOG1oYWJSanBLc1NFS1E5ejAvQmtTY1dFb21hTWMwaVRSNk95VlVpYlJq?=
 =?utf-8?B?aVVjNXpHVndXK0xkS0dlUHp6QUdNaWhaMFNCcXVXenRiekQ2dGQycGJIR0pK?=
 =?utf-8?B?ZGR6M0RONHZkdS9CU0RpRi9nM3pieWsyTmxuVjhjZUZaVUJCQ1QvSEE0Mm4r?=
 =?utf-8?B?VkllYXZTUC9DbkRaRVU4cFhERTFnNXNSVEIrSzFXZmY3Qm9VeDNQcWl6Titi?=
 =?utf-8?B?Z2JQK1dFdkMzMXc5TjRncE9NME8rSFdCb2xHa2pNUk5MUUpwV2ZML1RnTCsy?=
 =?utf-8?B?YldFU0JCRS9GWE1xZ2h4Q0RWMWpSdlBqdEp1eUhwVDF5UDdVdGFnVVV2OVRU?=
 =?utf-8?B?MHVMMEliTlBhRkVjQ0lSSkZSajlKYXh3ejNoNDVncktyTnd3bjdQTHRUZEkz?=
 =?utf-8?B?MlVCOGh0L0w0QnZES0l6NmFOM0ZZS0VCcGN0ajFUR2ZmemF5MTg0TE51aUZL?=
 =?utf-8?B?OEdVUm95WXFCV2pXOVd1REdLbG1USUoyTHlHU0lEcTdaL0lPb0k3S0FMWUts?=
 =?utf-8?B?d3I1b3lrajRUcEtLSUE5ckVyQXJ5dWwrakYyYTNybE04TmRiZ1VDeVNvcmRI?=
 =?utf-8?B?Y2pFd3dJSVdndy9vZzdFaFN3RER0dkZVelBNZ3J4QWlYQklkdTFCbFc4VGp0?=
 =?utf-8?B?RTdnZDl6Y3lDclB0NUc2aVZhNVBsaFAvemh2THdyemc5K3hicThqVUxYTThq?=
 =?utf-8?B?bFNaOGFhbVVWT1I4Zmd4VDF6SHdvbnJlSThaUjNLSmIvS21CMWdUUllCM21I?=
 =?utf-8?B?dk9veXVBUjRQWG9GU3NSaUE2RVR0VWdOYzJVSS92NnVxVTROcUVPMWN6allL?=
 =?utf-8?B?cmFXMWo5VlV1RFVqS2xiUW1aQjhEYU9UdkUyZGRSV25sbTM5dDVUZnVGOW1G?=
 =?utf-8?B?MXNmcW8vK2cxTTdoYmpKSmFZUUo3RHRZeEdvMTloTmQ3SStFempxSWZsbU9m?=
 =?utf-8?B?ZGlDbWczR3cyK1dXampTdmpLalQyYllVZk5zOVZFdXBuOUhZTi9ybWJUVlpa?=
 =?utf-8?B?RXlUbEZTNjFKZ3p5b3BlRzduYkNwRXZuZ1IydmFJS3U0LzBKMG5UTmZUVHhR?=
 =?utf-8?B?TjhoMTJwaGRvbzVxdlBsc213dlJhRHphZ25nNEJtWDE1aDNhT2ZvR0JkNHhT?=
 =?utf-8?B?OUtabVU4QmUwV1plV0o3Zm1hSEVTQlVYV3R6YmxMZHE5YXlkUHhuUlY3TlJv?=
 =?utf-8?B?VG5GY244QVdhWmY0YnBZb0NYVndLRnJDUWxCYmZXbUlCZ1pXanZsTXdoWVdk?=
 =?utf-8?B?OHdQRVEyaVpsbjdNOWhYdVpKdnBEYTZMZGp4dGFWLzVYdGRCYnFuWWs2OUZE?=
 =?utf-8?B?SXBCL3ZZSXErUndEY3hveEloMTFMcEoxTHFxU2gzTFhiL2dHQ3d1QVd2Mzlx?=
 =?utf-8?B?c1R6UDlROUtGQVJkN0ozZTZKT1RBVlJQMElNMlVaLzZPWGsvYnRpS3BVWEk5?=
 =?utf-8?B?M3B3SUI5NytMQmIwa0p2RUM4ZHU0eTFUdzNmOEJLZ0VZTDd5NUkzT2g1ZmZq?=
 =?utf-8?Q?XyMxKIVUvtOLz3Phv2c4d0c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f50f60-6115-4a75-2a4b-08d9a38daa13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:31:48.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6In1TbE3eIfTHbfi4C101j6X+aydf/FNImd17iuGm/742wRmzQhCqBk8h09RFQ20mWomFu8mTDq5ED0slC2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.

Performance analysis has shown that dropping the domctl lock during
domain destruction greatly increases the contention in the heap_lock,
thus making parallel destruction of domains slower.

The following lockperf data shows the difference between the current
code and the reverted one:

lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
lock:  2788704(0.362311723s), block:   222681( 0.091152276s)

Given the current point in the release, revert the commit and
reinstate holding the domctl lock during domain destruction. Further
work should be done in order to re-add more fine grained locking to
the domain destruction path once a proper solution to avoid the
heap_lock contention is found.

Reported-by: Hongyan Xia <hongyxia@amazon.com>
Reported-by: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Since this is a revert and not new code I think the risk is lower.
There's however some risk, as the original commit was from 2017, and
hence the surrounding code has changed a bit. It's also a possibility
that some other parts of the domain destruction code now rely on this
more fine grained locking. Local tests however haven't shown issues.
---
 xen/common/domain.c | 12 ++----------
 xen/common/domctl.c |  5 +----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 56d47dd664..093bb4403f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -917,21 +917,13 @@ int domain_kill(struct domain *d)
     if ( d == current->domain )
         return -EINVAL;
 
-    /* Protected by d->domain_lock. */
+    /* Protected by domctl_lock. */
     switch ( d->is_dying )
     {
     case DOMDYING_alive:
-        domain_unlock(d);
         domain_pause(d);
-        domain_lock(d);
-        /*
-         * With the domain lock dropped, d->is_dying may have changed. Call
-         * ourselves recursively if so, which is safe as then we won't come
-         * back here.
-         */
-        if ( d->is_dying != DOMDYING_alive )
-            return domain_kill(d);
         d->is_dying = DOMDYING_dying;
+        spin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
         domain_set_outstanding_pages(d, 0);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 271862ae58..879a2adcbe 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -497,14 +497,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_destroydomain:
-        domctl_lock_release();
-        domain_lock(d);
         ret = domain_kill(d);
-        domain_unlock(d);
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
-        goto domctl_out_unlock_domonly;
+        break;
 
     case XEN_DOMCTL_setnodeaffinity:
     {
-- 
2.33.0


