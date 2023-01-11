Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A1666709
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 00:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475746.737560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFkKM-00036x-Ce; Wed, 11 Jan 2023 23:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475746.737560; Wed, 11 Jan 2023 23:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFkKM-00033T-8z; Wed, 11 Jan 2023 23:16:14 +0000
Received: by outflank-mailman (input) for mailman id 475746;
 Wed, 11 Jan 2023 23:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFkKK-00033N-Jh
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 23:16:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb007b52-9205-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 00:16:04 +0100 (CET)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 18:15:58 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 23:15:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 23:15:54 +0000
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
X-Inumbo-ID: eb007b52-9205-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673478964;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=slJOBE0mbK8K/SCPeC6NuKHHLlciEoPKDGwPLBhaokI=;
  b=dPNydfVYHAhaWXCCifDhULmF9pfCS5A8owaWJe0s2D91YPItHxtQeyvV
   vrJxLvAawTWVAs8tsgOPbsFYtOp3NlU76TAcmU/Yh6Sx8hoPjYPKHjvd7
   kJwBh5dqVkekZjH8H4pWZ1qor2/6plNqtDHz9p/l0Tr/eAEV0xv+sCA4m
   o=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 94677062
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Qmwatazk4O2zKbZ+teR6t+cGxyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 mQWXzzSM/yNZmbwc4x2PISypE8Pv5KGyYRrGwZq+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPKkT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTl8+
 /MYCCoXVRasjb2V+JeRTvNO1v12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMouFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqBNxNS+XmrJaGhnWL31cCNjRKbmKy4tO7ulC6XYMEI
 BALr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BXMDYAcUQA1D5MPsyLzflTrKR9dnVaWy19v8HGipx
 yjQ9XdnwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:OEBT06664SBrvsnFyAPXwOPXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwQZVoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eA3OBjKadH/DBbytHOuQ4D9QYUcei1UdAb0ztE
X-IronPort-AV: E=Sophos;i="5.96,318,1665460800"; 
   d="scan'208";a="94677062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nds3jGcURGqMSuukeSyz5UDTRKTp0KFhT8LggkajqVuGM0VfHlqF6NQnOzxWAHjYV3yZecoOWWkS04+DI74M5RcAg8MQ8VuUxelyfQHSC5Og4uRDu59W4y22OjiZg4T57R/RUJIvtQS1+ZkgNsCUbuNDcZddglslXpY1/TSQiMo8poySYazlEO1xQDz1fBBU6I+iSLAS1+vqJF7YXnD8yyfcgoRvnkM1YVDgAJJStsaacQNihLaf7hgz8hJPdV4paqR5WfHmF71miA0ILePb+MaxXnFL2ay+tW/H1IvYTCjBuT9Lzmi7pidDcpvBvKQ2wwI82ir3Shf8fBjuY+eZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slJOBE0mbK8K/SCPeC6NuKHHLlciEoPKDGwPLBhaokI=;
 b=ChrJ9VNzWyny/uenxMrvdJwkgbXsHOUb2ago5wakIF+kbQW4Qz0pjGh8lEgaRAAupxwyjKd7jP25oYs/g+xJBD4Oq8sHiq9FagexIZiV6oWB1bf/Cga6g3pw/PpeVXTwtPZgKiScq1RiLUtrSr0IVrAVLQYbaDJrxOY82I+xRVagV0XkeyUqZH9jOfA+nIlTdxetj4rgoQ0RUILv1RdGrUapcx77EnrYj6Tio5DkrBcqYZngJtt2ZsENr1+xdy1LzYzT28Kr64a0f4eFFNb6MajoYaQju+uJ9Z9tZKdyo+Os1gprlvvfesy2/9VxCm/ypBUrjpUG4XrHk7s9FDBwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slJOBE0mbK8K/SCPeC6NuKHHLlciEoPKDGwPLBhaokI=;
 b=mvZd9QZ0ONLdSRWieu/HDYKulwN6TQZ1ofYY4uUDzZ88nrl0kSWii1+xwgu67UPc7OzCKLVhxnvmViduiFQospt4D/zF00BsQ7R1UR7EfsMmTLkGvPEKszWojlYJggPMlcj6OHWNVJh+doyAuOSAiedfmrwTH/UBeaQq2GNrKDE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Topic: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Index: AQHZJcS6xQlTtpJxX0O79yAhgOZJ+66Z2cOA
