Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062784D1AC1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287019.486787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRazV-0006BC-Ax; Tue, 08 Mar 2022 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287019.486787; Tue, 08 Mar 2022 14:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRazV-00068o-7t; Tue, 08 Mar 2022 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 287019;
 Tue, 08 Mar 2022 14:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRazS-00068d-Va
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:39:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801225a0-9eed-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:39:05 +0100 (CET)
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
X-Inumbo-ID: 801225a0-9eed-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646750345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OF7bA9OK9cexKqJFMgvhty+hNFt6bBzfp59jrkPuOMo=;
  b=RKwMYhaq00gOejuj35ix3l9h+1CISZoY3mBCIGnzpjn3XzbRrqz3PJX2
   vpkp91RKc08884Jl1F4EjV+6ZL6eis5MNyLZ0W252vMzKNwymTRZFeiGQ
   k07mxP7ZtzYN1Bcjc8IAyTdxVwus1wM+TajSansMqMMpct/U+B6/ZwpoD
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65708776
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OFzvKK8xHDJJtFJ9I2pXDrUDsX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TBLD2qAbPaMazSme94ia4Tk8UNQ6JKGyYM2QQdoqi48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnabqUh4oB5SdosIUcRBhHhpPZ5VP1qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZdGMWowM0qojxtnAlNGFpQaxdaUm1L4XmdI8mKkm6oL7D2GpOB2+Oe0a4eEEjCQfu1ZmUuSq
 2bu9mHwEBYcctCSoRKH73ati+nnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAx80qxR9W7QBy8o1aDpBcXX9cWGOo/gDxh0YKNvVzfXDJdCGccNpp276faWADGy
 HezxcjwBAVW4YezQFCUz7qvnGmKMAYKeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsuAZCQ0c0
 BjR8nFg2ux7YdojkvzioAuZ227ESo3hE1Ztjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLhVdF1Kz6zcWNE5vbKJN8N5n9hK0yT/Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kfa+SoS4DamEM4Emjn1NmOmvpnoGiam4hTyFraTRuftnZ
 cfznTiEVx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5netxK9Y7zv4Oyo8lP
 BiVAydl9bY2vlWeQS2iYXF/crL/G5F5qHMwJys3Oli0nXMkZO6SAG03LsNfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:RtbHhK9W4cgDv+RUCp1uk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65708776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3HVZfxfi8LT09oY1KCbLmrmHKp/qqdkbIWcrw2NFM9pl/EjiVSh4W1vrZSYcrEcUl1uT+RdADLAX2FOQQ/IMNG7QY4KuWpjU4elq259Gfiud6Eg362v/tJTC/bx13nGiDhQ1LgeyRERKMhWiYYs3pPAUHBiMI4mmBQd8W6YoHPot1JJhJzrkkUeV02dgh+OWBfQPB4ZV/q9H61i2EA2JP0s5t/pRsiOfm+of0BkEKvK9Gy+0dtNSOKomW8C+J1Rrf0IU5YiQ+syZ6hqXn24v0tVFtSHHHrzTEyRrSEUanqgapFxrtSkBEghcfWt1oS+/K5lW5HuH2/khHZSBQ4z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF7bA9OK9cexKqJFMgvhty+hNFt6bBzfp59jrkPuOMo=;
 b=ReRqBIEg2DDroVr/XCWPuhiJjwqLOTZyWL1AdRVOzXE4P96VFbghugbmLs9Lx3CFexSKdOt9eDSjjNUrehigRUEdIeHMrsqekzs640p7NodQgX+HNJias+6kFid/+uBSX6Y4SKawgt863a2hXHrcK/i2WuAP9/MitFWKxH4oQiNHnLh+3t4ppgCAWMoUZ0bGujvCY+6pCm1Qh9P90Xn7yEOapFNcGSX9GOF8LsJ6dSA5dfHeEBnoNPpPwlD5KFKRn5M5kEd25Mk1RsjPb8ddWFuOil9IRYUPj9vNn3TwU9CcPAqH3pTQmWBH+XN/hHEJ6Gfv13+HsDvq8u9MgiMF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF7bA9OK9cexKqJFMgvhty+hNFt6bBzfp59jrkPuOMo=;
 b=DDbsoyo8UTJ5mxVOscr9wu1OVFPLTz2lYNWVBN2RfdQtwtIq2T60S/EKtfovM0j8A1uOz8FNYE0v/5Rkz5AxamnOAUa7rZpTIvvdBKLUvJa8bF9BNHm1KfdED4KjTXFKK4rJnlZTedQ5lCnvdwCYvRufKN+QTnuuq/yNwPFusqs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "doebel@amazon.de" <doebel@amazon.de>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Topic: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Index: AQHYLkHgSrb/iAL0mEi291/GjB3zE6y1l+sA
