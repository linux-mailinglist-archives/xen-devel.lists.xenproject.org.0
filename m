Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B34BA294
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 15:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274804.470391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKhTZ-0008Bf-PS; Thu, 17 Feb 2022 14:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274804.470391; Thu, 17 Feb 2022 14:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKhTZ-00089c-MP; Thu, 17 Feb 2022 14:09:41 +0000
Received: by outflank-mailman (input) for mailman id 274804;
 Thu, 17 Feb 2022 14:09:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKhTY-00089W-1x
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 14:09:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7969b3-8ffb-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 15:09:38 +0100 (CET)
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
X-Inumbo-ID: 3c7969b3-8ffb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645106977;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SUEtwAWtcJz8FFqOViIaRergwqEBWyJ861AsBOVBCKI=;
  b=R/Hx+VqmH+l7+XmjT+5i3x2FpCykfy35fzZxn/f+++5Iqi0nLh3AJwXb
   MQvHT93q2V2MhWh9p4R+M6lTa5slkQQQ+hlOS0W8CP3aHti/NemZqJqvu
   8LeQvURFf8k0RlSzgfey3tyoRZJuPoPZ9BwZONzO299RVkiM0vH+1nTnE
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0c5sTZ7sv4VGS7eBVNASqvWdxYBNWSFNbEZAVoAure3ceqSF46EHxBpwVW32mJ0WOr7QT1NRbf
 m1zNcE38Cy/0Rf6oqkNIqqgY2Bu89H8trZ0Za3z00eti2vdE6ZJzLg/hCw+Z67gvKRo3F8ApKU
 auSrBVjOQKXsGZv6UWVHC35D8CbI1hTeYivhjRyso7CqPzFEV7CzbssvHNv1j6g1r6lgH9SVrP
 ZyL3HMz4jmVFs77iHH/zwW8spMGq2SmHWfQqoBBlr0a3cTL2uZyLlB7uwUxZb2lDZ1SVEccYgH
 COAe9ORfCwGG2Lpc4vMKh7xW
X-SBRS: 5.1
X-MesageID: 64434754
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jVllGa0Mwj19pTUr/fbD5Tx2kn2cJEfYwER7XKvMYLTBsI5bp2FUn
 WMaC26CbPuCYmvyLdEnOt639E4F7Z6HndVlSwI+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrFh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhvNB76
 /IcmKaMVV0JOrHUku5BWkZBHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MEh2tv25wm8fD2O
 8weN2B2MTL6UTYTJ3o7Wbtit8ivryyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc81bA
 1wZ/Gwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4onU6SW+V0U+ciIbSNg6rMU8GTV1z
 1DcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNfxorqp5
 iFsdy2iAAYmV87leMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 ReI5l0NucQMYRNGiJObharrVKzGKoC6SLzYug38NIISMvCdiifclM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRfCJkW86n8J0MHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:K6vRhq0o2mJFrx7TBwJA5wqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngOObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Li1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESlti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3h79EZpgE686Ii/r1vop43zuNOd3B13Z
 W7Dk1WrsA/ciZvV9MEOA4ge7rBNoWfe2O7DIqtSW6XZ53vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="64434754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=facQYtpmeQKqa/rBz8SWgotskqCSQh6TYNjmYh/he0qEuWxZgvsRjHQ5CbAuso3yCzyF36j5CLXLfo/cMiKT2zop5TvW3ETkxlXkO0MP1mTn6iYpPsbFb2UUyEEimFCDLMIY3Cm/3HUNMjfyUVjGiZw3GzNs4SqDQ3YmbI1rNn1JFcq/hbp3PhQgkiFCjekjgbVmxst5XzRKyxsHIRld9AIQUjIJB8AO6bsh+Jo/4Yn9Lumz1SqXqtKvX7evcPG/N3+T1R1fN04wYYBrOsOTifOg4aG0yrPsyt2J7xUZQZTYQCuIJX/EzCbAxMsQd5zaGCB7bL+r9ZbdjTwbckGGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmFW8G1SOY+FkPII6jLYpk2BttaqjF96Q4Wld3f0da8=;
 b=lTSbvFXO8gPAtngUkUS/7fomtZ4HftlRFBr4e3luRuoEeIy2o6q++Il4R1o8L+sHUL/8qp4hFToQijE0OPTwISgSe4lSvAiMKoC25YtGHB1tg2lQr7XIIblIZXcvnJrAMh6edTbtqI+TbGyXbzXsY4qtb51hzUz4MEq8yME/aHE8yeuhdtw3ZZXRQRDH4Z8yNNutym/wiglLULFNZHO0EYyxzBtJpZlocgSFuVi+hQ4Pl0Rxdwb8behJDjn5ncdD1VtChHB+sbxPh8wlgJbdcmS0T17J/ZXH9iAI5tOBlklRB2BBEev1kKz9zaI5klVYHJprU2PyxSyXCSYmRTzQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmFW8G1SOY+FkPII6jLYpk2BttaqjF96Q4Wld3f0da8=;
 b=qVC65ufPCLzjkCm35KVHdB7m350phu5u83/feu+8VXd6QS0ytNXYwXKGgEldLjphCiHH93jknxd8Q6I+uWDaUZZWq6fIALRHyEOJBdjIEas6+JCxORq04yFtDVq0fON0+cf1nrKBDccXm+29qUVQhygSB9A839aeLW1iTYg16eI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v3] tools/libxl: don't allow IOMMU usage with PoD