Date: Wed, 11 Jan 2023 23:15:54 +0000
Message-ID: <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
In-Reply-To: <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5878:EE_
x-ms-office365-filtering-correlation-id: f701c556-07ac-428d-1861-08daf429c9bf
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WePJjXtuoCD6sIsVm+E5aPCU4umzbvrkJreTKNkVPb3OlmQSIevaohe7ixdpzS8IPgr0fsrAP8Sf7Jz+x+qt3QdYQ+b/yeuayrXfVZg+iXK5WhVOFWooFnQzFnyA7FErNY52E8fQ48vsVjwweXr5zLt8N/GYPcC4kY7gzNVMYzMHFTdM92V0bwRNPsZkKh3q5ThLy6dLmka17gw6ckmyntZWi7f4HKZ4ydiqsDRd7dVidDomFhJq64NFwzfTeyYtMSL5m+PmKeO4SXZw1Srs/xArOt77doq2ZCNkk4Uk7YKZe6pvEtBdZ3Xws9PYaczgHmRXlDCMdgnJ66gI8icHWD7hA1EYtz8izkO1GIQ9ypH1zuz/ANleDXPjzEjMAUVNs3DRcCJFEkFTo1ab+7rVPblio1IgKbx0GfZhB4G8w2vUcWvzCOEgu9WP4MNagFo0RsdbusrsU0apNom5VM2UnD2OBBIgsph3+BX94V5rH2Q5tyLSZbmEL/XFe7WTTpF89G3mO2RRH3D21s5OkWOaE9mWOXTFVC2c2Rtl5bvZBmMF0SsMB/vPtFr7vph8RIzYM14G4GzMS2HOVRrO9LOmk9y4gl+uVOAdz9ZF3uI0Lif4vze+os3iurHhcvUG3IxhVSoGkFVxbGvZ0HvijAx5N0jcDBUCv3GsQlEtJq5Aw1zemO55Pyoy33KLtdmjMS2CwJ9dcKd/jvUyDKYSxSOfw0CYUVy1p68c0BMZRnrVqfb0zxqO/jls1xOCslnFDX7FcRCdfNxsgoiTmwnpwh9rTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(8676002)(186003)(26005)(316002)(71200400001)(5660300002)(6512007)(6486002)(478600001)(86362001)(2616005)(31696002)(41300700001)(54906003)(76116006)(66556008)(110136005)(91956017)(4326008)(66476007)(66946007)(64756008)(66446008)(8936002)(36756003)(83380400001)(38070700005)(31686004)(107886003)(6506007)(82960400001)(38100700002)(122000001)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVlVQVZCZm9rdnYreDZLQkwxdjVWRjJNSDBGWmZGMDRJZjZXZGxycWZ3RGpq?=
 =?utf-8?B?SENmdC9tK1dVL3NsUjBua2R3ZDBzTUFCQkNTT3JHUENKY1plckxQeWZrdE5j?=
 =?utf-8?B?ZEZydDV3M1R5LzRGOEdzQ1ordFJMNFhHM2hZRnYxQzhieCtvek9iR2ZrdWxt?=
 =?utf-8?B?dGZSQmlWcDdheU9OQTRpVjFmZVhHSmwyZnZzdVZwaENFVTEyVlhvME5kSGRW?=
 =?utf-8?B?LzlrWmIxcG0rWjJXRjZ6M2Jrd2hYcWJjVS9nRnVkY3lyQ1FldzRJZFBhaW01?=
 =?utf-8?B?NTNNMEhHU2ROenVaT0NuNklZaUZaMzh1V0o0dzAzbXZUMW5PclJCVWF4UU45?=
 =?utf-8?B?b2hlSmo5RnNBWVVNVEZrSXp6dXhDcXFtRkpjVWJVMmhzeTBEMzg5aXBOOTE4?=
 =?utf-8?B?amhTTlJnaEFIRDZ1L3BwN015MmdTTzFDVHRveW83dWVzOXR6VmVPRmNnSXkz?=
 =?utf-8?B?NkRzV0dYOHQ3YWIwTDIvdmNzTkJYMFJMc0ZwWVY3M1ZGRG50YWR1NHRDTEpE?=
 =?utf-8?B?bGxTcG9SazlKYkljRkE1VkloYVg5bUpCVEpMZThSelAwZUNCbk9hOEt0ME1C?=
 =?utf-8?B?S2FiVU0rUlV1c0JwdVpwRjZ2MlhQMzJlczVpenBKaHoyc0V0MzFNYUVzbkdR?=
 =?utf-8?B?SmtjbFR1UStDMnlDaklqMXdBY0xRMVM1cmw0L2lxNWtxM0R6TjVZNHFoRDdi?=
 =?utf-8?B?eXloYlFxRDRKKzBZN3cyTEpra1lsMGZWOW5HNm54NG1tYk1mZkg2b0grdW5F?=
 =?utf-8?B?MDhMSXRncmhaOGFXYjN2cXU0c1I2aHkyYjM2ZG1RTnc3TXhFNjJ3TzJUc1lN?=
 =?utf-8?B?NDd0UWtLN1VsTlJRVE5EN2N0RE5YRitOTWI0OHBUMC9ZbWgrMUdqR1RMZUVP?=
 =?utf-8?B?aFdaUTZSSnF4c01oTE54eWxQaXVzWkI5Z3FSSU4rK2ZYSjVVTkJvNHZFYlo1?=
 =?utf-8?B?TVZtcGwvdVQzUlVGUnBTN0lXcnltZlpEU3BBb1IzVHA5WEVJWGk5TVBtbytr?=
 =?utf-8?B?dGxqaVcvcHFhNlRaOU5hZmRBVk5rVG0xSzRqMUE4b2phcFNwSGJmeGF5TXIw?=
 =?utf-8?B?c0R5VmxxOXRyUFpRMFhYaTZNQVhIcjNsSGZSYWxrL3UzUVo4Vk85VHcycGZU?=
 =?utf-8?B?aGI3RUl5TjVpT3NBTndwbnl6b1hXS0VPVm54RllUVGZtTjhqUGZGeldBZGlY?=
 =?utf-8?B?UUF0R3JoQVQ4eFdPSVZLSmt6UjIrUjBTMDRIcUhkaVpuc3RidW9FemdIZDJO?=
 =?utf-8?B?VnE5STJRR0hOeEdZblAreG9DR2tMSU9ocEM0MFBLaXJKbXVPSzVHT3ZjU2NN?=
 =?utf-8?B?cFRlVWVoY1ljRnNDN3I1WWFTU3IrbDhlUU9pcVNUTHl4bTRzdm1jZU02QlFT?=
 =?utf-8?B?YXdGZEpZK0EyOGJrV3ZsRWFBM3BkNFRud0dSZ3c1Y0liRUZNNDIrd2tTOUt3?=
 =?utf-8?B?WFM5N3pvYUJvcEVyTWEwRUZWTm5ZYlFrYXVpckE3NDk4ZENVcDBzQnZRaDhx?=
 =?utf-8?B?eUU0dkxZSVZSZks0STJreVlsYXl3YTl4R3h4dEFXYmtUQnJqelVXRVU3aXFE?=
 =?utf-8?B?QW5oOFk2NmZaajNYU2FPZVpHZkJpU0h3NXNuTHAzamQvRG1GYVhrbzU4Q2x0?=
 =?utf-8?B?bVhxVVdRdzI3b2VGWEVpKzdiekFReHFOaElUaTZiK25ZTlpldU1BZ0N0TVFI?=
 =?utf-8?B?U3lDdkc2MnZqaTZjZThnN25xNk9nNUZBVmE2ZzBxd21Cc1U2dDFPbXRTSWV5?=
 =?utf-8?B?ekN1a1NjRGZUSGZmaHZqMlRFOWZQQWpuMjFSM0dHT0w3RUkrZVRCZ0w1THdj?=
 =?utf-8?B?K3FoK21sRHFMTXNTNHVRL0NjWUVFNnd5TVNIdzBWQ2NqdlNMVzh5ZS8wNUlv?=
 =?utf-8?B?MXJEWjJUR0JxRU9uZ1plM1psTjlSSzlLMlk5cGlHdElTWmZxajF3Uzg3dW9x?=
 =?utf-8?B?ZnFzSUFJODJrSnNBdU95MzZMSVN3S243UktoWG52NzNMazdVbkJESTVhcmY3?=
 =?utf-8?B?RXZBQ1c0YmZkTkdDTjd5NWRhbXd2ZS9LbUtBYlRDSy9FbTY4aEtWcERMQUZN?=
 =?utf-8?B?UFI4NElPREFvK1RsVWhPQnJlWXlNWStYY05WdS9CakVYS000dnM5aXUzY0VX?=
 =?utf-8?Q?H9oFluWCo0Tw1Tlb1x1QG7TNd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78DC18C3BC14B84C9444B4499CB72BBA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ooad0/v2jJu9uW40vAsT8k7+/QGv7NWCMu/cy6vYerVsvbhLKfE8OGB6iP02NMm1cHUfgN9qtpb/7IRg+g2+p4sCACKIyNY8tG2NT7fB2OL70+hN+hZhe9JwkwteAjRa/hQ5NCQVOI2vZ/JP4oX3gsKbvJCIgiiuYpas2YsY3aBYWhOVc2X/AYOyYN3YPyeVH6QufnQKi+20tZHGW7/a/tFlHt3m18a3PIYYLL6GBoz6YI0bq6N43Md3+UNa45xMNCjPqCAiN4KxlyGAEKLsqdPPi1YkJ2ySRYN7FI8vgLGSYtQnWlaMV9vKq/mgZOg4ZiQJY8Jq3tZB9kwPBeIhphXHutVMx9olYH1/X+47GtO2VBxU3YKZU1ftiXf7TLlhZYHJ7EBcnwbAkK8kjybSE4ckQRQD6CHBgEfm9k/9AAnL+r80VCan2TqZ/qvPrVOwlKeWsw7YD78NpuRGE8bm2/B5ZxNvNO8ZIv0WH9dmw2mP50AkkD0lmUpXMfijd5mte5M+k/lnPu/MYkniM7fHbmLCa5d08FrwMtJXRLIQ8xbVcdCfadjc4h7oBRlrvb+RKbQPzzFKNpKPCi8i4FsRi9A7jsTLPB0pE9IHxoGE78auw7V7S4nvdNUGCyVMllBB5A7em/UelV3A98mWyUa+Mm62uRa8AggeDHNe1si+cADQXutP5xqS0PqA2mZ763/b379SPQj2dr7Va849n6pfJUVvVBrewx8UXvADZ3g4yn9m7ZrixEQT6uDbAdh5bBy0YwDTaNBjpT8b2dCliqcoIJaLOZiM3G3s4kMOnFSP/1M0e9NATUhsWUwmOJFmHFadPi5fPw25hFbBj3vKqg09Lw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f701c556-07ac-428d-1861-08daf429c9bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 23:15:54.1302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7VQWYOn5+3L9DU7sd1Aowg88BivuWmATZiCBiC+n5uayybwdIwu95/ql57+lG9w4npIlXSTFWiocB00xxfENYP2I8xRMgCobDLMbR1vwgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878

