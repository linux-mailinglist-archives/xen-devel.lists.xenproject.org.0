Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9465FEFB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472413.732619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk04-00044t-HP; Fri, 06 Jan 2023 10:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472413.732619; Fri, 06 Jan 2023 10:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk04-000437-E3; Fri, 06 Jan 2023 10:31:00 +0000
Received: by outflank-mailman (input) for mailman id 472413;
 Fri, 06 Jan 2023 10:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDk02-0003xJ-MJ
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:30:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32d9d40b-8dad-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 11:30:56 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 05:30:50 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 10:30:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 10:30:48 +0000
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
X-Inumbo-ID: 32d9d40b-8dad-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673001056;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rXUw/uc30/WNZGuy9EcIKoULDRRv8AEzspJUmBKxztE=;
  b=LuAtUQMx9rG5F/OpBowChq8ca1mtIUBuvBXTqLX0F+vN6ha2CSyp8B7S
   WQLrBsUZEXc+KBkCt95aYfbjiyDFZIuuKAiSHM37o3R09MVd5VtQ7ytOi
   w1hTngPCorqtWGi42bupqYzLp1sds0m099+IAq5yhHNgnfzWtEKsoKGzJ
   M=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 90403247
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rBzbTKskuu5UpgUpCNI0ddfP5OfnVLVfMUV32f8akzHdYApBsoF/q
 tZmKWvQMvbYYGXwftpybY+x8hlTsZaDmIcyHVFl/yozF3sU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEDEEUUuimcaM3rOwR7dumuAcEc/BBdZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzgqqYx2gHMroAVICVRRFyAsdubsXX9ZtRuC
 xM+q3A/jKdnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdFjD5x
 TSXpyEWnbQNitUK0a799lfC6xqnr4LFSQMd7QzNUmWoqAh+YeaYi5eA7FHa6bNMKdifR1zY5
 XwcwZHBtqYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74Gu9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:L+UR3a9Qw7jKL3tI1NBuk+DlI+orL9Y04lQ7vn1ZYhZeG/bo8P
 xG+8526faUslkssRQb8uxoV5PvfZqxz/9ICOsqTNSftXjd2FdARbsKheGO/9SKIVydygcy79
 YFT4FOTPH2EFhmnYLbzWCDYrAdKQC8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,304,1665460800"; 
   d="scan'208";a="90403247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr1jw6yrjfFBf+xSNrxjPuT+BBWEE91c9/80LgY2sCkfDwp/3A4MpUvjPfrIXdnqQiw8b2J6xVVqlZH6hU8Om9IZmr8fNYiN/ZKzTFRV3cBnVpDCJ9xIYwlV65N6DcR9B+WOMAD8j71VL29vEQxPeNp/c4wjMG9/eEB/RWM3Mty9aixfvUDRvrd+CZqz2gwKPML+YczXCzW/Xu+gOov6OoxoxZb/CvpaabL1zC73vy7MxBE30WzclNNsasKaILCnBOnnysGENAniOSYrMxsLjkmPVgd3Ym8rqzKKOEoIddYsU0WCLTxgt63vAQZZQ8lPtzK3npXeHVO4FntyvMBEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXUw/uc30/WNZGuy9EcIKoULDRRv8AEzspJUmBKxztE=;
 b=LV+Zw8acpp9ka4Ctrsu3e7RLg2BCt7wDlHNvKzifEjXwHtFQ+cah7Nt1szJ6Y4z0cJuAARFrPEX9HsRE7U8AyJnvvbvu38Tl46wUwuGgtd5ZLtWs9C5pGzBmHRiy4/jU4RSUhRdypMuX1BPz1st0YQyvdKjP/h/J+VrmNWAc1pUtAmN/gR8MIe+tpQrsK7PQCugyy463aQAvfP1do+S0bwdumytvB5YtkAj91tMXuT7Zs9tb/k4n0jjd+FjVIIK0Okw75o0yz68Cg0It2co7ohCUoO2G9Pbry2MYIC2p+9VU9xE7NaCRXIPRoCiHB0dLKhvN6RchCx1J34tQ1w04Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXUw/uc30/WNZGuy9EcIKoULDRRv8AEzspJUmBKxztE=;
 b=v2vjaPtuZ1eOILbcPir4UdLx+7kuWS5ixM9+u7vuKqUyb8hqU0yq5XuozjLCbWuJmexSAckfTRbquVNjKZEmbwnswcT2lF+iKsQoPWPbRct+JzBLPKNNtoIzFQyBVnc1RPhWzPP/8XC7oo4+G2HkWDZPaKMezmVnlEaBtRoi+OI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: temporarily disable CONFIG_COVERAGE for
 RISC-V randconfig jobs
