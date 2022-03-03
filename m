Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5394CBCDD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283190.482126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjlc-00060T-Cj; Thu, 03 Mar 2022 11:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283190.482126; Thu, 03 Mar 2022 11:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjlc-0005yG-9L; Thu, 03 Mar 2022 11:37:08 +0000
Received: by outflank-mailman (input) for mailman id 283190;
 Thu, 03 Mar 2022 11:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPjla-0005yA-95
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:37:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3edfa3dc-9ae6-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:37:04 +0100 (CET)
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
X-Inumbo-ID: 3edfa3dc-9ae6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646307424;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Cb4xBVEjX3PXCqOsreeZ8uwWmIU3vSm1XAWXBXII8Xg=;
  b=TEPJLnOtMlXiSLDiOciUpEqNgQSBtKHthuiBdBdlO7GvG2pMziGOn6EW
   hVLhKZuPnotvu2EJsX/mRPf/9No2n60IYV9SF+aRi4zTJSX8s1c211qsE
   4G+SPn49Tu7BEXsdAZg/Hs4eAsGHi9O7YWQcgOoM9YphL5cxdEG11LEf3
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67706522
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9keCa6luhCUPutNbjeE6GCro5gxEJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWj+CO/2LY2HxfIsjYIW18U8H7JDRx4RlHFBl/C43FCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1jV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYiAAIL/3kuckcFpJAjojYaJPp4CePi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNmU3MkmaOXWjPH8YUqkCtaDrt0D4cgFVoW+np6EZ/nrcmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+Owm0eDjUGWF39puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+/ihqsKxMfLlYhJj4VVlZZ7NC8n9gs20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R5n9hO0yT6FWy13N2YDB0zWirjUWW0C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFHdoH8yNBXPgjmFfK0QfUcXY
 83znSGEVytyNEia5GDuG7d1PUEDnEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARcJmAKi3iSccW1nqBlLMdvSYHq2llpiVQQENle0wXkzJ4Gp6aYUbZwserc7sudkyJZJo
 zMtIa1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:iOGPlK97bleNiO3iVrZuk+F4db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFr7X5To3SIzUO31HYbb2KjLGSjAEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadh/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngdOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerR8bMpiA2rkAgwbzYxBOe
 twrhGkX9A8N2KxoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbRBFrEmpe4fdIi89vdvHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="67706522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ9rdvGp7DzgyZ/w7P+iFxaEALoB8206ayrlWpaUAN42TouYGPM5RtZkBXdePnaG67ud5f2JDexN+5ULgLeLqaZlFxbd7siHRCQRbjryBokFtCaguubV0YIc8Z1+D97aixGeY6Zh4oel/kDAvAUaVW1O6+elMzIdavLHtqd3fkOovpekNtRaga+q4xMep2wZpwQfYSWACMmqrdJW16JfpxcUEPa5p+KLJhVYKrM8cPTKOIe0gQWxsjBre7huknn6TTdR3fVOx+/P9l6vRmbmWva1woT85Vzn/8MI+X4NRteCcdBtdjcnJsIA21UVSM0MFr0osXtiel8b4q6wfTw/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb4xBVEjX3PXCqOsreeZ8uwWmIU3vSm1XAWXBXII8Xg=;
 b=HYl7f9ZqsQoBIeUoGKCiN8I79FxnWzCxhpX1P2aZf6ENnAY+O/M0AEPqifCvZbBgjGWQi508qebPjAxiKSdtyluKdc5II81SU6S+69KV/cR4nGKCQxZGD3PAdoebzHHOvf75KErumcam3JCBbNbPta8tCx6G+szyNI/X7fI5KJoUI5eWLpSuTwNcI+1GK8k1sQ41UUzBDn1tJUtkuYjOFWOeLwz4C5uoGEHnj9cReQ8Cy31VFLue4I2DwTsJclrSgwogQo9E4PG5NvPW7c1e63hAd3ENEDTUOfY6cOe7pM/LnnpC9l/Vf61advoeupA4cwsG4j3gVyuF54uGorP71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb4xBVEjX3PXCqOsreeZ8uwWmIU3vSm1XAWXBXII8Xg=;
 b=rP42yJSsz579izwoT0kKHoiwA2s6Z+BUHRnl5RTPdZRj6xipLT9H1F5oo7V55WMJwzlLrIXCjvfdxQ6o/bWYZXn8nlTf/nq1gIjMuBUPg0Rij9gv92EWqxMP/B6z0mOCM8n0Cz8F5Aw3Qf9YSI/UjATwLrREezoYPhZfegKsa80=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 0/7] (mainly) xz imports from Linux
