Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF152BDA3
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332316.555997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrL8n-0007qE-8P; Wed, 18 May 2022 14:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332316.555997; Wed, 18 May 2022 14:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrL8n-0007nI-4a; Wed, 18 May 2022 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 332316;
 Wed, 18 May 2022 14:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3vY=V2=citrix.com=prvs=130e47117=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nrL8l-0007nC-3I
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:59:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e84fcdb-d6bb-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 16:59:05 +0200 (CEST)
Received: from mail-dm3nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 10:58:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN2PR03MB2192.namprd03.prod.outlook.com (2603:10b6:804:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 18 May
 2022 14:58:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 14:58:57 +0000
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
X-Inumbo-ID: 0e84fcdb-d6bb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652885945;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/5EjpVdkv4Mmk/jN9FkWjoyrXIV6N4Q24toLkeKh6DQ=;
  b=Lk3ZpbL9alHC+8+xUFbbgYpJgqyvRYfYDu1aRwfXU4mJr+YI06/uDc0O
   rfVHzPGJQ6Li4Qr1die+G/HTyDhbfIDC4R94xJ1MzxTd2NFMle4mXYepK
   EKddBtt3D3mj+U9SSLV0zvO4Vcfds62UFrIvjFipsOstF07c1AtRl0StO
   E=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 74109291
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LBljYqgn1lF3AbqvDrBWKka9X161HhEKZh0ujC45NGQN5FlHY01je
 htvWGjXb/aOazSmKtF1OorloUlUvsPVndZrSgBopC49FXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSEgY6fUweM2aB9jMg5GN/BN2bXXeHfq5KR/z2WeG5ft69NHKRlseKE9oaNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIEegGlYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVrujCCll0ouFTrGNHbR+OJStxlok23i
 Vn8pHXgXREbbuXKnFJp9Vrp3IcjhxjTWo0IE6aj3uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHKKtxETWt1UEsUh9RqAjKHT5m6k6nMsSzdAbJkqsZQwTDlyi
 VuRxYu1W3poraGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9UDSW517YRY36piG
IronPort-HdrOrdr: A9a23:RlE9LKOmRyjZqMBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.91,235,1647316800"; 
   d="scan'208";a="74109291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRbTQIVxUh5HlBoFn6Q/F4JNYlta3TSIYBhMamGdTyZ4cwPWZhzgUARlWFOczsTmFNBISf5z6aE7pMjSNGe/QOPeUIXrzCRjdoQjC14Qh5faP1QsUeqXBTqjxUxvNqSPDNQBqkjyOcCM1TH761IhfbuZnN4Oek1VOGiYMSEljD+3qSosuh6eaPZwJ9q4NQvgZD8FPv4mKJpNrbW7qHzjCakTDB6pk7nPDr0CzOYg5DLBQu9eMo628MmGNVZwVzGzQTWL4kJXEsq8HkfPxJI/5hcEsy/b0sLPS61Y8tHeV2q0o5keyHFh2llZg+6vVJu42KvoPmOB6KsV6zCeuJ6yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5EjpVdkv4Mmk/jN9FkWjoyrXIV6N4Q24toLkeKh6DQ=;
 b=DjGsXFwCuLBo3DUIoZqkuycW26WcOh+b/pZL0UYEr5fiXUrKjY6joUAIQeEkgdZmD3iOP7aY6fzJG6bwqA4hFnq8PYuZ4lhzObnqLhCCjiDl0BLuplUt+TqDYJJi+sRoFdsJlG/YjyUHJyPAho4gvmGzpq0mkGtCMMNlNCS/aeDgAKro7sg36ZpT1z7CIqFJ1YJt1ZIwrLX0zgKZMIqcDFzqfqLGVhKF09pDUdalnqF3oLxMxCZgicMaib0wLbmNTtf+3eijCwQZmjdUs4H4tX9TzFJnvHJKk/yrHN5ET0K9h1xJ5pGyHpytiO7CtaLhl6zi8+5v7nrdGmB9BDFqAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5EjpVdkv4Mmk/jN9FkWjoyrXIV6N4Q24toLkeKh6DQ=;
 b=tMX7XfdBfKuFe+YkR72mztGEFjPMOvWMqDv+hyRYxQKv9k2R3bXPtKFzxTFbhkoIEbNPC+V1qkdAwqyzWR11ul9Sayv3PeN5r1Nghiz8KyHe68C2G8HFi8PfFk1T5pgWWsK6qt65Q5UrwjBgzeoQQ+J40WiEOAjp0ZHDgf9KcME=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH] xen/cpupool: limit number of cpupools