Date: Thu, 17 Feb 2022 15:09:23 +0100
Message-ID: <20220217140923.22485-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d22b2f6-69c8-4427-3f8f-08d9f21f1d8a
X-MS-TrafficTypeDiagnostic: MWHPR03MB2736:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB27360B3F343AF7C35D6939A48F369@MWHPR03MB2736.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LpcFedqog8Ws84N7uxoBccczQaGY+15CES20Jwg8xTBVRMdk0Gni4QRwqGauALuBB8jsKAqLfV8tvidqW70+gGo31Yvg7ewuzqkps7dsbEYr9NGQiQh+pm0JQAT/iKvxhnXGOtOkuOw/8gN8KC1M8TqIJBwFyofFu4E4FCz5bBcxPqVtFLR9xGuvaQwFGMMVefbPjegHr2PkcMrrfzK0CgjjTOuofosYRYjMM/BIGsO4iy3r0t6RIwaWBtO8USvpmHVEFY6Ux1oOoQXd0rgtyxYtOA4DPyu2lUGU/9Bmeaz/PoZkiXXc94jRGDAbFAXbwLij4NaT7NBrAf8d1AB6QBqKtW973xnUYu6ovkREwuz7rQTtoyYgRWGZf5CRXELvxIyOvxU+/zP3jzAgy8IOux57019eeDhh3lNFACcRQDgeD3Vi0SO0GngrbJfiB/ffGGgMUE+DnC8pA/hRy7Ar4vpz1L7CmcFd1dLcfh1d5GNi8EM/+aEyEzEmaxO6X85g0MlYlXncrcRUt5DJGeZ3A9DpA77dGKujF5k7qt17c61Cu6Mu7FfKIY0aZFZAnnEVMS3AUDeO2FhbZGKF8dAmeioc6hk3o6ouWxeEjYeENl0A/s51ibNDrowXeCEu/ZzQNmcbnCUoLNRcf5EETz8Sxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(1076003)(86362001)(82960400001)(2906002)(8936002)(5660300002)(2616005)(508600001)(186003)(26005)(6506007)(6666004)(6916009)(316002)(54906003)(6512007)(66946007)(66476007)(66556008)(83380400001)(36756003)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NhU2NjRUlHdHFxSjgwMGg0YWU5QTN4SlZOdk81MVZJcHpTSDdkVUR3eW54?=
 =?utf-8?B?OTloMUhKSzdDNjFVamF4ekl4dHdTUFRRNGFsQU9NTVQ0TGZFYk9LcTJBVXAv?=
 =?utf-8?B?REF5ZXltYmNMV1l0bWVrVHhlaGcyVEhidVBxSnNsa0N1enZyaHhuSVZ4NE5J?=
 =?utf-8?B?R216N1ZqdDQrY1BFa0pSUXpWcGFQZXJHOUk4UWxWM1lJVlI1dGlRNHJMZDhw?=
 =?utf-8?B?T0ZwT2Zkamwxdmd2Y09EbXlnZ2kram82eHlRek95YlhqQzBOdXZwQmJGNnRx?=
 =?utf-8?B?UGx6dFIvakQ1WCt6SGVBVTdGY0FOOGgyMjZJaDhKOFRpUENmNVFIOFpONjZB?=
 =?utf-8?B?T2VXMnNycXo5RlhYNGRvRlFPOUdJNkRLNkgyWW4wY3BwRTNrYWt0a3lndlhp?=
 =?utf-8?B?dk9aa3A2QnlLTXRvTkV3MVcyU2gzK0xOdHc1SVpNaXoxOFBUekkrWi96ckg2?=
 =?utf-8?B?OFJDdE1JMDlZQnZsdUdPOTVKUjBGUUtNVFBWZXRoc3FBNnl1ekM2cTR1QTFw?=
 =?utf-8?B?WnRnTERsWXQ5ck5jOWVLYnZUeVkvbi8weFFjZk0xMFpZRjl2aHl0dDFOLzM0?=
 =?utf-8?B?Y1NIRDhObkVCbmMwV09XTngvVFdNSGM4dllJZ1lMZk1TSW4yWHAyU2RzQkMz?=
 =?utf-8?B?QmJYZDg2eVE4aVU2SzdRaVluNWEvUG5GWkNzNmk1QURjclh5U0VURWdLRlhP?=
 =?utf-8?B?WThlcVVhb3RldXNWRStMOERqT3k5aC9EK25Zb2s5bTEzVXdCbGJUQW40dmhB?=
 =?utf-8?B?OUVFak9kbUp3SkxSak8xYitRdHBHZ2JjU3dqTUlZbW1UamR1bTlNbWZKTFRn?=
 =?utf-8?B?TzlIWWU1dmVEVk5nYnVrRUJUUDljQkg5d1lNSVNWT1JHdnd6WVlWSHJWSzMv?=
 =?utf-8?B?YWU4Z2VPd2tVY3FCTXJBRkV0WGRsRUZlQlU5MklOdTl1Y2h0cDJIckJEeGE1?=
 =?utf-8?B?VXNyUzNRdUtQV1MrTU5OdDJLWmVhdU1hSEc1c0NIUWxnOXJpUzI3OUVrSTJp?=
 =?utf-8?B?WUx1RmxJLzAwdW5OWEtlczJ6VnJxVGVGbjdGRytjcGUxOVpUN2RLQVhOTzRh?=
 =?utf-8?B?czlwWlNqZGRHdG1YV25FbW9xUmx6QlJZQmtQemc5THM1QUtvQ21ZcHh1bEdZ?=
 =?utf-8?B?R3MzU0F5OUtaQjJNVFBKUkx0MDk3K1NkZXUrWE9lVU5jdlFYZml0M3Nlb2ZL?=
 =?utf-8?B?NEVUcnAreG82K3JrN2NFV0lGallrd0lUY3hob0FINVppT1NBeUhrTWhhYmJZ?=
 =?utf-8?B?WS9PL2lvdFluemF5akY3TXh4YXRVaHk0bHZ1blg4Mmx3a2ZTT1VwWmdPQU9v?=
 =?utf-8?B?bHlJQ2dwUmNjV285Z21wUjdrc254WXlnM2dkdmIxY2p5QU04MFZkL21JNjZ2?=
 =?utf-8?B?RzFRSERkMFJhZ0ZwckZMeGhTTmJJL1hiUXMrM3Bkbi96c1NNZzY0ckorS2lo?=
 =?utf-8?B?Yk8ycG4ycFlYc0NtUkFJWk1IMW1oTUJPa3p6TkVkazN5d0s2cGFsbVovcjMr?=
 =?utf-8?B?MXNxeXQydXVubFlYYnBJSEx1bXRZRW5LZElIMGxRbWswMUFDUHJXZGRXeThY?=
 =?utf-8?B?S2tNR3RSQi9lb09PY0hvcGVXa1IvZG1TcEhRNnFCUHl3ZUFlNGhxMzA1Q0ZY?=
 =?utf-8?B?THk5cm5TSFQ2Si9vWkh2Z0pyYWxxYjdtYmN2QkoxQ1hiL3Jvdk4vZXZoYXpX?=
 =?utf-8?B?RlR5N2dJU21Eak02bHFoRDc2b3hhbVlQSkZOLzRkajVZclZaME9FSVB3Mmk1?=
 =?utf-8?B?dmx6NzViTEcydkdvNVNOMnZzOVY2a0VkbWplaXcwWUtNU210aTlrUFVMSjdL?=
 =?utf-8?B?aWhQQmhhSGpaaW5VbUk4Y0VHbURuSldEeGhVV0NTS3VtQ0NIMXpXSldQR3RI?=
 =?utf-8?B?SGh0TUJVenlNR3VRNVRPa3JhYkpiSW1xZzRpa1h1MDV6WWoyZjRLZUdMaVBR?=
 =?utf-8?B?aFhNZ3VoNDRZSmZlNFFvR0tKSGJkemtDNUVTcTA0RkQ0ckhISGo4dGU0NGpn?=
 =?utf-8?B?V2ZUQ2doc3BpMnRtcFYrbnVGaDNwQmpuSzlLSVhVUkFHR0NmL3N0V0RDNmJZ?=
 =?utf-8?B?bWRxanVRRHlxcE1kbHFuaWxqbCtsMTZaV1BWUlZuaEVaZVRFTGJYcmZ0Z3E3?=
 =?utf-8?B?ckl6c1l6QjhkYkQwbmRFa2FWRlJwbHBzK3I3Qk1kQk81TWxNanVYZGRwYTl3?=
 =?utf-8?Q?VpcA5rwisaifvfbxrybKXV4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d22b2f6-69c8-4427-3f8f-08d9f21f1d8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:09:30.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Us3TIDI4Bxb+3A9rE8fsPRQKMeNaH2D573uDwyYpUA37CruKpGTI7YVIFbC58CD0NsgQm2v3R3n0N8jE7Zuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2736
