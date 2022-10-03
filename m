Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD265F2F82
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 13:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414809.659206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJUi-0003k5-Hq; Mon, 03 Oct 2022 11:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414809.659206; Mon, 03 Oct 2022 11:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJUi-0003hj-Ek; Mon, 03 Oct 2022 11:20:20 +0000
Received: by outflank-mailman (input) for mailman id 414809;
 Mon, 03 Oct 2022 11:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjbh=2E=citrix.com=prvs=268c0e076=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofJUh-0003hd-2y
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 11:20:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5af99fa1-430d-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 13:20:17 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 07:20:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6347.namprd03.prod.outlook.com (2603:10b6:303:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 3 Oct
 2022 11:20:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Mon, 3 Oct 2022
 11:20:06 +0000
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
X-Inumbo-ID: 5af99fa1-430d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664796017;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZElAJ2dOaE3bi1kjESNtokaqE9uVSLzHW8SawOBAA1k=;
  b=M2vdOc6TWTpCmfPt/afsxl0yQ2AyuNtrclMRkUAGmhtcNfVhvxq38Mlo
   8EjAbQ6mkQAFclxp4lSr96UVfRMM/Qz2q4wcWDR/VHvhKpUhiqTItZqTU
   NAA+6zCl8Et/knSGsLJZIWf+XsZ8VqOimfs1o2GgUS5SR6EMRF9+mkxSa
   k=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 81491051
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KWNELqC5UCWS/BVW//Piw5YqxClBgxIJ4kV8jS/XYbTApDIj0zEGm
 GQWWmmGbvmCNGD9KN9wPdm/pEIBvJ+EytNrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk25Kyp4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kaHrQz8PZpGV1gq
 +whMRU2TByxjruPlefTpulE3qzPLeHNFaZG4jRF8mucCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAF7gvN/MLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toivw17aXwHqTtIQ6FoK11tR6vlKqn1c5IycuV3ibotOrlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRHsqCRSH+b3qeZq3W1Iyd9BU8PYzUVCzQM5dbLqZs2yBnIS75LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzqUlVSYw7wTTG2e6tAVwYdf9Y5TysACCq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gJiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:3hAjNaPFxoKIucBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTNYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,365,1654574400"; 
   d="scan'208";a="81491051"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxqA51IIl0cIHF1VG6H89F8YFYF4D1inYXYdTUtp2Rg42JldkAdCPO+yMjWuO8/AWTLX03tnPE/uyOQlw33AY1/xibjA7p9Nlkfp+8G9IYhOwWr1UFVIC1pudVdY8//h+bQZFSBGEbwkPeGH9YuBFGd8lk+npkXm4gLqnC5Lz0nJwTBxnggLNbGuu06YxVPvy5DuN3yl3Wc56sV+cEoLvyxKaMTIHJaArXmOwfLKPclQht868gshAOs2r3JbcPwLuD0zZHJNoaJfOnQut898p4Bqf4SQpCrwQLVhfGyXGyoWvulbyeFbCr+2vUgf7sduPkQl/r3TCqpNdghnKbcfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZElAJ2dOaE3bi1kjESNtokaqE9uVSLzHW8SawOBAA1k=;
 b=RZ1Wk1agYlvkt9qxuLjoz1y4DuaFBIBvEgNwGPxgGMtFl7XbPPxt1cj9PDYvhjjdkXYTIsVR92OB054kSwyvVaHgpE36onroEm6HPbgR+BX0KgzBNP8+DFEb3krtoP1xA41/q2yAT1YN31y7I3cXvZAsc3TO2L5nM4qdiFFy9g6yX+UO3Hfns2sDeZWoVwO4PhakzCKIviwqGiQmEkVeoN5TEY/L+XPmR3B3XgtvhyiQ52Rjb9sgezQvV07VQvBt6Uc6U9YKmPbSOYU5aX7Nie1AJgXgDs1dkFCcXR4/7Vhq5Emi1UFafh7SuNAROXEyVeOmy5QuDOUjy7JR1x8zaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZElAJ2dOaE3bi1kjESNtokaqE9uVSLzHW8SawOBAA1k=;
 b=fHpgAYwe9IiQJ3EwWB5eb1iChM5wGvf6NCCbyBVO1jXlQbU0XfkBEyvLgDNLPf8a4/UxkueMfMb6okkPSMjbkiZWWh4NvZ4rkXf8yFXQqvtOMoSuaN0RVe2vQOhQBwsdp1XILgDMB5VDcgd5GEwYQNOOsIRFGjOrBWDW8HBbgmk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHY0oiAaGzY0Q9w4UWHsGMrupWMzq32MXQAgAZdp4A=
Date: Mon, 3 Oct 2022 11:20:06 +0000
Message-ID: <764f281d-fd97-7413-02d9-f856c0a5771b@citrix.com>
References: <20220927154708.15787-1-andrew.cooper3@citrix.com>
 <77d1bd6f-fce6-bcd2-96f1-a672aedaa7f6@suse.com>
In-Reply-To: <77d1bd6f-fce6-bcd2-96f1-a672aedaa7f6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6347:EE_
x-ms-office365-filtering-correlation-id: df4f8632-3b2d-40aa-623a-08daa531396a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DKwtF3EY2LodUUAh9wR0InmL8Ft3c1cjqJxMl/U3Ea3FBtiI1N9UlxaorniKS5H+iJHhbv0JcTcDFNkjb0nn/wc3ogh9tQyd5WwTqHOlzJVgR+JDsRfbuAl6wXWXca90Jf0Dxbq/zvFLRF+E16X6zQTdZ7/hnZJ3HYxAUCx7AgizUvdMwRv+jno3gTV9aY5jCMl7qH8gxXNnqVhG8m8Pwim68E38IkC+ZWsKw+DR0pVFwMi34b7J1FWXN5PtH0ZtjFNin1NwV9Q0AquXJ6ZYDbXU/97o0Xr7OounVsn3nbj2/0ZWxnLsMQMfQ8CYsbY4/tuHfKOWTgp9qKPCAcwIa/m3BCu68OFAw/48ifHYUYrNAUo4/sQ9fMFFpJFqPXbGvG6OG6L+aWdNDT8cqccEsLiC2cn/rpOpnfcFeghbIMwUBtSmQGC8xjkQ2uV2TisQ9QHYWJ0mjSCXncVIPQIk0Z3qEmMvhdh3ws5Bhs4159GHzc72Ai69UM5THrROOzNL6jPHa57GHGRjJN57Qs10UwWrnKrbvXEHhBowkKKGUgMlATFUR+E5rYLCZXbMvS3hJSVNb9HviR4b/3ZuW2gk8c84JbcqPhNVHtIqZhXVxhAN/r2TVUWgSt5K2Y940681ZY/9c0FBixTpWTrFiCZDcpb66SnvpJKShhrFkVjcyFc+LtDXngUwME2W+3WNloL8l9P+URpWNmf9SyrQXPIybkeoXMhRKXHvC+OcsuR9ipRlotLgzxezJOyGgT6pevl9VvxZ0sMVZnzilUl0i6LwErT/ZAKb7ausnPdXjITOtLARnlC3j9BMzxr3n5MJKM9vAUwrBckLaogxKuNvGm9+Mw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(316002)(66446008)(66476007)(4326008)(5660300002)(64756008)(31696002)(6486002)(71200400001)(66556008)(478600001)(8936002)(2616005)(36756003)(91956017)(82960400001)(76116006)(26005)(53546011)(66946007)(122000001)(83380400001)(54906003)(8676002)(41300700001)(6506007)(6916009)(38100700002)(186003)(86362001)(38070700005)(6512007)(31686004)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFo1ZjJXSXB5SXc2SUt1R1laaXFZNXV4Nm5RYkdxZ3RvTjVvNE42cGNrM1Nm?=
 =?utf-8?B?SFppL0dDSHAveGVvWEtJeEtBZDBRNVJSa0tPQVQwZVBEQmNVSWFOOHJaOUpn?=
 =?utf-8?B?QWxCTklCLzhENzhkTDgxWmJaTW84WVo3aHdVQlNJczBnalplTVgyOG51RnpS?=
 =?utf-8?B?cTJ3WkpYUEk2M3pEN2p5bDZOaEZZU0F4MGorZDQ4cFpiaVNsMENyQkJNUXBl?=
 =?utf-8?B?TlB6SStuSm9uQ1hMMUdJcjlXVjVnaVQ5dkIzVENmR1lKS282QWdVTkZBKzZ3?=
 =?utf-8?B?MVZsb3NBOTZWSmprZWg1aHhoN0lyaTlOUkNXalNrWU00U2V5Q3c3bW5KNCt5?=
 =?utf-8?B?TTJmZW1pc3grZUdGV1k4RFR3bTR5WnNSeXJWRENXakVueEpOTW5TdzdxZEVv?=
 =?utf-8?B?bUNKcTM2MHNoaTVsRk10VzB3VE1TbW9jbDlMVzdtMEE0dmx4NC8zTmlRczFX?=
 =?utf-8?B?akRnS2RXRmpvd01TS2JRbUQ3T09hOCtHdjAza1Ivd09yMzdqQlc1R0ZOY2Vo?=
 =?utf-8?B?RVRrM0RibDJ2YjBPaE5MOHFtQVB6Y3ltUzlaYjFCQnp3WURiR0RHWEhseVdh?=
 =?utf-8?B?bEtTQk90ZDNENXlROW5TbVpYaXdZWEw2MlhxSVYrNi94Tkd3Nk04VWQ5ZTdS?=
 =?utf-8?B?VXd3UDluREszV3JHUFFKd09yVlBXaWFmMklEM1FJMHZaZS9wcGZGUXlsaUEx?=
 =?utf-8?B?NEVjVTNlcHFyVlNKTDBZMndEV05mYTgyWDJpOS9rcFZvejhCN0t5a0hNUHJI?=
 =?utf-8?B?aENvbEdjYVMxWUFxWE5WQnZTZGpkak5KNHdXYmxZbFAxQzljNUJqdHI0aXU5?=
 =?utf-8?B?M1hENHRiT3VNMzFTV2g3Y1BVSDFWVitNQytFVXVISnphQXJ4ZnU0allib1NU?=
 =?utf-8?B?bUY2Tmk3MUVYSU8vYndMR1Aza0RaMytHMXlKUTArd25XOGlKcUNnR3BFeFN4?=
 =?utf-8?B?WFdqbFpTTERqa01aWlVUVWxManZIYi9DM3BxdFBWNnZxeGxnODh3UjVJc1cz?=
 =?utf-8?B?QzljQVgrYmFEYmRsbEZPbWlNRVV5YVhrNUllN1BoWnczYVNqRXBXZytORUFJ?=
 =?utf-8?B?cVUzRktIaStWOEo1NHlkN2lZYmc0MVlIR0k3enlJZGdOOXFRcFlrWDlOa2JB?=
 =?utf-8?B?VTh5YU0yRzcyVUZ0QjVaYVJwdGczdzRJTDdHV3ZYaFpvc09EVURQeUp3QXgz?=
 =?utf-8?B?WmpwNWg4bEhVSnk0M0JsUHNLOVQxaDc0bFhKWDhFTzNEeSsybHdDbXM0dUZx?=
 =?utf-8?B?Y3IyRWsxYXdSUFFJRE5kUHpTRy9BQVVNUmowYUpQWTFZaDUwb21QYUhJOFlM?=
 =?utf-8?B?S2RwL1MwcHVJK2V3VHdEK1hjQ0ZOcnptYS9nc1Fyd0RvbTBmZ3JpWjUwS2Fm?=
 =?utf-8?B?RThkUzBPWFAxeTB1US9PMExGU2FmUjAzcWpGYkh1TVp2ZmNuUlowNmJCSTJT?=
 =?utf-8?B?YytNRG9kc3B2Ly92Rk9sTTBmVDdZNkhBVU9wL0xkYmUzUkcwcExMenFrc0dq?=
 =?utf-8?B?SG1ZUHFzK0tSV1hqMVY2dUJwVUtYY09DenpJclFidHZYYStWcGJlMjZKR1du?=
 =?utf-8?B?VEx0RjBJM3F3SXhYTDlPQ2lwUUN4R3YyajFUUDVOVnBpb0ZhVnZxb253S0U5?=
 =?utf-8?B?NUdiY0sxd245V1c3MStnellwWWRDZzYrQ3dtTWtqcXFHWnNjMUVMMDgvNFNH?=
 =?utf-8?B?dVlKUCt5M1doQXJkcjFsY0pjemtMZEpBWlVmWHNpNkNOd3ZvbFEvQmx2N1l6?=
 =?utf-8?B?cndPWnk3dCtpb3J4Z29RNG4yR01hQktRclY2R2tNMTR1ZHlHak00cVYwdHZ2?=
 =?utf-8?B?SzlLdzFQbWxKWHZaSTNSOGF0a0tRQ01zdlNiM2F1YXpSbHJkMEp5L2dNTGZx?=
 =?utf-8?B?NDdXR2YxSGx6RmNUWjAxMVZGeFdyVlpHMlZJdHdDYUFIS3VGYXhHbjNQYXpz?=
 =?utf-8?B?dmw0Zy9NSXpyazJKaHNGYWZ0ZVpTZDVBejEzdCtWbGRSMEkyeENka056T01Y?=
 =?utf-8?B?V3FkWlo5dFpwOXByWHdPNXliU3ZmK1lHSTdieVdLTzNxYjVhTjcwMmVxUnBE?=
 =?utf-8?B?cFJQbmp0VWdQa0prVXlQMnRVV1FVVjNQa1RkZVJseE5QUlhVRks3cGl0MFlu?=
 =?utf-8?Q?zq1fDnNt/FZtiVnWgQ+rdbpX8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70DB8E9DE8A893449C0B87F3876D0FA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4f8632-3b2d-40aa-623a-08daa531396a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 11:20:06.1287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoOhytpF4w4UT4Y3EZU4pGkk2oETAnt8k85jexZmVgj8TLCkSqef4+HaFj/++tS3ideofyyKe89Pvs17VCrscEUErmuPmSBJx7NI7TGjnbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6347

T24gMjkvMDkvMjAyMiAxMTowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjIg
MTc6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIGJyZWFrcyBhbGwgQ2xhbmcgYnVp
bGRzLCBhcyBkZW1vc3RyYXRlZCBieSBHaXRsYWIgQ0kuDQo+Pg0KPj4gQ29udHJhcnkgdG8gdGhl
IGRlc2NyaXB0aW9uIGluIGVjZDZiOTc1OTkxOSwgLW5vLXBpZSBpcyBub3QgZXZlbiBhbiBvcHRp
b24NCj4+IHBhc3NlZCB0byB0aGUgbGlua2VyLiAgR0NDJ3MgYWN0dWFsIGJlaGF2aW91ciBpcyB0
byBpbmhpYml0IHRoZSBwYXNzaW5nIG9mDQo+PiAtcGllIHRvIHRoZSBsaW5rZXIsIGFzIHdlbGwg
YXMgc2VsZWN0aW5nIGRpZmZlcmVudCBjcjAgYXJ0ZWZhY3RzIHRvIGJlIGxpbmtlZC4NCj4+DQo+
PiBFTUJFRERFRF9FWFRSQV9DRkxBR1MgaXMgbm90IHVzZWQgZm9yICQoQ0MpLWRvaW5nLWxpbmtp
bmcsIGFuZCBub3QgbGlhYmxlIHRvDQo+PiBnYWluIHN1Y2ggYSB1c2VjYXNlLg0KPiBTaW5jZSBp
dCB3YXMgbGFyZ2VseSB1bmF2b2lkYWJsZSBmb3IgbWUgdG8gbm90aWNlIHRoaXMgd2hpbGUgcHV0
dGluZw0KPiB0b2dldGhlciB0aGUgdHdvIFhURiBwYXRjaGVzIGp1c3Qgc2VudCAtIGlzbid0IHRo
ZSBjdXJyZW50IHdheSBvZiB1c2luZw0KPiAtbm8tcGllIHRoZXJlIGJvZ3VzIHRoZW4gYXMgd2Vs
bD8NCg0KSG1tLCBpdCBpcyBub3cuwqAgSW4gdGhlIHBhc3QsIFhURiBkaWQgdXNlICQoQ0MpIGZv
ciBsaW5raW5nLCBidXQgdGhhdCBpcw0Kbm90IHRoZSBjYXNlIG5vdy7CoCBJJ2xsIGRyb3AgaXQu
DQoNCn5BbmRyZXcNCg==