Date: Tue, 8 Mar 2022 14:38:47 +0000
Message-ID: <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-5-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f890e089-04fc-47a4-3288-08da01115abc
x-ms-traffictypediagnostic: CY1PR03MB2331:EE_
x-microsoft-antispam-prvs: <CY1PR03MB2331B40105D05E155DF6BB70BA099@CY1PR03MB2331.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: beyy9NDk2s5Sy3jfZVhwnbShaoZqMd2Qg9CcCXKHurLmdvPR766RdKOf1L9ZBO04W8CPp0bPg+/qOqq6vA0wX9uLMXYhqcJxekXKyyXLqQFNiOa1ZcAaF8DVEHCfMHcRFSpfv48X3ZC3cKCFDiW4javyTD05j0zbGWnxIlU1Ks1WoGwjbQlqkan3hUPnolH3N46UMHGeZorY+Ag9Ol5Rn0UAdZNZc1uZNOWdkHYC9bcJWHom2y1nKrfFzKRMXEWRXwLrkO2stZCRDCttCE7s2tpiD2YAgwE9mOL6VPrapEs/PHP/V9Lccej0qxVq8A753/WkztDOw/xRVD4yVvkDHq8Rb7/EWpy1liZGpPZVidDzvOibXmKa740KNsjEyKP9mwtkn/dnB3izOg6aMgQ0dBEhOQTHZgIqBcIn5rmYofgXMcFuvUfRKmPMxCvGyuM7QnvIKgZqH3Eu9HpUak0yuLEGu3dNPXRkD0+5ESTZH1VtTNv16/ka5gAt0gDMC3I4w/nDWzpCPhalgxxXbzbIb1cEt7ZJtzXwG/nTuaBeE0LSFr2863Cu3clQ7uiDOTyIMONFxnxadpk7RRxtrsGbbLl1uT2cOAiJz4oFptn8G31VF/ZEmuKqXqPeX+Q5HoxhR64elm2Yd81YB+ewh3QQHufM+pnx7qeOxeiM9mFj2Sy9R8XpQD/xHjcn6T6MgnAsDMiUWr10mHSFIEPRcJo2LkumiKbvfwdiCIAHeiW1Ip7EGzBffHirdwymMjcSuhKb4k42YVAmkBz33d005McESg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(64756008)(66446008)(316002)(66476007)(86362001)(2906002)(31696002)(8676002)(66946007)(91956017)(66556008)(122000001)(83380400001)(4326008)(31686004)(508600001)(71200400001)(6486002)(186003)(2616005)(8936002)(38070700005)(26005)(54906003)(6506007)(6512007)(38100700002)(82960400001)(110136005)(53546011)(5660300002)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnpZdEdBNllxdENLWUlGMEVtRXpKMElIRmF0SXh3SkFjWi9DQzk0Q1FxdHY1?=
 =?utf-8?B?MlZUVTcyOHdTN29MZjlhaSs5RHc0dHBzbUdlcnNmRUdnMEtWcVgrVVRGaGd3?=
 =?utf-8?B?QVJyT0RSbzRkT1lNWDRwNVNQVkZ2SnlnUEs5KzBQRkk5bDFNOFEvQ2lnZ1N6?=
 =?utf-8?B?cjd5WExISjFCNDJCMDlqTi94cVJHbTdSSENvUU1aQkZoZ05oTlprRTN0QUcx?=
 =?utf-8?B?NlhmaHZoTWtaTU4vazhUZlFCMlNmbStacm1VVVFsT1NGdmp3cGdHTGthK2Y4?=
 =?utf-8?B?ZGJNbE9JakEvYWRwSHZ4dEd3MUVoaGh3OXlHT0xKZmVNSlZLMnZYYzl5NkYy?=
 =?utf-8?B?K1RVNzBUSDJoSkZXZkwxckNXRmdkdU1aeXVZRXV4YnNidFMvQ3E1ODVVODZO?=
 =?utf-8?B?ejNOSnFsbml6SGJhWDFKKzJUdVkvTGUvbzJzYU9xQzFqeVBWT0RiN3h5eGta?=
 =?utf-8?B?ZG5lK3dkdXdxQU9nOVA2NE5DREU1U3NLMlM5WThFSlk2T0NrSFQrMGVUMmY1?=
 =?utf-8?B?azBpQXVRNFZtT3IrTUwzMDNBNU5VOWxTMExCMXpxQlB5cjNLaWt5Y1A3OFZa?=
 =?utf-8?B?SDFIMVA2UEFnZkcwYzQ0YXd2TFlOMmRseFk2MkxzY2l4MWNubWNRZzE4VGh3?=
 =?utf-8?B?MFJCTlZJNE9SUnU3QlpPTHRmU095dnF6NytFOFh4WkU4UmN2cXdFbnB3TjNO?=
 =?utf-8?B?OVVhSmRHSmxEc0NicGJUeHh1QU1oZlBoMjdlUU0xdVE3RXplWWVLL2tDVWV5?=
 =?utf-8?B?Vyt6a21QSDdJenU4RWRuclY5UENiNklaNEUzQjREdTJCU2pTTlNydm1EV0dl?=
 =?utf-8?B?YlJ2ODh5YytPL1pRN285WUZNS0x0MWV3dy9PbTBseTcyeHlxdlE1NjVMTlY3?=
 =?utf-8?B?OElIZ2pQTFgzYUlOYXhGeEcwV3d1aUVJSmtIUjlzR0JoWVpoK2x0aXpPRVpy?=
 =?utf-8?B?b2s0TGt6U29aQUxIZy9VcUJaRk52MHVtSmdlYjY4YTMvb3J3amwyeXI4VXJV?=
 =?utf-8?B?Uk80WUxzREpncGRvbUFVQVB3RXVnWjFSS1pzRmFmVVhwbWpua1RPSUFQNnlQ?=
 =?utf-8?B?WHhYNUpwdllPSTY0alYwcE9Hbjg3OWxwakc1K1FwdGF0am8yU21JUGVSb01Y?=
 =?utf-8?B?bVptZE9OODFvaGFQNXNOUHVzb2lKNHFrTkd4NlRhb0czS1pva2pjOVNlRGsr?=
 =?utf-8?B?TWNIY0Z6WXl1T2haakVJaUtmSm5TbzQwNnI1a0syOFA5VHVLa3l2UDVlWUdW?=
 =?utf-8?B?SkpkaFZkSWg1WUk2clB2a1FFdFhLb0lxc1ZzdGgzTUNWMnZ6YzkxbkI4WVZI?=
 =?utf-8?B?bEdOakJJYlJFcmU4dE13MytyK05rMVY0aFV6bnp5bW9KSlkvNDc1N25kclJu?=
 =?utf-8?B?TTM0d0FIUFhKMXF0cTNHOGRsMWpvUjk3d25zV0pwMFdIdHVIQ3NwaVlHZDg3?=
 =?utf-8?B?Z2FMSTVCMzlIalpOa0xjaG04cmtnK2RVeTYzSi85d0lJckVLYThVZUFNUHEw?=
 =?utf-8?B?U25TWFRERzFVeFFlTCsvZ3Y2WTN4N3BKVit0TkVLdHZuR2lZMFNaMklyQ243?=
 =?utf-8?B?aW1zMWpIRGZwUTBwWXBmMnA4S050elhQREJTMDBXQVo2b2FOdm9naDRrU2dp?=
 =?utf-8?B?cURjRVFWVUllYXJMWjBURVNkellSQUpYQWRwbVJ6eUg5dXFtekRJYVR2Q2sx?=
 =?utf-8?B?Wlh1dkkzWFFML0F2VUhOd3EwR2FoWEFkRUllU0pNUitKbCtaSEszWTQzaTJk?=
 =?utf-8?B?QVlQZGZkSkFKcVpYYU9hZHVEMUJEZ3dmL1ZUVmtzVVRMT3F4NTh0TDQwaVBV?=
 =?utf-8?B?ZURwakV1QzBvRzFsSmRMNDlKUmVkY2VIZVZRb1VLOGJyUVNvTzlGVjhoR1lR?=
 =?utf-8?B?ZjVyVXFDUjFxbnBEd0dXeWdxcDUrMGZJSnMxR0RQSkg0WjRmcTZWN2MzZ08y?=
 =?utf-8?B?dHFLZUMvYVh5a2NWcTNqRE55SG9vR05ycytGV2lOWEZNN0RpQlRISGo1dXhy?=
 =?utf-8?B?RU1YdDk3WGhpaUUwTTNIczI4aEllbmlaSU1ZSzg0dG4xMmIybzI2Z2RSbmxO?=
 =?utf-8?B?MHB1L01MSzVJcFlyQlFSNG4yWXFhRGhoQk1sK1pXSkFGWUV0WGRNUHRLVjJv?=
 =?utf-8?B?UGFielZwRitJeEZDUUdPVzQvNkhkT1M0SDAzNG1QUzF0THZIZy9rYkJrbHFZ?=
 =?utf-8?B?NkJ4V01NMzVsT083TVhaZ1VCdGovaVRuTkk1NmdYUExlNXpWK21FSXhSTzYx?=
 =?utf-8?B?YUZsczBhRm0yUXVUYVU3TzkvZTBnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3BF96ED1F8E0048BA7CDC2C80D70A8D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f890e089-04fc-47a4-3288-08da01115abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:38:47.3295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpJH80K2nhjG3vkXvjFCwLSWCkeZVTo0ay/vxnwn2GvHNbC7RprXkIvwIYAKfDQ6PJ6Vv2NCn08Z72PBMzKkuKP9TSO3qVZzJa9BchhzdvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2331
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxNDoyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEvbGl2ZXBhdGNoLWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxkDQo+IGluZGV4IDM4YTkyYmUuLjY1
NmNkYWMgMTAwNzU1DQo+IC0tLSBhL2xpdmVwYXRjaC1idWlsZA0KPiArKysgYi9saXZlcGF0Y2gt
YnVpbGQNCj4gQEAgLTk4LDE0ICs5OCwyMCBAQCBmdW5jdGlvbiBidWlsZF9zcGVjaWFsKCkNCj4g
IA0KPiAgICAgICMgQnVpbGQgd2l0aCBzcGVjaWFsIEdDQyBmbGFncw0KPiAgICAgIGNkICIke1NS
Q0RJUn0veGVuIiB8fCBkaWUNCj4gLSAgICBzZWQgLWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYy9D
RkxBR1MgKz0gLW5vc3RkaW5jIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zLycg
UnVsZXMubWsNCj4gLSAgICBjcCAtcCBhcmNoL3g4Ni9NYWtlZmlsZSBhcmNoL3g4Ni9NYWtlZmls
ZS5iYWsNCj4gLSAgICBzZWQgLWkgJ3MvLS1zZWN0aW9uLWFsaWdubWVudD0weDIwMDAwMC8tLXNl
Y3Rpb24tYWxpZ25tZW50PTB4MTAwMC8nIGFyY2gveDg2L01ha2VmaWxlDQo+IC0gICAgIyBSZXN0
b3JlIHRpbWVzdGFtcHMgdG8gcHJldmVudCBzcHVyaW91cyByZWJ1aWxkaW5nDQo+IC0gICAgdG91
Y2ggLS1yZWZlcmVuY2U9YXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2VmaWxlDQo+
IC0gICAgbWFrZSAiLWokQ1BVUyIgJFhFTl9ERUJVRyAmPiAiJHtPVVRQVVR9L2J1aWxkXyR7bmFt
ZX1fY29tcGlsZS5sb2ciIHx8IGRpZQ0KPiAtICAgIHNlZCAtaSAncy9DRkxBR1MgKz0gLW5vc3Rk
aW5jIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zL0NGTEFHUyArPSAtbm9zdGRp
bmMvJyBSdWxlcy5taw0KPiAtICAgIG12IC1mIGFyY2gveDg2L01ha2VmaWxlLmJhayBhcmNoL3g4
Ni9NYWtlZmlsZQ0KPiArICAgIGlmIGdyZXAgLXEgJ25vc3RkaW5jJyBSdWxlcy5tazsgdGhlbg0K
PiArICAgICAgICAgIyBTdXBwb3J0IGZvciBvbGQgYnVpbGQgc3lzdGVtLCBhdHRlbXB0IHRvIHNl
dCAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucyBhbmQgcmVidWlsZA0KPiArICAgICAgICBzZWQg
LWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYy9DRkxBR1MgKz0gLW5vc3RkaW5jIC1mZnVuY3Rpb24t
c2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zLycgUnVsZXMubWsNCj4gKyAgICAgICAgY3AgLXAgYXJj
aC94ODYvTWFrZWZpbGUgYXJjaC94ODYvTWFrZWZpbGUuYmFrDQo+ICsgICAgICAgIHNlZCAtaSAn
cy8tLXNlY3Rpb24tYWxpZ25tZW50PTB4MjAwMDAwLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgxMDAw
LycgYXJjaC94ODYvTWFrZWZpbGUNCj4gKyAgICAgICAgIyBSZXN0b3JlIHRpbWVzdGFtcHMgdG8g
cHJldmVudCBzcHVyaW91cyByZWJ1aWxkaW5nDQo+ICsgICAgICAgIHRvdWNoIC0tcmVmZXJlbmNl
PWFyY2gveDg2L01ha2VmaWxlLmJhayBhcmNoL3g4Ni9NYWtlZmlsZQ0KPiArICAgICAgICBtYWtl
ICItaiRDUFVTIiAkWEVOX0RFQlVHICY+ICIke09VVFBVVH0vYnVpbGRfJHtuYW1lfV9jb21waWxl
LmxvZyIgfHwgZGllDQo+ICsgICAgICAgIHNlZCAtaSAncy9DRkxBR1MgKz0gLW5vc3RkaW5jIC1m
ZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zL0NGTEFHUyArPSAtbm9zdGRpbmMvJyBS
dWxlcy5taw0KPiArICAgICAgICBtdiAtZiBhcmNoL3g4Ni9NYWtlZmlsZS5iYWsgYXJjaC94ODYv
TWFrZWZpbGUNCj4gKyAgICBlbHNlDQo+ICsgICAgICAgICMgLWZ7ZnVuY3Rpb24sZGF0YX0tc2Vj
dGlvbnMgc2V0IGJ5IENPTkZJR19MSVZFUEFUQ0gNCj4gKyAgICAgICAgbWFrZSAiLWokQ1BVUyIg
JFhFTl9ERUJVRyAmPiAiJHtPVVRQVVR9L2J1aWxkXyR7bmFtZX1fY29tcGlsZS5sb2ciIHx8IGRp
ZQ0KPiArICAgIGZpDQoNClRoaXMgcmVhbGx5IG91Z2h0IHRvIGJlIHRoZSBvdGhlciB3YXkgYXJv
dW5kLCBieSBzcG90dGluZyB0aGUgdGhpbmcgd2UNCmtub3cgaXMgZ29vZCwgYW5kIHRoZW4gZmFs
bGluZyBiYWNrIHRvIHRoZSBoZXVyaXN0aWNzLsKgIEluIGxpZ2h0IG9mIHRoZQ0KdXBkYXRlcyB0
byB0aGUgWGVuIHNpZGUsIHNvbWV0aGluZyBsaWtlOg0KDQppZiBncmVwIC1xIENDX1NQTElUX1NF
Q1RJT05TIEtjb25maWc7IHRoZW4NCsKgwqDCoCAjIC1me2Z1bmN0aW9uLGRhdGF9LXNlY3Rpb25z
IHNldCBieSBDT05GSUdfTElWRVBBVENIDQrCoMKgwqAgbWFrZSAiLWokQ1BVUyIgJFhFTl9ERUJV
RyAmPiAiJHtPVVRQVVR9L2J1aWxkXyR7bmFtZX1fY29tcGlsZS5sb2ciDQp8fCBkaWUNCmVsc2UN
CsKgwqDCoCAjIFN1cHBvcnQgZm9yIG9sZCBidWlsZCBzeXN0ZW0sIGF0dGVtcHQgdG8gc2V0DQot
ZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucyBhbmQgcmVidWlsZA0KwqDCoMKgIC4uLg0KZmkNCg0K
Pw0KfkFuZHJldw0KDQo=