Thread-Topic: [PATCH] automation: temporarily disable CONFIG_COVERAGE for
 RISC-V randconfig jobs
Thread-Index: AQHZIbmTfeWmiVKwmkCDRKG76wzwDK6RMG4A
Date: Fri, 6 Jan 2023 10:30:48 +0000
Message-ID: <5c03fcbf-d08a-5d0a-d217-c0f4fbdeb133@citrix.com>
References:
 <5f47cd290a5f173655d7dace7f61384e1f32c8c1.1673000881.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <5f47cd290a5f173655d7dace7f61384e1f32c8c1.1673000881.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6778:EE_
x-ms-office365-filtering-correlation-id: 79d96588-837d-4481-7eef-08daefd113e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8Thc07je6C/RbJ7y5HLZDTCg8l/nFkzMTo2vR5xaG4gYG3yQvEf2QQm2UNMeCB4EAe8ijZRPXR1QzH0GTcgYdm2MS4/4SkTKuwzMv5jayRMPbs9T8oEN+0zPhLn7RAkwe5hsqQMVHCB7YpQtE6pjw0tLDS7QMlpDYJbqeXdBGM2eBw/nYCxlt1yHWOaRyvJVVkWZ9eCq/WxrPS7svvNC/y0aTiby9P9wKUI5iKrIhKmQ5rkpDWXDxOAFHqz+4Q7dDyiGtxG+BEySrOrAT/WIPXnwdTn27fojhTFKnejHkbq6rKmny043eNM42O3otokLivSatog119kM0KtSPOFQqlc8lZgJ/wHKtsAAIx3f/GkyspSVnctCQRaYV2AHFYBtxdquRwkILswqO+OUyWCp3Fm2obgeVJH1n09fZLrba6vpONr+2yiInA8rCnWuzNMpwcluVFiD17YhTdJr2Sg3krXaWrqzKvgflBzjiq05Bq6TNWxgdHnntQMg8shFwAz/iOFwhzR/Avfh4WxgFrTGKawYW8juoaIZbsyW/hR03PO7g2FI/Yo5+/poi6lPlU54qOQJwYTfyH453ZjPkCsisCHuRdqKk8LXZRd7TWw9dUm5liMe/HgrmVMj4YH1sTlp1Obr23Y8wOLMM1U1B/U+ZvktHWcZ04iT4ExHulwPX856mms0y10ohcKRAsFJJTPK00DSr+zjM7UZ6WsdQj8gXrrSatozbt8ST201+UUzr9jsxKhH5wokuRkm/CvrTx8gFgyb8tvhXs7Kvum9SRaCyQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199015)(2616005)(186003)(26005)(53546011)(6512007)(82960400001)(38100700002)(31696002)(86362001)(4744005)(122000001)(36756003)(38070700005)(31686004)(316002)(4326008)(8936002)(66946007)(64756008)(5660300002)(8676002)(91956017)(76116006)(66476007)(478600001)(66556008)(66446008)(6506007)(41300700001)(110136005)(54906003)(6486002)(71200400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1AwaVRJckw0aERUZGRNMnQzVHlBSWRxTjBldFJmU0ZrTWFzcG1kUW1YYkRN?=
 =?utf-8?B?dVEyT2M5TE9yVyt4M2h4WUVVTUl2eG5VODcxYnluY0pGc2pVV2V6ZnhsazhZ?=
 =?utf-8?B?VnVhV0lhRHN5cFYyM0RuakJHU0FUNWhKblhCRlo2WkFsOWxjb1BhM0Jzb1Ez?=
 =?utf-8?B?cDFCVlowSGVlOG9mSzZCZ3crUXlqRURqQXNhNHJaWENDK3B0NDlNSkpTUnFE?=
 =?utf-8?B?YWZXYnBIclB1bE9odVVvWE5Pb0tFbldseTZ3TjdoUmM2bVVIOWN4MTAzU2pC?=
 =?utf-8?B?MmtDazhpYlFnRlpOd3BPcW1wUjh1MkIxZGh0dmk4Qlp0ZldZL3ZBcU1rVmNo?=
 =?utf-8?B?TkZ4MGo2VFlUV0EwSWlSTmg0OTJ3QnNRV1ZuZXhJV1hPZEw2TEVmdWd4anhK?=
 =?utf-8?B?dlNOaWhIYVZFNy9HMzU4dGlsSXFrTjRiNGdvRHllRXVpK1RFOWpUZk0vSTBq?=
 =?utf-8?B?QnU1STRvM3c0UllIUzgwSFNXcXdaTGYzeVNvY3RDN1ZReW1XMEZ4d0ExdGtO?=
 =?utf-8?B?T082a1hzTm9SNVVOeTVPRGhWdE5LdlZXMG53UjJ0UnhWWDV5TEhRTnBGZWpG?=
 =?utf-8?B?VHFlbUxKU0Y4SGxGTy9OSjdPVTV6TVY5UDhHSXpiQ0h6aWtheFNycTdzREhl?=
 =?utf-8?B?eGtqdWR6MUwxK3JHVHpLdGFNaklZbjdkc3lEZkorQldoeHZQTGNYbXF6aWpH?=
 =?utf-8?B?UmFHVzNuYnB2aGRnYlcxTkh5cHlVS0wwbXV1b0hRbXo5OTdQQXR3MlJWQm4r?=
 =?utf-8?B?V0xLNXI2cnc2TWR2YVNlRDBoZm9nYk8vcVoxcFdjdllxMVo3dDVKZVJ5N05s?=
 =?utf-8?B?bmIwbUZURFJoS09LM2kzTDVxTXNhYll1eDI1SkI1R2wvTFdrQWdSVU5FN0d4?=
 =?utf-8?B?amFaclhnVnRaakNuTnBoZVEzVzJOL0J1QytjU2wwRWJLMGRWNWo5Vlc1UVdn?=
 =?utf-8?B?L0RZWmhEOTV1SThSaHlacldzSW4yczYvSU9lNVBIQVh1VGlPQXNmd2F1R2dh?=
 =?utf-8?B?Um9TSlhuVXovcC83VWVyVS8zUDlFaUhKVXlmMGVYcEJ0SU5Ec05ha0lvMTUz?=
 =?utf-8?B?dlBSSXMzbk12bUxyaE5pa1kycURvVUNWak11ZTltcjkrWXdycElyTkNPRjNE?=
 =?utf-8?B?Y1FuNXBlQTEzL2diWHpVR2E0QjllOWt5S1lrWjNqaEJYTnhPbWlwZDdoYVl5?=
 =?utf-8?B?Qm1LdHJndWR3akkzK01mWXNvR3p0SnFURUp1WVd4RGtKR0dyeXEvdXhUSnM0?=
 =?utf-8?B?aVlhSkpFb1BsWll6c2FkVHBLWXZ4Sk5IQWY0eDdCc250azF4KzVZSTYwcXBm?=
 =?utf-8?B?cVQ5dlVGdVlYL2lNWkpVSklDRVhHR1ZqUCswcHMwMnlRZCs1c2pFRzAvYzdh?=
 =?utf-8?B?bU5GN212c1V1ZUhualJTcVZNUVRNbzhpTHg4MVlYcndldFovWk9jbVh0TnVs?=
 =?utf-8?B?cmVrbDhheEFkeFpDajZoN2RwNmtCbEFrd0NabE5KWUpHOXB1enNIWU0xSXp4?=
 =?utf-8?B?TVF0dW8rWWNxckdlenhiYWpwempBZHVBNWZkcGlQVUVjd2RHcjQ1elpLRE1p?=
 =?utf-8?B?RndQVUs1MUxhZkJEaFBod01tT2tHM1NjRmFDMEsybFN4NDB0NWRKbUMwczJE?=
 =?utf-8?B?ZkJ0M0FNS21KeGcvZzRNQlFJNjJaNUlNc0FhVmc5UXFvVGR1cXlJTi9menV1?=
 =?utf-8?B?UWh4RllNTU9ZTHE5cWFPdGNKNEVROXo5VDJNckVLQ3lrdFJsalpUMHlJKzlX?=
 =?utf-8?B?amsrTUQ3MW00TXY5R0tmM255MEtwb2tSQVY3MFE2NTZTbXVyNW1zS2Ixdzcx?=
 =?utf-8?B?YklvRHRLaWR6K2QrNWRiU3V1azhzc1I3Y2hoT0tacVdpZDMrb1VrWTJSS3dV?=
 =?utf-8?B?QVlDNkpTMkgrRTZhSFBPSiszVnhkdUNJWXYxS3lzRERwclVkU01HcVpWeVg1?=
 =?utf-8?B?TS94Yks5Z202OEl3UXQwd3laeGU4bUh0MEpVTlRSSmJtWnVIVGF6akdqdFRO?=
 =?utf-8?B?NStQTGpxMFRndTdRd1FkNXJ1RDFVN2hsdHN2RDVpai8xT25Qejk2TU92R04v?=
 =?utf-8?B?TjY0cTY0eVFWR2xVaVpWUnNpSVhuVFlFV3QzSmFpaUVPYndtcGkwQjFWRk80?=
 =?utf-8?B?WW4yYUd4MzNDZzFOTisyMURNNjRiamlRWnJNSGhWUlJoakFVTFQ2dU9aYUMv?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E45605D93C7A547BF138F56FC0FE356@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hPGcfu6MHrGkHVLPUt82U8hgAKNhDfHJorm64O8cMoH8AN2RsVrOJk3h9Rmq+eJerI5h5+Fvp4OEWb/1oKqN4LtrMEk1+Z99SOfgGfqjH3+kPlwBHN+L2lQ7YFur8ei0a+T29q8fcMJrs2aVeLDvmewD+CtCLTsiB195+2H9JEhNB19m5ttIgNa3Y106VIo4D70MOL+029poH+HUcvYbHY0eWcpBYoshV/Blf0YflrzYfW9TMhPwdS6MX6o8r1pI7udqlmofIQlDTFVytAliNxAkfCtrZ3jA4MLi+Aoke3/R6BUSQSnOBAjHzoxvweHRjNRufV4oObjFSmNuDjzm8XrFu30ck/VNRUBVDOtvvLu12vSlDTWqBYYp4ZBnGHxr/ZdQAJ6AKpWKYDgbE8WAw6G5J2BTn2uYEjGwt6rCn0Eh1oYPexrLsbHD9lnNfsXed4jsuMDw5KN/3vzQgQNbJCUWp0awDEtMHsrRRmf7S3rV/0AgDD+lKbQ4M+p2n7QiO3LFIEsnWazjAi5zkNH1I/MIsdm/VjZmx7dIcoq+2sTjMpDkGgGndIMB0l2wq+kNIDRIveOJ2sCiMci6KngZZv80z1phnsmSzRACr45J//nchKw7BZ47N8E1FHX/EVUfLOFCwijO+XFLjLa4EQJRfsWSNzfDIsaYnJ+42+O+TE4jYne0IG+xoIns+hAu98DtOygXLYqqqR52Fxd+D+h3SwuDLcl+81YSepdsU6BB1VU4r/N4uaRU7hee2geIDAr9s086wM2I9pcAmx5C2tTSTBfX/sw6vmNFLvAtMX0EgEirKlKzcBLcpLtV6xkZMAGrAgcSRM6lJR4clWxZtY7/LNHQr/fwcEJCn5G6lCTQUeUxCy4JG1x7wqE8R3rj/+qL/dCWgt2QJqccqaF7Z9Xe8g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d96588-837d-4481-7eef-08daefd113e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 10:30:48.7069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOcdNoYJknmUMi8azqM/NmVNSuJRHTfVWVm+M7lpyBdBH14jfMgMAvyEC7xmIMWXZNSC4gjh+HUhHzD3VgYXxQndmzshMiIFh6fOhz8LAf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6778

T24gMDYvMDEvMjAyMyAxMDoyOCBhbSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4gQXMgY29t
bW9uIGlzbid0IGJ1aWx0IGZvciBSSVNDLVYgYXJjaGl0ZWN0dXJlIG5vdywgYWNjb3JkaW5nbHks
DQo+IGNvbW1vbi9jb3ZlcmFnZSAod2hlcmUgX19nY29udl8qIGZ1bmN0aW9uIGFyZSBkZWZpbmVk
KSBpc24ndCBidWlsdCBlaXRoZXINCj4gYnV0IHJhbmRjb25maWcgbWF5IGRlY2lkZSB0byBlbmFi
bGUgQ09ORklHX0NPVkVSQUdFIHdoaWNoIHdpbGwgbGVhZCB0bw0KPiB0aGUgZm9sbG93aW5nIGNv
bXBpbGF0aW9uIGVycm9yOg0KPg0KPiByaXNjdjY0LWxpbnV4LWdudS1sZDogcHJlbGluay5vOiBp
biBmdW5jdGlvbiBgLkwwICc6DQo+IGFyY2gvcmlzY3YvZWFybHlfcHJpbnRrLmM6KC50ZXh0KzB4
MTgpOg0KPiAgICAgdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19nY292X2luaXQnDQo+IHJpc2N2
NjQtbGludXgtZ251LWxkOiBhcmNoL3Jpc2N2L2Vhcmx5X3ByaW50ay5jOigudGV4dCsweDQwKToN
Cj4gICAgIHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZ2Nvdl9leGl0Jw0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCg0K
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