X-OriginatorOrg: citrix.com

Prevent libxl from creating guests that attempts to use PoD together
with an IOMMU, even if no devices are actually assigned.

While the hypervisor could support using PoD together with an IOMMU as
long as no devices are assigned, such usage seems doubtful. There's no
guarantee the guest has PoD no longer be active, and thus a later
assignment of a PCI device to such domain could fail.

Preventing the usage of PoD together with an IOMMU at guest creation
avoids having to add checks for active PoD entries in the device
assignment paths.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Reword error message.

Changes since v1:
 - Reword commit message.
---
 tools/libs/light/libxl_create.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..15ed021f41 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1160,17 +1160,17 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
     pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
         (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
 
-    /* We cannot have PoD and PCI device assignment at the same time
-     * for HVM guest. It was reported that IOMMU cannot work with PoD
-     * enabled because it needs to populated entire page table for
-     * guest. To stay on the safe side, we disable PCI device
-     * assignment when PoD is enabled.
+    /* We don't support having PoD and an IOMMU at the same time for HVM
+     * guests. An active IOMMU cannot work with PoD because it needs a fully
+     * populated page-table. Prevent PoD usage if the domain has an IOMMU
+     * assigned, even if not active.
      */
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
-        d_config->num_pcidevs && pod_enabled) {
+        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
+        pod_enabled) {
         ret = ERROR_INVAL;
         LOGD(ERROR, domid,
-             "PCI device assignment for HVM guest failed due to PoD enabled");
+             "IOMMU required for device passthrough but not supported together with PoD");
         goto error_out;
     }
 
-- 
2.34.1