Thread-Topic: [PATCH v3 0/7] (mainly) xz imports from Linux
Thread-Index: AQHYLuX6wszWrKqmBUiPL23HmTWk46ytiCwA
Date: Thu, 3 Mar 2022 11:36:57 +0000
Message-ID: <d039233b-d9b3-1767-7fd9-dd65cbb9c537@citrix.com>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e35c3462-c8ec-4c7a-cc47-08d9fd0a1fc2
x-ms-traffictypediagnostic: SN6PR03MB3870:EE_
x-microsoft-antispam-prvs: <SN6PR03MB3870EA7D4F5113770906A18BBA049@SN6PR03MB3870.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gE9WkHajOWGa+neMtoX8Z0ROKyG3qbiH9pLECdM9g+/ZsMN49OJWJhzlk3LtfcjeDWHRlqQ9PYyFL6+XccYT35r5N58qDsWUWXti9vfhD/ba4GfTo9DwjICuJm72SIcz4uO1LfK0rsrY1maQW+4/UY6yxFrT2sYytzKiwwyZDNm2RwTsPRFdwnMf1hnxvp4vs812L4hTPbCUt6RBp/KNtPw8ZuUQCYnAB9BmX7rkYyijbsWkn/W9ZtU0RDRt44nUF/Qn0wMivuQs+5g8LFspvdgXl7V1wTXC8xOo0k05vOAIvzaJuWJ0F86j9jXNhYRVWShb6SslZ9ncJ5EzvI+kvopnZ9orwcGhMeug/WM05Lf98oOVpdk2JkrTKD+V+fKdEilWgrwdciniVx6NV3mF1VgMNeeGdWJN141Ve09s0kzD8UACzxV0brdXdUmsRBg+sfoaPYXl8y9/OeUwMbaPnGEUi5/Yvcnbe2yDjJaueLiWD2tezA9jjmdO7TQ/ZkV97LTmKq0KUrSVP7ng6bBxNiq0EvF/jOZI0hrJlpf6tYKnErz4n/1z6jgBKeK++fQfxzk+cxTH1sLRcsbDXAy83+Y+9x940FLwZJxChpqZb/e2EredX+8WdnY6k5JujIoCl1h48xkgPLe+xy4+v+GWa3dH2DmPKeX28d4lKpVIVRxRdZSx1QWgyZJGxUU0G8DgQwDeuO7epxPGCwgsNnHWOHYwiQDqUQsMmafIupGHr/GMY8t4IvCDofoycnIgSHVldIuJmSzMAC0exUt3zuAaqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(82960400001)(31696002)(6486002)(2616005)(186003)(508600001)(83380400001)(2906002)(53546011)(5660300002)(38070700005)(31686004)(122000001)(4326008)(66476007)(64756008)(6512007)(6506007)(91956017)(76116006)(66556008)(66946007)(66446008)(8676002)(316002)(38100700002)(110136005)(36756003)(54906003)(26005)(86362001)(4744005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnNoMVNNWTJsOXUyZVVtSUxyK0F2RGc2czBkenlVMEZNR08vQUc0Z0hVcUhD?=
 =?utf-8?B?dzBZODB2RXcrQWxxdVZTV2hWY1RGb2hOVFRCYk1UWnNmZk5ScFUzSndIV29V?=
 =?utf-8?B?ZDNaYzEyRWtaaUEwb1FJNGtodnRpSnRORmhSc1lEdkZGTmxvYVpsYng0bTlV?=
 =?utf-8?B?VjRTZXhodlBqL2UvdDhHdUc4eDV6OTh2ZXdiYXAyNkFmSFI1a0c4L3NrQWR6?=
 =?utf-8?B?R09kOCtybkFyYWppeCt0R0NtNUZhbi9LU2h1M1hiL3VYT0hEME9KNktwdHZx?=
 =?utf-8?B?WjE3NUo1WGNOMlhuRHRMVUx6R2NoR0hKK3krQUc3dUt3R3l0bjNCUWJvK3lx?=
 =?utf-8?B?R3hURm1iMnBjWjl6YzZLMEZ4V3pPdlVFcWdiYjg5YnB6OEhkQWNFOEgwQTc0?=
 =?utf-8?B?TnZVMnByWGM4aDRyY3RXdm5nMGN1ME5OTWFZOVUrRmZBREw3MGVXOHBRZEVm?=
 =?utf-8?B?dy83Y1dSVGp5a0t5TjUxaEwwNzlzL1ZScEJjdFkxR2p5YUtlRklVVWtrZHRO?=
 =?utf-8?B?Z04zVFRjZWUyTTZwUXc3T1VpTlJtUHRBa1dDQXU1T0Rab0pwaWtPa2NERmVY?=
 =?utf-8?B?dVZ1cDEzNGhRVmdYQ3NSSU5US1BDQ1FnRytDQnNLWDVmMzFoSDdveW1ELzMv?=
 =?utf-8?B?dWp2Mm5nNWJuc2NXM3FIUW04Nk5YWWI1YkF5VVlGUndqNWpkZTJLZWVNODE5?=
 =?utf-8?B?cnc4VzVBb3puMkNaNTdNVW9rREs0TTJZeWZEODRDNG5mSmlVTVFSVFNRbjF5?=
 =?utf-8?B?eUlkRUJYbjcxODEvaU56ZlU1RWF2aGJYOHVsN0lCSEQvc2JLdjdFejVyNmtI?=
 =?utf-8?B?cXlPWHI1NXArcGxBUS9kZUVrajdzTTBtN1BnNGZjOEJ1c1RmTitMN0NUaDVJ?=
 =?utf-8?B?WmRmS2FiaU9KR3UxUUVyNFdhRGdUZmJFZHExWGNyeDU2Nk8wN2QwVUxvUkFL?=
 =?utf-8?B?bDFwV0tlUVY1QWFVYm5taFo2a1I1Ym5YVU5XeGdaZ2FxSXlGZitmLzBzREVm?=
 =?utf-8?B?bkpzWmM1SkFtcEo1ekdMdTRtcU1WZ3lhcjdadVNEaGZXSjIzTW5KckFzODVK?=
 =?utf-8?B?YSttbEMyUGVwTW5zWjdORFh3bGRDU2tSZ2MwZTB0bGZ3elpSMDBtVk9reUdG?=
 =?utf-8?B?WU1DTmNjd3d0SXBnd2l2aE9qdnFMcFora3FBckY2bDJPRUpaNDJUSG02Q0xu?=
 =?utf-8?B?Z2pBM2dBYzJzV24vakRyQzJjem0zU0luaWhKaEp2TUxzT0VvK1hlaVdRaGdj?=
 =?utf-8?B?d0JkWEVlTmRVbGF6Rm14anhRcVB0NUlhSXg1TkkyMG5CWXFRSW41U1ZTUXNT?=
 =?utf-8?B?U1RJSm1yVXg4K3F5d2V2RVJ4YnJxVk5mY3o2Ym5MT2ZhYk1tVDdDZ29WR0d5?=
 =?utf-8?B?NHd1RUxYWTFVT3ZGYjEwSTRzRkJvSEVCNVEvWWpSeEQ1ei90OHovajljVER1?=
 =?utf-8?B?bGZ2Q2prOTB0eHV2YVhDbjNmdmJwNU05c0pJMGhsb09rMGJJTnEwaStJYmpT?=
 =?utf-8?B?Q0ZEbFIxc3FOb2tXT1ZuTU45L1YrMGprbXNoVGVRR2h4VnNlbUNza3VoZ3U5?=
 =?utf-8?B?U1N2Sm1SZ3B6YjltV0JJWmF1QWNMcjNRMFNIWmtibFlJN3N1cHBVSnM3REVu?=
 =?utf-8?B?NGJGR2xtRHE5cmkycWNKUGJxVGJpRU9uL0ZpNG9IdFM4ekF4QmdaeXdSNTFR?=
 =?utf-8?B?b2pmcVpZZ0tBTDZLN0U5Q0lROEx1NUZlaWNpZGJmaVc2cVRaUFRQck9DMkJq?=
 =?utf-8?B?T1J6RUlkMmhxNzZYMzVmcFQwMmFKak9tZHFCdW1GRTRiWEp4cFN4aXllcXlW?=
 =?utf-8?B?cUhTMnJrWFFBNEVUM1ZCb0tSNzlUYnM4c2E5NWlDMDZHTExyajdzYmREV1VJ?=
 =?utf-8?B?Y3ltSkZWTHg1ZDNiZUJYYjNzUEhSdGVPVm5KNEVCalVxQXdzNGl2V2pCUTF4?=
 =?utf-8?B?WlV6RE1ZYitjMUh3dmNMdnpSejhFZWtBL2dnOGFhV1pmdFRzUUNsWGtpVmYy?=
 =?utf-8?B?Zm11ZHk2d3g3ckpRUnhxOXIrbGlGV1dKUHA2VEJ5aldmZWEzN3U3QU1raXYx?=
 =?utf-8?B?N2lwbFJjZ3FyNWlXMnp4d0tHNzdYMGtLZzJWN2w0N0lWd25pU3JoM0todVkr?=
 =?utf-8?B?Q1Ria0gwYXpldnVhU3gweVZVdndDVlZyUS9CZ0dOa3BhWHB0WTZvVjlQc002?=
 =?utf-8?B?aThpdENSd1pEUlpaUVk5bVdpb2RWYnFEQ2llZXB6cWNUWEZQc0Z4R2NDRE03?=
 =?utf-8?B?dTFQZU9ueEl6WWVIMkFFV2ZVZFFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B04C0B7C54ADC4C9FA263DFB26C13C4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35c3462-c8ec-4c7a-cc47-08d9fd0a1fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 11:36:57.2121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfqILr/wX6j2YL3T1Xrdrrg74c7j4IjMFaN33FzH8sDXOUi6hJodyGizObmWJZ3N0CvTtT9NGH4KHPMls201mSh9lu25nHJO3S8eBcmc7pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3870
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAxMDowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IDE6IHh6OiBhZGQgZmFs
bC10aHJvdWdoIGNvbW1lbnRzIHRvIGEgc3dpdGNoIHN0YXRlbWVudA0KPiAyOiB4ejogZml4IFha
X0RZTkFMTE9DIHRvIGF2b2lkIHVzZWxlc3MgbWVtb3J5IHJlYWxsb2NhdGlvbnMNCj4gMzogZGVj
b21wcmVzc29yczogZml4IHNwZWxsaW5nIG1pc3Rha2VzDQo+IDQ6IHh6OiBhdm9pZCBvdmVybGFw
cGluZyBtZW1jcHkoKSB3aXRoIGludmFsaWQgaW5wdXQgd2l0aCBpbi1wbGFjZSBkZWNvbXByZXNz
aW9uDQo+IDU6IHh6OiBmaXggc3BlbGxpbmcgaW4gY29tbWVudHMNCj4gNjogeHo6IG1vdmUgcy0+
bHptYS5sZW4gPSAwIGluaXRpYWxpemF0aW9uIHRvIGx6bWFfcmVzZXQoKQ0KPiA3OiB4ejogdmFs
aWRhdGUgdGhlIHZhbHVlIGJlZm9yZSBhc3NpZ25pbmcgaXQgdG8gYW4gZW51bSB2YXJpYWJsZQ0K
DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

