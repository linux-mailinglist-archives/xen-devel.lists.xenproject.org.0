Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE54E7910
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 17:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294848.501555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXmyT-00073L-NT; Fri, 25 Mar 2022 16:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294848.501555; Fri, 25 Mar 2022 16:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXmyT-00070d-K4; Fri, 25 Mar 2022 16:39:41 +0000
Received: by outflank-mailman (input) for mailman id 294848;
 Fri, 25 Mar 2022 16:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWi7=UE=citrix.com=prvs=076b843e0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nXmyS-00070X-0l
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 16:39:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 283b51d6-ac5a-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 17:39:38 +0100 (CET)
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
X-Inumbo-ID: 283b51d6-ac5a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648226377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SLVN7cwGxqFBVcr5jwBAWzGJ6d7XaOaSr+mkuRo4CLo=;
  b=AXyoA4eVdixssIYLG1RDVImNJ3OuhGci3AICpFr/lSfzARGDNvK90/Ar
   eDSVE9rRg6huoGUSLyfjK/lOxnCe11Y0yknkIaff3zmZW0w4rfAa+3wIZ
   3t/xLU7prBsYlcu8aVKOlfU/hqmGkc4zsRFpv2GBr+NXYbLAqQyosClek
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69571189
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8a+04a95vRWnoJzQ+VpmDrUDk36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GJMWGjSOq7YZ2L1fogkbYS+9kID6pXWmIdmHgU5rXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbyVUz0iOKbIo7hebxgBM3t9EK5P0rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZtENmM2PEWojxtnIgsYDbcyjcGUn2DQfiNRiVabqK0Oyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUazRu3wazf5z3FRVQFFx4ba/ElveU5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swpn2AAcmV83lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1Yp9ZJGK3M
 RSJ4mu9AaO/2lPzPMebhKrrVqwXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLrt9JcQFbdyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:t1CLHqEvhi3/3Z3XpLqFSJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVp2RvnhNBICPoqTMiftW7dySqVxeBZnMTfKljbehEWmdQtrZ
 uIH5IOauEYSGIK8PoSgzPIU+rIouP3i5xA7N22pxwGIGEaCJ2IrT0JcDpzencGHjWubqBJc6
 Z0k/A33gZIDk5nCPhTaEN1OtTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNFNyMIv/MpTvKe0Tt8gDg06t
 M544rS3aAnfS/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfusk8p+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNc/W2He4OSITeuOb0oEiPvE=
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="69571189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNI13Fs7pdz+7x8NxjmokPsLcNu2mdxto96K0mrnaiZ6yiZEM7Ucj9URUO0O5xvkFYV1dvvt0Tbizvvux6WvC+JPJpaPuhG4hwjU0Hx2jBfQ9LPNoeImfFrgm9WsjgOBI4HgYBWlz3xmyHkavo3afcnjNL1IjerF5Cht9mGNRwj/U4pxJUuooSrFE/n9ZnrdihIvtEXCzbqoFNs7KTCzALJpGyuR30bpOdTHDv4+OuD9157XUbfnbWCWS8pgglJSElxQp+408ImsJas5+swgscirFOw874yz09ZqXk+IBrvVA6MK9peq5ZNjkoNIsrg+LWEOzgcwrSZjca3is+thJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLVN7cwGxqFBVcr5jwBAWzGJ6d7XaOaSr+mkuRo4CLo=;
 b=CuiZ8US+vk34nQ+z16n8bDZ18sb/YN1TQxex8AE5lKXW51/TgeXadEGFUur8kth2yeqNKG7Q3jBUJV4YIk3B2ZdLu8YNTNDQPZNUoByS8CU0/8NkZzbWSIhwWhDmlsy8cxLM94d8jxAxRe0ffytFeUEnzkzabtobEU/wykUXP7xT1D1xS3E3X3uNoNThQ9HMDFsc/6Rf7AzEwPGtk3ca34f3v2SOfA3Va+QgGr8QYBmLzuJyrJS0CIuYX6OUxHmnc9f6LUHtrEjOdyVjD7JRqIznwa3HBPpCD2EGgpLo5EWdQ9LqFMbtY2jeVtwwQSUi2pI76XrDM7+hKoP+fAbeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLVN7cwGxqFBVcr5jwBAWzGJ6d7XaOaSr+mkuRo4CLo=;
 b=UTz6foYNEO7GcBtMteHV3alXPuqkz4ium+O9TKVtTecs6FskvZz6zOer4Da50dSjgyZAX0IAkSk+Tw8SNR66UuhDNstX3ZYNdP2wPaXslmAzi3V2QK54E8zrQ9wpe2txwgoX6ZfZn6DA2ONbamfkB2q6IJ5pnYWI4Q4W3R9Lg90=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Topic: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Index: AQHYM7LH1RgXNeZAgkCaPnspMShcz6y3BLWAgBlhsIA=