T24gMTEvMDEvMjAyMyAxOjU3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTWFrZSBIVk09eSBy
ZWxlYXNlIGJ1aWxkIGJlaGF2aW9yIHByb25lIGFnYWluc3QgYXJyYXkgb3ZlcnJ1biwgYnkNCj4g
KGFiKXVzaW5nIGFycmF5X2FjY2Vzc19ub3NwZWMoKS4gVGhpcyBpcyBpbiBwYXJ0aWN1bGFyIHRv
IGd1YXJkIGFnYWluc3QNCj4gZS5nLiBTSF90eXBlX3VudXNlZCBtYWtpbmcgaXQgaGVyZSB1bmlu
dGVudGlvbmFsbHkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gLS0tDQo+IHYyOiBOZXcuDQo+DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvcHJpdmF0ZS5oDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvcHJpdmF0ZS5o
DQo+IEBAIC0yNyw2ICsyNyw3IEBADQo+ICAvLyBiZWVuIGluY2x1ZGVkLi4uDQo+ICAjaW5jbHVk
ZSA8YXNtL3BhZ2UuaD4NCj4gICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4NCj4gKyNpbmNs
dWRlIDx4ZW4vbm9zcGVjLmg+DQo+ICAjaW5jbHVkZSA8YXNtL3g4Nl9lbXVsYXRlLmg+DQo+ICAj
aW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+DQo+ICAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPg0K
PiBAQCAtMzY4LDcgKzM2OSw3IEBAIHNoYWRvd19zaXplKHVuc2lnbmVkIGludCBzaGFkb3dfdHlw
ZSkNCj4gIHsNCj4gICNpZmRlZiBDT05GSUdfSFZNDQo+ICAgICAgQVNTRVJUKHNoYWRvd190eXBl
IDwgQVJSQVlfU0laRShzaF90eXBlX3RvX3NpemUpKTsNCj4gLSAgICByZXR1cm4gc2hfdHlwZV90
b19zaXplW3NoYWRvd190eXBlXTsNCj4gKyAgICByZXR1cm4gYXJyYXlfYWNjZXNzX25vc3BlYyhz
aF90eXBlX3RvX3NpemUsIHNoYWRvd190eXBlKTsNCg0KSSBkb24ndCB0aGluayB0aGlzIGlzIHdh
cnJhbnRlZC4NCg0KRmlyc3QsIGlmIHRoZSBjb21taXQgbWVzc2FnZSB3ZXJlIGFjY3VyYXRlLCB0
aGVuIGl0J3MgYSBwcm9ibGVtIGZvciBhbGwNCmFycmF5cyBvZiBzaXplIFNIX3R5cGVfdW51c2Vk
LCB5ZXQgeW91J3ZlIG9ubHkgYWRqdXN0ZWQgYSBzaW5nbGUgaW5zdGFuY2UuDQoNClNlY29uZGx5
LCBpZiBpdCB3ZXJlIHJlbGlhYmx5IDE2IHRoZW4gd2UgY291bGQgZG8gdGhlIGJhc2ljYWxseS1m
cmVlDQoidHlwZSAmPSAxNTsiIG1vZGlmaWNhdGlvbi7CoCAoSXQgYXBwZWFycyBteSBjaGFuZ2Ug
dG8gZG8gdGhpcw0KYXV0b21hdGljYWxseSBoYXNuJ3QgYmVlbiB0YWtlbiB5ZXQuKSwgYnV0IHdl
J2xsIGVuZCB1cCB3aXRoIGxmZW5jZQ0KdmFyaWF0aW9uIGhlcmUuDQoNCg0KQnV0IHRoZSB2YWx1
ZSBpc24ndCBhdHRhY2tlciBjb250cm9sbGVkLsKgIHNoYWRvd190eXBlIGFsd2F5cyBjb21lcyBm
cm9tDQpYZW4ncyBtZXRhZGF0YSBhYm91dCB0aGUgZ3Vlc3QsIG5vdCB0aGUgZ3Vlc3QgaXRzZWxm
LsKgIFNvIEkgZG9uJ3Qgc2VlDQpob3cgdGhpcyBjYW4gY29uY2VpdmFibHkgYmUgYSBzcGVjdWxh
dGl2ZSBpc3N1ZSBldmVuIGluIHByaW5jaXBsZS4NCg0KfkFuZHJldw0K