Thread-Topic: [PATCH] xen/cpupool: limit number of cpupools
Thread-Index: AQHYasXCvgLbjuumrUuXxuSY9QgvcK0kugwA
Date: Wed, 18 May 2022 14:58:56 +0000
Message-ID: <66d823eb-cc2d-4c05-ac41-27e3a0af53bc@citrix.com>
References: <20220518144410.6806-1-jgross@suse.com>
In-Reply-To: <20220518144410.6806-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f0f8712-e92d-4998-1a2d-08da38deef1f
x-ms-traffictypediagnostic: SN2PR03MB2192:EE_
x-microsoft-antispam-prvs:
 <SN2PR03MB21929846851B2F8E80B15267BAD19@SN2PR03MB2192.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eXVTDrj/tjC1XmSn1DcN6Ni1T9rfreks9dlr0/uQHyhFh9iM1vbqBWJMXenvV6hme8CewsaVhcz7CwzJCt8BMbpS5rJPVoJh47M6Yh4km8iHw5GB2k9FPXEEbQGDl8Y/mopbBzEfvWHFvm78zhSnlgs4tzyAnR9aKkemAD8gKI4bPC7K4Op6+fQifgQoc0ME532Vs66Svtq1ICuNbC4u9ifOd8rQXpkLxznE8c7xmc4Lf1ed4SUd7kejXDf/jGCanxEvPOqCZsmBsKusuBdx/wFfNpGyOGbvRsd3zALQLa6Qur7ULTcC1RlXsJFMsIyudf+3/Ruh4wvsMZ1LYkgrZBKgazX7pY39P1SqT3429Hwu49mToMr5rZXf6T2sKPRnPWhDAZjfUspGR/dmHIcCyc/s9TFZD+i0ewCV2/5j9GZ8FtCXEf5Z1Ap7E2exdM9Zmiie8F62WlaP9Rhy1MMyf45reFC47gGq/xvuwX1BnzbDgFL+HkOUANYonDz/jEJZpsxSWPpH76fU9SbWT/O9DELagXHchB5JxWdX1L77gH5F20uSms6zmofGU+JpnXhSPujZFpCcJQAzuDs/ATkJx/V2ZsxKpobTNIIbgaJv1jVshq8QdxB/ZaG26+HfaVfDCJl3R2fxyDHo4PKyLlGNIBgjfyjCjNOFn6UWTa2JRqk/JwpvGAFlUhHoiiTKOfJkATyjW4jd5CmjyY2dBjCXvLDQKp4+Bi9GnaPtujz3vFlaKrGl1d5k8G2kt4uBxZPE09cuSTjgrHBTokPa2gK8Jg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(82960400001)(6512007)(508600001)(86362001)(5660300002)(122000001)(6486002)(38070700005)(38100700002)(107886003)(26005)(36756003)(54906003)(31686004)(4744005)(71200400001)(186003)(110136005)(316002)(76116006)(8676002)(4326008)(66446008)(66946007)(55236004)(53546011)(6506007)(64756008)(2616005)(2906002)(31696002)(66556008)(66476007)(91956017)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFZGYUJGWXdlckJYQ0dnY2FuS0JjTy9Pei9ITFQvdGxqWFBvRitpK2l1M1pw?=
 =?utf-8?B?ZnNwV1RwZURJNktJZ1AxcnBacXpNellFbE96eXJlVGRZcWxzWDgrc0UxU0Ja?=
 =?utf-8?B?YlkwV2tjZGsweE1LWEloQmh1ckdMTVIxeExoVkdOZUY2V0kwaEhFSFVMNmdN?=
 =?utf-8?B?S2Z6MGlKbGtmbHdsYXlzZkdwYlF0RUdPMFlMaFFQa20wb2Q0OVBSMS9tLzMv?=
 =?utf-8?B?ZG9KRGhlVU9xVVU4bVhHV0lzTHIrREVPNzBYY2pVdHZIVm1EalQ3MW90YnNO?=
 =?utf-8?B?Mm5kWVpYL0JxTnRYU1UwckNWNkQyUFVUaEhJb2xOL2ExMFhGa3NmMW1tNjNS?=
 =?utf-8?B?amNmOGg2U3lIUGU2Snc0ZnBvU3VHcEU1Y0JqRDAyMmpOWUpuL2FtZUVkcjE1?=
 =?utf-8?B?MS84QzV1bVcyU1FLbS9xMVVBL1dXWWJCNnltZDlMalpHWDhYQVh5OUl6emI4?=
 =?utf-8?B?VEo1R1NaQXlIU3I3YU1OTlZ5Y3FJTjVXbGdxcnZzeFZmc1psYjNuejJWV1BE?=
 =?utf-8?B?QUI3dUh5OUM1YVVaOEdXSzZhcUx2ZWFoMFhoaUZkamU1TFl1T1QxSnFoR0sx?=
 =?utf-8?B?c2MvV1VvRDJvelZ3dTRyUzA4c3hBc1gyWkZlaUZ4RU1wRUNpL1JaSXVEcjdm?=
 =?utf-8?B?OEs4Y3Q0TGN1eHhQWC8vMVJoTXEzQ1EwcnpOZTNtbmdnSDA3YzBGK2JGcGdu?=
 =?utf-8?B?VDRmNTBOSEFEOXhEbkpONzZnRnY0clorb0piMS9aZVc2akxNZkJiQVVvTTlG?=
 =?utf-8?B?S3RUWEc3U3NpcGtGdXZCY2NUL0JqOVYvckw5MHZzcVl3VktpeldVdEJvbzlm?=
 =?utf-8?B?UkR3TE8vWE1zaVBtYnQ5MTdySVE2Z2VGaHN0VUNhTHUwWFJJa0NsdFVHSkNZ?=
 =?utf-8?B?YjUxRzdWb01SRXBqSUx3cVNTeitBaEliTHptYkxjbkZDZDdqZ0YrbE5ld01L?=
 =?utf-8?B?S0ZMbTE4MURKV0drL1ZZWm1rdlhnRTkva3JTZ0Y1eVZ6eklIbUZLRmNVdU1x?=
 =?utf-8?B?WHByMkt3TlQ5YU5kZkQ3bktaY1MvYnEvaXFLTUI1ZHAxRXNIajlqY0Z6ODdM?=
 =?utf-8?B?MDR3dEp1Qm1Ib2dhVDZ4TDk4d1JDazBnZTllRUFCcUIyNTE3LytrTExSbjEx?=
 =?utf-8?B?SXlVaE1rZlQ4Vk9MRmE2d0JrakxtSXFvMzJxU1QvRWZCcXI1Z0hsdmdyTUp4?=
 =?utf-8?B?RTNJM1RNVXN4WGk1S3ZCZjFDcHorVkx1R1EyYUdLZnhtVWlabndmaWdsOGdm?=
 =?utf-8?B?ZXV5OERpZkFDS0hKT25JSzlqZ29XYUpnaVozcU43N3VVWVQ1L1pCQTh1eDFh?=
 =?utf-8?B?MEE2UUREeGVrRUxsS0JYUDZJSU9JTGlGRUdhZWlselYzZDJzb2t3YVpiWTJM?=
 =?utf-8?B?U0hJY3c5UitOUUNWUVRDUlpaRE5kOENVUk1GYTZIYVJYV3dVdmxaYW5zUW9K?=
 =?utf-8?B?NUtSZVVRT0NOY2NNOHRnNzM4M0Z2TitGSmprMjJQdDBOcmpTa3lRSDB6UG1F?=
 =?utf-8?B?RU1SMHIzTG9OWGFHNlo3MnhBcGVJaGFQd2RkYnRqdXpxalowRy9KOGtzenFq?=
 =?utf-8?B?Ky9GSHN4MUE1VkZ0TWNDdGdSQWtDeEpXTGpJVVFYay9CaU5iQkZKRDdKeHA0?=
 =?utf-8?B?VEZJb2RJWEtyV3ZwTFNveDVJOXdlR1F2Zm0xOWlaSDNWS2xPWXoyeFpiRTVR?=
 =?utf-8?B?K0ZhbFpNaWJuQ0NON0UzTUdvK2dKYTZDdzlCcFBIMXJTWHFnelRQVHdIcGxh?=
 =?utf-8?B?ajZ6SjF1Q1pSTDJZQk5mMzFEVzFDWVdKWGVyWWNrZTh5a2NJVXkwbHdjMUk5?=
 =?utf-8?B?YzZaSll1cnhjaEwrMXVqNjN2ZlY1WVQ3VmJ5cHBVblRCeklIaGxwbWJ3QStN?=
 =?utf-8?B?Qm02TTRsRDJuK2NrVWM4TWFadHRXdkQvRGVQbk5NQ1B0UkR1VWpLbGxUQmFW?=
 =?utf-8?B?OGFuUEtRL0UyVVRiU2tpaFdZQmZnTGgvaEp4YWVINjJobDVxNWJ1MEdhanor?=
 =?utf-8?B?ZkRsajdWNW9mSk1lWnFxb2lsaE5tMHJINnR3YWd1TXduVlJaMzlJYUpXYjZQ?=
 =?utf-8?B?TGsrVHVMQmxzeGROOWxrclh5SU03TDlsVVhlbUdzS1pzR3lrdUhBZ2VudGxI?=
 =?utf-8?B?ekcwV1dsYVFTQUROQWx5WTFZSEVhcmRsRmRBdnErV2hNcHZsaUpPZ0lYKzVm?=
 =?utf-8?B?elFqTmMrTW1xNmczcDdndzhlUHZHWWhhNUVlV2M4enpLc0F2QnZZcnJUM0Nl?=
 =?utf-8?B?amJjMVhsRVdJdm9OaUhiVnlveEFUeVpMTmlORVRkQ3JYQUQ2OWF6a2xFa2JM?=
 =?utf-8?B?NW80RjE3TVBseFBMcFBjNUJxTjdqWnc5bHJTNEhXQUF4N3h1RDlJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1425C7E1ACE1AD48BB7C65A6309B3C6F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0f8712-e92d-4998-1a2d-08da38deef1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 14:58:57.1565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rk62WASMZW0G9j+qF70uaGO2M0O13S9GWQ5G2nxszCzLSfejgV+IxbhMKELeBMJFwGjAb6Tzn7GLB+9pjrqphO4fiV5bfkSwki8ZT2h3/Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2192