Date: Fri, 25 Mar 2022 16:39:30 +0000
Message-ID: <f2be5a63-837a-204e-ba5e-5ecb48c9caad@citrix.com>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
 <c5b13e54-8868-3d30-70ee-1d1daa082ec6@suse.com>
In-Reply-To: <c5b13e54-8868-3d30-70ee-1d1daa082ec6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcef691c-c7a8-45aa-762a-08da0e7e08cf
x-ms-traffictypediagnostic: BYAPR03MB3942:EE_
x-microsoft-antispam-prvs: <BYAPR03MB39427D7A36BDF5982E334D1FBA1A9@BYAPR03MB3942.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BW0/hLukQiP1QBlqyKnHEhG6tjiuOzZUzcGsJDCc2Loloht5F4q2JSfRAxMYYStsMFENMkXV9tV0jznYTTfrKk37tHVTo3hPUTu7fyWlx+T53CLpVDaFZNKRn6XEONK9/Gr4MI7adoeKNBRiaO1SOpT4MUyfS0Mj6Mwxdnx5/htAK91zpIkOhx68WIlFDgPeLh0k3B9lrKaJ76L8fFX0qSLGCLO143Wl83v5iAcPvo2Rf9gKxuQV7113qE84JFrtFe/nejHUeu9tseogNeNf2o3n0NYc7LZaOAb3HIfeAct/o12fpzpYUAk4QD6yLNcEyFcJ5RsDqssMA8/q0mIIzuz9998liV7Z5OvM71tr38SjxELVBdL+Tvmxo7yoeMm6UpB5d48DFgdlFrMgFWX8udjnB1Vaj92LdUirvteXdqwT95Zfsk5uinzXjfKtG9AHo87ppMRGEqq/K7xMu9DUB60e0mZDeM+c2Lm37cnxUEMLhHkI1NMrPLn0tHNIO21CtL0T7ZdVetbQdd1/mmzeaqK1g9wjQ36e/WG1AX3OIQU6XUKm1/SbH0hcTU5OZmxYs0SUKaBru40lJtY8r1KCJlKJio2pd/LwQ02Ro4R0b53Cd5n92JcILMYvtkW8mFOAxWa4gLhxllIRlsqgSUuxGvOtPr0lzhTAXmThMeYIrYNhtj3wASFNC1e1TPbd09FJWC3/RODDSObSSPN+JhJYXbiVr5TicWktEpbkkNwGGxftrdfkd7H70cqDbG1MPjPBVAi5npzhP0NuFxFaqCT21sp6s1v625VmDniJeKXQD5Q0q1UXhm+E44S+mJt36tIZdKqfteDWDVZ6rAZIuZQX3ztcVUB+ZOq7IWtVcqdKq6wc+iYk1PjX9rmx1E4SqZ71pFjtQXNYii+MLe5LUY7WAw2gT6w1RcZ2lqJmETNlpuWK+Qh4VA14slUtGgjFaoRr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(122000001)(64756008)(66476007)(66556008)(6916009)(66446008)(31696002)(36756003)(4326008)(6486002)(55236004)(8676002)(186003)(76116006)(6512007)(71200400001)(91956017)(53546011)(6506007)(316002)(86362001)(83380400001)(2616005)(26005)(54906003)(2906002)(38100700002)(508600001)(5660300002)(31686004)(4744005)(8936002)(38070700005)(82960400001)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzI1cEg4SW1QdWIzd01uUzFFS3hSVFdGVWovL1BxMk9jc2JtcHlsQmRUMEc4?=
 =?utf-8?B?Z05mNkNSem04SVNneVRVd0diREUxWFB4bnlNOWpGaWU4elQzN1hMKzVHMi8v?=
 =?utf-8?B?UlFNMUNMa2tnWDBHUDMzMGNYVHJwTzErZWw1TEdWTXA1UzkyZmdEcXpKeVMw?=
 =?utf-8?B?SmRSUHZnZnpadFVMMmNpNEZGZXJ2R3BsMjk1UWk5Z1ZzTy9Pbm5uRGFpNE9H?=
 =?utf-8?B?cVUxTDZVY1l2VUVDeE1qdXJaSTFqOFdOUDlQOXFTZ1p5NGN6WDByZ2tSV1di?=
 =?utf-8?B?TEd1OUwwd3RnS2M5YU84VjUyLzVxQkpQaTQ3MWFpVm1MWWZidEEyMzFXV2Jo?=
 =?utf-8?B?WjhJZVI2SThwYmEwSndYMzVidGFtd1VtcTBKbHJjM25lcHpDeUdyOEgrbHZU?=
 =?utf-8?B?Y25KR1NHL0hJT05nT0hHWjA4dHVVTHY3ZXMzRXFaVWlwdkFJbGhnSGNNWmgx?=
 =?utf-8?B?Q1AzMC9lYklWTFI1b3dzT1VHSVN5dllkcFRvcUNMdmxDSkNENHRzS0puYVIz?=
 =?utf-8?B?UTVwL3pjTmwyWHRybzFJNytMdU03ZWMwOGl0ZExzcGdMZnlNSGlxNUl0RFhN?=
 =?utf-8?B?ajE0c2kvZFpGQjZrQXg2T2FicDFTM0lLbDVHQzZPcEZKa0NXMGJNT0pKdDVT?=
 =?utf-8?B?ZDhwUjZHTVlLUE5TcUpXOXVPTklMTzY2bk90NGFzM0h6MnhVSFM1aUFMRTBU?=
 =?utf-8?B?b3JyeVBSSDVpdDJxSjAwTmg0TzNwVUlteVFMT1hzNU90YTltUlozT0VZRTc1?=
 =?utf-8?B?US9lcWtqS2RwaytDa1BHTHRCR25keUQ0NUhFaVA1SWdMcjh6QTFHbGNEOGNn?=
 =?utf-8?B?WnAzUi8xUnY0VzlOVkNDOUhHckllRzhpVmR6U1VHWHFwWHgzWkFzYlhCK2E5?=
 =?utf-8?B?U3FpUHJPU0lqYUtiY3d6SXRQTXFoNlQxMCt6Nmp6cUZNRU9jMTJnZUdnTmVw?=
 =?utf-8?B?ZzZQMHNZc2s5YW0wcmsvVGNtSG9XMGtnL25jTFBjZWlpWDVtWUYvT3NEME8w?=
 =?utf-8?B?T3Q4Z2hmQm9yRlJSVks4T1YzWHRuczNaZUlXcnJNOStxeFMyRFo2dXBCWE5v?=
 =?utf-8?B?MFJOSmpxenhNbFBETEhOdytoV0ZhRmNzSE1sTG1Yalo5QmNlam9SRDJMZDNo?=
 =?utf-8?B?UU5Odmdla2lPbUpoUjBwcG93NzBvanNkZVUzbXdSNHNHamV3bDZKSm5MeGZE?=
 =?utf-8?B?WmhxZFB1N2pVWWJNNW04VDlEUjhqNERPY2VMcEdqemlMWlg2WVZuNUhydXBr?=
 =?utf-8?B?Z1hNRUlTb0gybjFCNlRNdTRXQ0F0azM5NGxmRUxlZ29sYlJOMlNCY04yYlFt?=
 =?utf-8?B?MGUrNVRKdllTaVFVbVRFTTNubWNaZThiY3V5aG1ybmRMclhUYkV2MG9UdnBk?=
 =?utf-8?B?cVIyZm5wQjJJcDhteElpNlpKVkRIYUJUc3lqVTlTYUxvY1RCanRtQXppYmEx?=
 =?utf-8?B?MXJWYlczTHJHaW9hSEc0ZWNrRWRKK21HNWFxeWtZR1NVT1dCVGJwTU1Nc0RS?=
 =?utf-8?B?SUtpYnZOYzZhMVFTUUcxblhkenR4MU9ZNXU2aWEzTzgvZkduQnNWNThiTW9Z?=
 =?utf-8?B?dTZPSTZQVDhUZ1UwOUpsT3JONmU1MmZVcU5UZ0FxZCtqd1ZlN1RiWmlnd1Mw?=
 =?utf-8?B?blJ1UjhzRjB3UTdJOG9VZ1dHQTRVYUZTTmxnWCs5bUZVeHg4MnlucmFhTHoy?=
 =?utf-8?B?SStIQnlUNmZ6S0tRRGxIVFpwUjNZZ1lHOVI5KzVkTFBuc2Z3MkpPRnhBbE9W?=
 =?utf-8?B?dDJVY0czRjN1Wm9Ub2RqSktMR0tlOFhCaFNMclBVNkJQMVZJc0tVSkpONUEw?=
 =?utf-8?B?R3VFbWMxdVpDYUM0S291dnJ5eG5GZ2FJa09oM2Z6Mzd0MkVaWmFZY1JTVUlQ?=
 =?utf-8?B?NlNPTEgvWFJwRlVoOGQ2RTZPWjE3dXNKQmhxV21Gamt0c1NPSzhtekthVmNn?=
 =?utf-8?Q?1jnQOt+Fv7wRm1ieDwr4UyrSxM6Nfc86?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74E9B1C9AA43F14489E1F87290C54EFE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcef691c-c7a8-45aa-762a-08da0e7e08cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 16:39:30.1891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62JV48ALmUgrOoAu+0MWbhpPy13fJRNo/05lORYwzrqFFM7lxpj//jzenfDeVry132ZTG7CryTl6bSWGtJ/octgcllf8kq2iw1mgrVBlhqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxMzowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjAzLjIwMjIg
