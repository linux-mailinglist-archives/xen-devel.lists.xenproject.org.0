Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3E644D36
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 21:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455513.712994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2eWJ-00018y-He; Tue, 06 Dec 2022 20:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455513.712994; Tue, 06 Dec 2022 20:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2eWJ-00016Q-Dx; Tue, 06 Dec 2022 20:26:27 +0000
Received: by outflank-mailman (input) for mailman id 455513;
 Tue, 06 Dec 2022 20:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2eWI-00016K-8m
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 20:26:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe65ea2-75a4-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 21:26:24 +0100 (CET)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 15:26:13 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5300.namprd03.prod.outlook.com (2603:10b6:a03:223::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 20:26:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 20:26:11 +0000
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
X-Inumbo-ID: 3fe65ea2-75a4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670358383;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GfBuhpMhHEEvlFTIwfh6wXQGgFcjZmbQ8Jk261YuVYk=;
  b=CECHNlxpTujsOSkx6f0hwfQmCSGAXUTSO6ncBXnecHaTo8wtGSPryLui
   D6sEgfFa8ar3uOV0Dndg2waZvjISZuuURkzhSys2bj7ObbTVm7GBByox1
   tMD5zAeopVdivmlR0FRTf2dKu0omsuN24/dvw5+2LIFQKkAc0JfKlJETM
   k=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 89426590
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PRyUnKAFhXkjrxVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApGkrg2YDm
 2VNWT2DPK2Da2X8f98jboS/pEwP6JOAz4UxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA4ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvfZJIUgRx
 aYjASEjVyq6pKHq7Oz4Rbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDa7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+ewXmlBdNKfFG+3q5v33+2+GATMRgHZ3zjv9P+h0SsW+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWZhTup/8LNVlRsuVuRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:lrgAf6BCwO27/EvlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.96,223,1665460800"; 
   d="scan'208";a="89426590"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axW2UUNXRNzWCXSh49gExk/LU9Du7siNxS+DDZjLojXtxhtWKUbbgyCik30sSABZNTNsZQcBZywgGTz0wkIdLnpO27G2JZbON0eex6JbJZxNSheXmcXzpTJjpPSjj20ayL0PSI7T4d3XT1rZAXk2DFu8V4sHb6jlGgxCzrDGYMFUY0wvkGkLLgXr5F0TW9hMhXF+U6fx7dKpPeYtXkbkCmUaFwukklWQDlcftOTjGlttTqg4kAkbSMHuVk46b6mudvCvii7CltmLsq7hgxOtu6DMGAjudiQUg8vyvwJqv4csQU9c43FcKOI9k9EfvRxBTVLccwhJXgnCnTfExTD3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfBuhpMhHEEvlFTIwfh6wXQGgFcjZmbQ8Jk261YuVYk=;
 b=Ya2fhWwztz9MwJ3LtLdyDgCG1Hsrpc5Ci6hHaiwplle5/zYbMTLDVgle0hGsGgffMZqMCS8IUyUpQbFYJfIA6kx+IhthwoyskqPfVMuKmAGP2ZGTy4ZoVQVrmCI1sDSJnLb20ZvF4AoMNSGzcPkBlrIMhceVlQgGwyvcMd6ekTv3cx/ZOR1Izwpc2zWRUm278yz1mdbOdCYjueAY6f4WIXvjYVNxWU8Z4zv5F0/hJr2gnYqNmX9cpDk0q/9KRWjIKPNE61lZ9fgov4IIGIhuXLZmJx6xOOxg4Ani5NI95Pb6Bpib8y8mYg8dzbDnnVX2Q6EVI7D1g34tklKYbRImYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfBuhpMhHEEvlFTIwfh6wXQGgFcjZmbQ8Jk261YuVYk=;
 b=pCouVteshGpE/Gr3ILQmlFFJwVFdr9ESMg1xPzcE5XZm8eY11SI4lllPqs/e13pGfcnPZyrn1iMCswXCCXkXo78H5VeLw9KolUfgN/cIXomGyu3k9ME83NeTOcbouWW8d1WphgpvUExBFRgyTcALGuYsUanDlf4hJCxUIBudWos=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Thread-Topic: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Thread-Index: AQHZCX9NIrDy49JalkChlMsM+HKSta5hTvUA
Date: Tue, 6 Dec 2022 20:26:11 +0000
Message-ID: <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
In-Reply-To: <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5300:EE_
x-ms-office365-filtering-correlation-id: 82754e19-dfff-4ca5-220c-08dad7c81d63
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MiKFW0fepV7HVaxu1mmn22EVn5xC4J/HRU+mO8vTw2bejYfIHLrMIzJOQQ6nfgFlBMkCvyNoMkx4w6Ri30IGPw5Zz+fsguDH7nuvzWOAh71h5K4hQzYvRVh5r99tGkHsU2sd3sAOfhOSyxT4aKpyDgyn+1zPSBad1GrAYoAaYOhIRjfGjsSEWOwIlvkCc9/VVR+Pdb5M9m5rMNw/ceZFSrUvKT41UfzXWOgUONrnaRroICIqONRzq6Asn6cxXLt8wKC3IcmfZmh3c0RsTpbyQkwyhnjDbcIPorXLeQCttJZvZnpu0If/nq3eauwFm8y9UyHqQqXhbK5JrfKJCmCzH7YOmEIAZcLNYxyf3cjnaOCVwjDqwhxQVlZwnoWx8UnVFjmpM5EPHdCSmuB0PN5SxNg/EFBhoehz7N2dqu87niAdh/Jgv0OXyQIO5iWxgt0PbW1hBtd50G4Q4KhKOQPbiXNZ7VOm73CFO1o6kZ6tyL326GZvOZB3MLVxlY26ByIJneK82LkodAHOJKkMr0pgohmMNdB8jwPqhQ8xJmXAlNGDgpmsinTM+xSrpkx5d+Aa6lan+OnPKWcEfq4Y1qxa0es+hxsLi8L5CV001NG3zQ16zonIOpi3VoIBRvqAOca+i3+d9LCUdoystgaGG36vmTXwIY4ViAZ+BH71SUDi+cdTfzDFwAsa37FkqGA+6Z00OqVqy+MvXZyxnWJFf0QrK1bOiqXAR+d5wQM6JegEcLHWHHhbfZ02gYCt/LzD+z2Yz78qErWITwjUpWWasCSUfw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(36756003)(31686004)(38070700005)(86362001)(31696002)(4326008)(8936002)(91956017)(66446008)(2906002)(66476007)(66946007)(76116006)(41300700001)(66556008)(8676002)(4744005)(64756008)(38100700002)(122000001)(110136005)(316002)(2616005)(82960400001)(6486002)(54906003)(5660300002)(478600001)(186003)(107886003)(6506007)(53546011)(26005)(6512007)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHMzc1RJbnZWV0Y0bWN0YUVDbTdlcTVZelFFWmsxQ21RaEZxWk8wUUxNUk91?=
 =?utf-8?B?S0d6SklFWkN0VjRxT2RYRDRxak5qS0d4TndCV0VCcDNvNlg5MWt1dk8zcUxC?=
 =?utf-8?B?SVdkdHNQOGFnTS9ubld3N2lvUzZRWmM0czJUQVlhTGw2ajl2YUR4UHVsZy9M?=
 =?utf-8?B?d0J5S3doS3BPNVF4NjNRZlh5K0YwZ1RIWXFIdWUzUVIxNkJEUEV3Zk96cEVy?=
 =?utf-8?B?WHhrSlA2M0hWWEpCdFI0b2NYOHo1ckdvSWgrdkFybGRhTEJmejJoUzRlQlMy?=
 =?utf-8?B?RUJKOWpPUXJYZHVuSjhsZXFwKzFERVZrTlZHUloyWGU5ZUIzOS9yeFI2L2p6?=
 =?utf-8?B?aWxrU2ZnclFkcmhwc3NrSWR2KzB5SVdFWmpXREZJLzdOdkprc1JuRGlNaEJj?=
 =?utf-8?B?R3p5emh0SFF0RWt1TmdiWlNCUEcrT3NMTXRnTDBqUlVzUmd5WjdzVE5rS3dU?=
 =?utf-8?B?WXNZai9aMUZIUmdHWnVQTlZDcWo0NEhnMkRJbHZ6UTQ3SEF4N1hyYlkrTG56?=
 =?utf-8?B?aTNKQ3RiR1VzVW9jZ1ZUVEdJdFpxeHo0TEUySDg3RGJZYlM1b1NKanhsOEt4?=
 =?utf-8?B?UmVmaElLMWYybm1HRVJQMHVCUWNzOHJiZlZRY2I1dy93dXpvbEZCSmtObUoz?=
 =?utf-8?B?aEl0QXR2cDJQeHB0dnczZmpaTTUzLzRSbHlCeTBzVmMvZXY3RFhWRnA5dHE5?=
 =?utf-8?B?c3VaQ1RIaVJuVVgrdU9rMitkUjNjMDBtYlR1Mm9YRkFIUE5HYzIyWTFqNEI2?=
 =?utf-8?B?dmN3NWJySjh2OEd0TnVONzVuLzRZS01lK3k0VTFPRGkyZ2dkdmFZaU0rUTFo?=
 =?utf-8?B?RkJhN0RsQ0pONjZOT2Q5bFVEVkNUS243c0VabG45dGVHNndIczdFUGo2QjFN?=
 =?utf-8?B?a0w2Z21aUElFdmtpbGJPVk1GNTUvQ2VvSURLQ2s1ckJwbFBoYXF3MXhmTHhK?=
 =?utf-8?B?OXFneHBmNnFzdExXN2UzYmZPME1LeHFYcFpDUm11ZWJ1QmN0bEFwaHpYRjhB?=
 =?utf-8?B?UmRKK1BnM1hMNkUxVzVMZlIyWWhQZjNkUmZCV1lxK29KQUZzaDJxT3NIcjlm?=
 =?utf-8?B?bFZDUnJQQjdZSVQ5aGFJZmlURDhDTnRudUdmL1BZQStiNUttMGdmZ2RqWDJF?=
 =?utf-8?B?cGhHdkZjaEhBRU9jVWlwd2NlTldVVEtuaE16MEJCUS9lOWZqaFg1MVpXZjlK?=
 =?utf-8?B?TzRLLzE5NmhEbDVGZDA5anFKNXVicUdZMEowZ3QreGRoNjI5VkF0aUlmd2RY?=
 =?utf-8?B?c3NXTWxFUmN2dk9hK25SbE1wcGEyS2hPTkVSSG9xK0xFa3hsYjIvVmxVaXcx?=
 =?utf-8?B?bzRJOStlaEdFRUo5YkNUNHZ3cm0rdDhYVXNySGpTT0VNNUlZQTZGTlltZ0tx?=
 =?utf-8?B?UkJkdEd1cVpZUlU3RG4xTXEva0VvbFFmMWpydzZRN0s5amdpT1hNZ2tTRFF2?=
 =?utf-8?B?aE80azhXR0Uwc3p1S2wwekU1ZFFBMnJaeTVBNTRRUkdzTitobTc0d3lveks4?=
 =?utf-8?B?bi81SkVWd0orRjNuYW1vZVp1SzBmWGJuend6SnNJcmtIdGdXVi9kQVRVVlVR?=
 =?utf-8?B?UjdCMTBLTEduR2d5bWErSnRzcEZhU3dHbEd4T3BEc1kxWEI2NXR4SVVGclhB?=
 =?utf-8?B?YXdHM20zUUJMa0VHdC9oRkgvczhEVHptcWNDRWpudU1vUmNXaFBXa2RZVDk3?=
 =?utf-8?B?ZjVMbnc0Qm10ZERhRlk4T2Fmck9neU9IcXE5TExKQVJpOUFVbjBSYktBVGYv?=
 =?utf-8?B?SGs2ZDlia3FqRml0UkZPWk51WHQxZTdsT0JkU1BYcUNVcGJkNGU2ekp4OERD?=
 =?utf-8?B?ZEpvUEUvNENrZXNaZEhNWWtZWXFxU2xIWlNkekJadXFudHV4VHFmc0N4cXpH?=
 =?utf-8?B?TndpMVNacEtuR29pbmVraDRZYk4wdFdwcGU5VldxaTY1N1hoQlh2OHdlNS9S?=
 =?utf-8?B?VDcxMTBrb2lWT25qM0QvYVhoSVl3WmxjTjVrT3VtTThzYVVVMVFyUE9kMGI5?=
 =?utf-8?B?aWNVT1hUSnhIT0Ntemswc1lzZWljUVpDcENta0V2L0FnVHNoMVJhOXZkR1A4?=
 =?utf-8?B?VUFxaXFUZWpSbGVnZEZhTzhodmttRHN2UGpqL3ZSVjRVRkNzTlFiV1RvazVx?=
 =?utf-8?Q?s6rvlPUxofI0X0VnSP9TsYSzH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC21465CAEEB934D92DC06758E0F1E84@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yWbP2KZNDQTX0gV+bPUJAwMye1dz9rUrXKBK1E4g+f1Vy0qenKL0jM8zLQr1osAZIqiFNTIvTmR8EwUDRczB5YdXW/+3rIPRZmW38MrtIC23SRqblXr4uRuMFiLY2CrY6drjGEpAr1TGAmoKAvnehmjm3U2YzqthXhcuACKwN597YWRT2wMbTXl1TYgms94qeSU0XHRyHeH2oIofvOqS4IcC/hu4vIZtiSCcXpe/2/44bc/PtmziscDgWNb0BS91jwxDpFbaukx/+j/wVqGQ+eT8gYSBMSfOPo5r9oWoRypqP7zuQk8MdYITvIMsu9Mbe67jSKhhn4vMtoO/GwXEC6QGonzvpAxq59EB/j8tnKwAnOA421mTVtJdvnrv5g3tkRnJdS94SAjg1VlWw69fkeHq0IU/zlN0eN/I5ewLgJtcXfmOqlavnY8mPym9oSq865tC8OS7euwSR9qK9e5HK+t/d1FdXFCIuBxXWJZ2Fg2xgHLmA8d8VxY8ngsUWYRZBwPa0IgthIXipWrilssJt0wLHw5woK0V+AwT8j6nVuwK0MlGSqcFyQPSy7Ey71cOagAFcxZ4wBXjrKV/mjV0XTd1ADuGgp+COYYFo7SyTp8/MgqVtUymQcAw02TW8mnRkRPRuSyRy3Mu8lA7NeIyG0JiDRsDZcZ4BpuCH3dsMCxHLx6l0/194JcXjFP6d5mkZMcRpC2aEW4Z/71b+KQuFsElXW6ISYg3LzTq9CBGYn6Ful4p4wyBfLXdQAODbN5Ks66tl5IJGmSOCjMUNTL1GGcs3h2OBTHATj2mIK6uWmKenBqvf9yBowxlf7hUVhsieuSYR4vOKyWT/PmDZU+aUd8kkrr3pptaGMgLZasOUN9jZMjhuRUutFZDkh+5kz3W
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82754e19-dfff-4ca5-220c-08dad7c81d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 20:26:11.2344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YkuE7awl7Jdrolrcg3PZdAqmNGF5z82vWdsnr+9u3MnDD+7xfE2XYYWl05IaIp9BgBTIZ1cSPVMey3NanP97eHE8hb2HpwqniexTDExoJSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5300

T24gMDYvMTIvMjAyMiAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEdyYW50IHRhYmxlIGNv
ZGUgaXMgdW51c2VkIGluIHNoaW0gbW9kZSwgc28gdGhlcmUncyBubyBwb2ludCBpbg0KPiBidWls
ZGluZyBpdCBpbiB0aGUgZmlyc3QgcGxhY2UgZm9yIHNoaW0tZXhjbHVzaXZlIG1vZGUuDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KbmFjay4N
Cg0KVGhpcyBpcyBib2d1cywgYXMgaXMgZXZlcnkgb3RoZXIgImRlcGVuZHMgb24gIVBWX1NISU1f
RVhDTFVTSVZFIi4NCg0KVGhlIG9ubHkgcmVhc29uIEkgaGF2ZW4ndCByZXZlcnRpbmcgdGhlIG90
aGVycyBzbyBgbWFrZSBhbGx5ZXNjb25maWdgDQpkb2Vzbid0IGRpc2FibGUgQ09ORklHX0hWTSwg
aXMgYmVjYXVzZSBJIGhhdmVuJ3QgaGFkIHRpbWUuwqAgVGhpcyBjaGFuZ2UNCmZ1cnRoZXIgYnJl
YWtzIGFsbHllc2NvbmZpZyBieSBkaXNhYmxpbmcgR1JBTlRfVEFCTEUgdG9vLg0KDQpQVl9TSElN
X0VYQ0xVU0lWRSBpcyBhIHNpbXBsZSBvcHRpb24gZm9yIGEgYml0IG9mIGRlYWQgY29kZQ0KZWxp
bWluYXRpb24uwqAgSXQgaXMgbm90IHZhbGlkIHRvIGJlIHVzZWQgbGlrZSB0aGlzLg0KDQp+QW5k
cmV3DQo=