T24gMTgvMDUvMjAyMiAxNTo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVG9kYXkgdGhlIG51
bWJlciBvZiBjcHVwb29scyBpbiBhIHN5c3RlbSBpcyB1bmxpbWl0ZWQuIFRoaXMgY2FuIGxlYWQg
dG8NCj4gbXVsdGlwbGUgcHJvYmxlbXMgKGUuZy4gZHVwbGljYXRlIGNwdXBvb2wtaWQpLg0KDQpO
b3QgdG8gbWVudGlvbiBzY2FsYWJpbGl0eSBpc3N1ZXMuwqAgU2VhcmNoIGJ5IElEIGlzIE8obiku
DQoNCj4NCj4gTGltaXQgdGhlIG51bWJlciBvZiBjcHVwb29scyB0byB0d2ljZSB0aGUgbnVtYmVy
IG9mIG1heGltdW0gcG9zc2libGUNCj4gY3B1cywgYWxsb3dpbmcgdG8gaGF2ZSBvbmUgY3B1cG9v
bCBwZXIgcGh5c2ljYWwgY3B1IHBsdXMgc29tZSBzcGFyZQ0KPiBjcHVwb29scyBmb3Igc3BlY2lh
bCBtZWFucyAodGhlcmUgYXJlIGFscmVhZHkgZXhpc3RpbmcgdXNlIGNhc2VzIGZvcg0KPiBzdWNo
IHNwYXJlIGNwdXBvb2xzKS4NCg0KUHJvYmFibHkgb25lIG9mIFN1Z2dlc3RlZC1ieS9SZXBvcnRl
ZC1ieS9SZXF1ZXN0ZWQtYnkgOinCoCBEZWFsZXJzIGNob2ljZS4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCk90aGVyd2lzZSwgTEdUTS4NCg0K
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