MTM6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+ICsr
KyBiL0NIQU5HRUxPRy5tZA0KPj4gQEAgLTYsNiArNiwxMiBAQCBUaGUgZm9ybWF0IGlzIGJhc2Vk
IG9uIFtLZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAu
MC8pDQo+PiAgDQo+PiAgIyMgW3Vuc3RhYmxlIFVOUkVMRUFTRURdKGh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1zdGFnaW5nKSAtIFRCRA0KPj4g
IA0KPj4gKyMjIyBBZGRlZA0KPj4gKyAtIF9fcm9fYWZ0ZXJfaW5pdCBzdXBwb3J0IG9uIHg4Niwg
Zm9yIG1hcmtpbmcgZGF0YSBhcyBpbW11dGFibGUgYWZ0ZXIgYm9vdC4NCj4gSSdtIG5vdCBzdXJl
IHNvbWV0aGluZyBsaWtlIHRoaXMgKGJlaW5nIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCkgYmVs
b25ncw0KPiBoZXJlLg0KDQpIYXZpbmcgdGhpbmdzIGltbXV0YWJsZSBhZnRlciBib290IGlzIG5v
dCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuwqAgSXQNCmlzIGFuIGltcG9ydGFudCBzZWN1cml0
eSBoYXJkZW5pbmcgcHJvcGVydHksIGFuZCBkZXNlcnZlcyB0byBiZSBoZXJlLg0KDQp+QW5kcmV3
DQo=

