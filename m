Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C43633A23
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 11:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447057.702923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxQY8-0000dn-95; Tue, 22 Nov 2022 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447057.702923; Tue, 22 Nov 2022 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxQY8-0000aw-5R; Tue, 22 Nov 2022 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 447057;
 Tue, 22 Nov 2022 10:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxQY5-0000aq-IN
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 10:30:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4545d13-6a50-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 11:30:39 +0100 (CET)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Nov 2022 05:30:29 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5181.namprd03.prod.outlook.com (2603:10b6:208:1e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 10:30:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 10:30:27 +0000
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
X-Inumbo-ID: b4545d13-6a50-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669113039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0tMZ1pECm84EgpELAXlKn2mZIBCJ/rgQbglXsMFEKdI=;
  b=MUOoW51HwoD3wnBj861pSZoTmfDCb0WmlXtNlqaiLT5EoW93F+c2vYVJ
   MR4aadclh2W9XESaR1sloXJyipGsvtYCs9IpfA39lA6OrgqE5z6HGyuPG
   5RAIbOTKCnS1R8BrSs6+wQeZ1pQxItg6ObbsZVOMIu4h2VMt/vsQ+rGCs
   k=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 84376239
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z+GbXa/5MWSdZWUoH3t8DrUDsn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mocXmvXb6mIM2fyKdx+bIm0oUgBu5XTm4NrSAQ9+C88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKoR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/y
 vY1JA0XRSyBpMeskZT8T+ZSg+08eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpjtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5JS+Pira8CbFu7xFJNMg03dH2ArOSJjnGEAPcOE
 2INw397xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JW3Y3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LFae0ipjwBmv2y
 jXT9Cwm3exL04gMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2toji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:TfrEdaxuM/IuYmjkEQ9dKrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpsuIdI2R/xxWyAu+CSEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.96,183,1665460800"; 
   d="scan'208";a="84376239"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE6UkjyurqTXZB+/8aDsSlBpUfBL8csZxF4prpFlgEDMG6zrM7CZHoKEXXsj/UvakwJpK0IE3iREplV+j1SvF/9Khpbp1l0RZXdrw8b0AXAZDvNptCpIQE6c/pBjZ0H+TtgIzObmUP5dTLX22yzYnyWGHtl3YBJMc21hN//lB03H8CBL9ueN4Z9zsFo5LKNgvDr1M7rVUB08zW+/LeGoXdmSTs5MzE7USv62ZYOhXRPAiObb1I+nRR25koSX9SuJTTcEZFcmjP3LHwBxGcbHlrCE16mDT4OOQAC7ksqXM23zNacMrcjezmZycUzzaeS0u+n+zq/d/GfEjnvS09gBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tMZ1pECm84EgpELAXlKn2mZIBCJ/rgQbglXsMFEKdI=;
 b=bgPcu3dnVQvlOlZLyF0hs4P/KOLreCzctLEMUHUL200YGlTh+c0rVHfzIwNODEhNGB1cdGujnen0lUp47D+vyd4uSt+KZYqts48zT4XWWx2fURqnbspS+qTmNV7c9mu7ybibuQjwkKYEi08pk1WP2sNNHgg7k/qZ+S+GrcH62QIGFp8MBBoeeISZJu5Gj3ptdRsKc4FanW026fVSZJw2p7GaplYJspxkThxv/QcI5X1Xv07fEiKCgUeIMMdlnIaFVF9dtEjkokdKWc70tvDUydS8Qj9O/pBLF4W84MJY628VQg51MlqG04uyYT4iEwBInMs8fkKUtrV9RdkAHbCLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tMZ1pECm84EgpELAXlKn2mZIBCJ/rgQbglXsMFEKdI=;
 b=SAOa+z92JtFY05DQUgGWM9iUZax1BhLy5MMLtVIC0BZnleIqwzSfjziqgn3q7x2FcrS5DIlpOqupXMf+tYdKs8IEtYp8rn8AVnlmtEDMX0Gj9nWQRmLzkxsVznqk80ygf45AqVv2N3IGpoMRbfU+4J/8rYlY8Kvwuex0fJZQYHg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Topic: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Index: AQHYM7LH1RgXNeZAgkCaPnspMShcz65MN16AgAAcGwA=
Date: Tue, 22 Nov 2022 10:30:27 +0000
Message-ID: <1977c21c-4c77-e2e5-76ee-0a5d4c0fa977@citrix.com>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
 <22626b14-8047-8fbe-0668-5caeff304640@xen.org>
In-Reply-To: <22626b14-8047-8fbe-0668-5caeff304640@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5181:EE_
x-ms-office365-filtering-correlation-id: d9e1fa72-759d-4426-7403-08dacc74926e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cqOYRBWTJZ/xIodbAar3E5t5YIj9J5uK66nNaXp/oTHr0cL16k+6Or1Y7T2KGbhgzBPJN+gTkAnLGYYzworxXwE+WEWwGkGNseDdtdGPGIaGLBatIrST549UdXG384wDBlTSqZ6CkpvQzKQ2xI7UvBpT50JFk4B4e+VUXNcTlTa0Fotu9YMrMy/M6G5xkSgi/qZ/ezQPQ4CEmOaFvOZ1eOFiHDL3XLWB4YCmURq5I8knL+YgjQalGtkMEhg4QAeoyNoOqSoG9rf1fSspsFYeTwqEWKrrxrcGMq1KZH3qisDK5dWpYR0OeupCpxrjJqWh0TVMG1BTDI8MHEIsrsWLI2x21ZoSSoLJTH3av86J4g6uEHOs82YARucVE23B+rAFNc5uFrm+iFUK90Ew9/UztZvpFAHTndlOPXZ/YOh2FM2I+oYZpm7ReZhzLAldB5TyCmfEMA+YKxzxCuBZNax2Z4FyfzLu3dvV4x8eyj6y/J1ofXZSexSiTAbyUWkF6a4+QtQTk1TUKFQOoe4ti20Q53eSBnvhX9X+Md/AsK8v8DtOo2qMev7TNFfh8htXptAzXUD7td5gsIR3xpqt0IXlNOSRGpQ3N6+THGhJSe4EZ3vNfb6LbReIaNxNTbRM3gjH1vUaFRQLOwrWtgj8rBwE7pnAtr2JjO4U0IS2teEXJbg02mlMZ6Ly/m91fDCkKvUwCHNAr7wqChvfh/cTs+24i1qs7L/xr3pLlhr3uap5nApd3E0BnJYvmgzGR7QzkFa5IfwptBc4iyvfOD+T4x5s/K4cRcXU9aEznL8MgCmiooleDEOVd8/n7MdG5H0ubbcESgiNHU6OGIeB5tI6v6s8cV8WV1HW2lgwBdSJHdegQ12AbPnnEVbRCTUrmIdXjEHV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(2906002)(31686004)(2616005)(76116006)(66946007)(91956017)(53546011)(41300700001)(36756003)(31696002)(86362001)(66556008)(4326008)(66446008)(38070700005)(122000001)(110136005)(6506007)(54906003)(82960400001)(38100700002)(8936002)(6486002)(64756008)(8676002)(4744005)(186003)(66476007)(5660300002)(6512007)(478600001)(316002)(26005)(71200400001)(59356011)(207903002)(219803003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUZreUtXNmxDMFU4b1RZanpud2twUmppd0YzelU5dG5NaVQwOEhxUGM5Ym1j?=
 =?utf-8?B?eHd0OTczUUl6MVk0SVdiaWt1eGNnRW5MWWdGQzY4aDhjc3FUVm1xVE00QkY5?=
 =?utf-8?B?REE3RVY1dEgvdEVxVXg4MVlJM1RnU1RYT2xBdlA2SkNVVml5Q1NZakwycDhK?=
 =?utf-8?B?WDM5V25qS2ljYTd4RktYaVloNTVzSVNhTEc0Y1o4dTdHcFdvSm9wTFJrd0F3?=
 =?utf-8?B?ZW82Um12TE1mNG40OVhBdHNoUzQrUnB6aXhJSGppL0QwTzBYbHZub2R3VlZp?=
 =?utf-8?B?enN2U0JJV3E4S1JMWGJuT3pyWFFaanZIWFZ3VlorVXlaRlN2ODJKdmFJdUdu?=
 =?utf-8?B?NGxIaTJPYmNVZlZiUTR6QmxCRE9PRXcwSmJSYzJuWVVmSGMvQk10YmJydHBG?=
 =?utf-8?B?RlM0a1BYdXR4amZiV2F6K3BwRnIxYlh3RjhmWXh5VTA4VG5YSXJXUFprNlhO?=
 =?utf-8?B?YWpkVnZGU3UrNCtDVmxDTkVFdUx1aVZ1T3lKNXRnQWhZVHViUHZCdzhEYVpa?=
 =?utf-8?B?MnY5KzVJR2JYRHhNZjdGVlFkU0tVMk4xRHl1UW50YTMza2xKMzBTWk95Ly9i?=
 =?utf-8?B?WjRwT1IvZkZ6ajhyMU9hVDMwUmx3cUhtTDJlU1RNM3NidTV0NkRTRVpiUE8x?=
 =?utf-8?B?T21SRjJlOVRUQTRmMmZtVWNYZXRmY2R5S2ZSRTMrenpvRlpzNXhsRmYwMEha?=
 =?utf-8?B?RzUyc0tjMEhIK3FENDVrVDE2YlNaQ1dmeXJWejI4VlJ0MWZGeDJCVHZaczl3?=
 =?utf-8?B?MXQ4RHZrZmQ4dk12T0dkRWZ0ZXVZRWhHWTZ2aUtjcHo1NHdLNnoyekxvZVVy?=
 =?utf-8?B?VVArNEx0ZnQxdndYMnMzN29ycmJzRVhZTWpWeEtWaktUSHA0Z2paa3VBZE10?=
 =?utf-8?B?Ym0zTlRldlF3Q2tMdllva2oyMGJJT1A4MzRHRFpQV1hCNUFVQlhtamJSUzRy?=
 =?utf-8?B?OXc3c2srUnpreENvZ2wrNm1ZSE50cXl4WmlnalRPcHY3MGkxV2F6UVk5dDZj?=
 =?utf-8?B?cFYwTWhXYnIvc1RFa1crb01vWXY5dHRrY1AwUkFHYU1vUEoyTjh6S2xoYUFI?=
 =?utf-8?B?TmEzWG4xaWY1cW1SMzBEcG9XSDcwcnVlZzVWRGtFdkd1cEdYenU1ZDNBdzF4?=
 =?utf-8?B?YWhVY2xvbzFPeXl1eFNGaENLbG9yeEJheDd1bnZFelJQM0JIMThYM2hqTm4y?=
 =?utf-8?B?dzBMOVcxRm9KR1BqRlY4a0tSdVlRQ0lRNzRhUjBmS2dsaCt1MTlvVU1ERkpj?=
 =?utf-8?B?WkcvM0FaK2V1aExuSGNhVTNjaUdNME9mRkl2djRndnpVOVNwNThNSmgySytI?=
 =?utf-8?B?OW9oaWlsQTlha2IzdU5wU1l3K3ZKNnhpQStqOU03L29IVWd6U2ZlWlBiL0VM?=
 =?utf-8?B?Y21UTkFtb2tINUZaSG14NERYWWhLMHQ3Z25qSG5zV2Y1b0ZVUXNqODYvSmFK?=
 =?utf-8?B?SzRnTFQyclJ0WmE1MEZxOWIzdkMyMStRS0E2czVxc3FURTk4QU9Ba0FMMTBm?=
 =?utf-8?B?TlhONzl0Z0dDMVpUZitpRjZxL1EvV01GSzFkQ2YyLytleTFqTkhZM25QSitX?=
 =?utf-8?B?M28xVW5VWFZCTGF3V1dqZWd1aTNmTUwvcjlNZmNVODRIMHZucFFkOFl4TnFu?=
 =?utf-8?B?cytyR2MzZzZ3eHkvT3VtQk9qeCtIMVUyR2liMFBST3BuRnVseXNxWGJLamw1?=
 =?utf-8?B?UXdtaUhmazBzQXROazh2eERPS0tEZHROTVJmeFhvRVhoWk9lR1R1aG1lM1Rl?=
 =?utf-8?B?NWlqdDlwMDJUcTdZZFdpZytxdm5KZUpNcFl5ZGxUR2lra1dRK3V6M2t2T2o4?=
 =?utf-8?B?QVRrQWx1TUxRa1haZFRNSUw0L0pCalVRREZTNFYwZEJBNktZVkFualNIRmhN?=
 =?utf-8?B?MXl6cjFiQWp1dlpVZTlWU1l1V21oU2xRNEFpbWZJZytpYnZtajJLQzVEcktD?=
 =?utf-8?B?cGUvSDRuNlkrZ1FKMm5EOTNWaFA2TXlTVzJ0NTRWUE9UMG93clo1Q0N0dDBn?=
 =?utf-8?B?RFZtM0QySWtLVlM1d2ZDY3ZrMFZRNXROVkJ5QjA4YmVUOWIwU2FqR0tXUkpz?=
 =?utf-8?B?TS9SSm9pL0FDRHZRUlJVWE1EcnI2NGsrSDIwUC8vTEV3UXJOMzhLTDMwM2t1?=
 =?utf-8?Q?Q71lop8RRC0SrZOq2tvtIOqWL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E94762BFF81D514887007B7CDEE4C03D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YxyCxU2gbptoPIcJZPkkM6GGdQDrLW9syxSunf80agdUjLiAY99MRnwTKTqI3WgZ+RaFYcckYxBkGOHUdXqJXTeuDrvplKFGduXEUiwBRjeZzmZya6GsOULS51KP4beZE8X2IjAduHoA0BvOmyBWgPAcuDDkkZ6RktgcEtJIqPA5RIVOxI+HjkilDaMgYgwP0svO/PxymhuZwmujown/YXJU1bokX0UvkO+zt3N8nLtmV+KN0Cqph31RD3uqd9ZTwY3GfjvH6rw+vfvXCSPepjuapuGgITlVemc09kMAAqDeruDa5wbyLp8a+KrW6hrjqOsHTQ4P0aj/iVnsn1X267J2NT8GQ1y2s7qGnctC23emIUaFXlbTMV2A/y68qxrSmy16tF641/gsNXmu2zyaaN4qKZ/0euhOYizxt3+B6IWUhGFe2QNaonIySAmX25dXdH77U6OGldob4zXxUKL+tX7fJMQ9DHNRYtf59XQh2t1298hSiGpji3n56mgnPU2QhpFz9J54fLKrNvzOu3FWbmTkpq6iTFCE75uo0DDpv37PFJuHFia6oY2LfWIAXcqWOq2KcOI0weTwyNA0dG4PpbIMY7A2Vk/2XOvslEDJYfLAGue8x/3B1gbEr4aZ+wUlWXyOFzZ4INRKx8rCNsT5lvcU10zk4vHJGkZojs9PrewifQKjLJO6hWfi9mHM57ZBtoVN3HrqQ1I7pjRy9Fg3fbhJWnFD7v82elasJDKGrD9DBDaBJZG/dEg4pR3LTyzyzwQmGrEoiD0km4ZEVgRgvN92MyRsUMfCtqT2872VqSRNOmFuV9kN8sZMUlAEnlSRiHe4EjQs1HZEE/oAUwoxSxl9FOlhHqG7MhIKPZhnqDM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e1fa72-759d-4426-7403-08dacc74926e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 10:30:27.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCVVgBq/sJlnEhgZiHxx64rPkXzU/DMae+ifPmUJmLcAU/JUgbzVXXLVOptzxvA7tjdc6OvsDTjY/LZbxjTX0GEhSWG0fwTmNv+sVBWG7UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5181

T24gMjIvMTEvMjAyMiAwODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBBbmRyZXcsDQo+
DQo+IE9uIDA5LzAzLzIwMjIgMTI6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0t
DQo+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+DQo+PiAtLS0NCj4+IMKgIENIQU5HRUxPRy5tZCB8IDYgKysrKysrDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0NIQU5HRUxPRy5t
ZCBiL0NIQU5HRUxPRy5tZA0KPj4gaW5kZXggODNkODVmYWQ1YmJjLi41Nzc1MTczODNlYzkgMTAw
NjQ0DQo+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPj4gQEAg
LTYsNiArNiwxMiBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGENCj4+IENoYW5nZWxv
Z10oaHR0cHM6Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0KPj4gwqAgwqAgIyMgW3Vu
c3RhYmxlDQo+PiBVTlJFTEVBU0VEXShodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPXNob3J0bG9nO2g9c3RhZ2luZykNCj4+IC0gVEJEDQo+PiDCoCArIyMjIEFkZGVk
DQo+PiArIC0gX19yb19hZnRlcl9pbml0IHN1cHBvcnQgb24geDg2LCBmb3IgbWFya2luZyBkYXRh
IGFzIGltbXV0YWJsZQ0KPj4gYWZ0ZXIgYm9vdC4NCj4NCj4gVGhpcyBpcyBhbHNvIHN1cHBvcnRl
ZCBieSBBcm0gKHNlZSBjb21taXQgYWNlNDAzMDIyMzU4ICJ4ZW4vYXJtOg0KPiBTdXBwb3J0IHBy
b3Blcmx5IF9fcm9fYWZ0ZXJfaW5pdCBvbiBBcm0iKS4NCg0KWWVzLCBJIGtub3cuwqAgQ2hlY2sg
dGhlIGRhdGUgb24gdGhpcyBlbWFpbC4NCg0KfkFuZHJldw0K

