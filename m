Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907B49D5DC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 00:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261119.451769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCrI4-0006dE-PF; Wed, 26 Jan 2022 23:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261119.451769; Wed, 26 Jan 2022 23:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCrI4-0006af-L9; Wed, 26 Jan 2022 23:01:24 +0000
Received: by outflank-mailman (input) for mailman id 261119;
 Wed, 26 Jan 2022 23:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCrI3-0006aZ-5V
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 23:01:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deaef45d-7efb-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 00:01:20 +0100 (CET)
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
X-Inumbo-ID: deaef45d-7efb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643238080;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vyIrf5WQuqLKHDNniuuW9zi6d0mYsluPDskZtluFvS4=;
  b=asZUXhGpeQJ/I/r6ljA20nnGW9xemmCrNbwdKzbTptYaH6uXEq9f7is2
   udJ+vxCRiLxiIrYHoIMkAsWy2dFW2yd9CFYgGc5XFV0Dtx8AbQQjT7QFj
   iAPqKgQlAzJTFUdt/Dpk/iZAOw3MgEbKu7NvqiPVCmm02TsxSY3agT6I5
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pASMY2BuTmYKOf+g06nuIod8aJtMytsJbHKPIsPF4hUuETAPBMa0QykhK4OKcBvsPnG7aCQqsw
 xUaaZQBiy9JPveaAb+iqBagMft0FXTPPzBkAy6RnjFuR3bqVsoud3YLoI2+kuHkbxOMNyGQ9Bc
 3hAv6TBSa0CYxgifndEDV6CMzOwqC1W/ENtUPLoZAs05TR1eVwZqtivat+X295/w06d2Kc7VwK
 T6KCkroxldovm4weUNLI2NHE2ce5D3MAQ6zxO5FmlFEeX3qv+7MVq6iVzX494bMY2NmlZHdinp
 w9tXy/960pf0zCwe/H5FmZdD
X-SBRS: 5.2
X-MesageID: 62312889
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k2OyWKqVdNNNbs/iiCgiTVGItR9eBmL1YhIvgKrLsJaIsI4StFCzt
 garIBmGPanfZDD0L40jb4ngphxSupPcx9ZiQAM+rH1gEi4VpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILnW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd+gWEQVAqLlo8VHSyJIN3xjYKtg0qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZBCMGA/PEWojxtnZXY4Kphmp9uTrEbfcxFIpwjSq7dw2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcV5+BDO9pbbyj24XHA/XhocdYEgkuUpEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSKhRqjBNzAJrVkg
 JTis5LPhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bp1dImK3P
 BOO6Vw5CHpv0J2CN/4fj2WZUJxC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hSxT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:Ivp8BamhRCZM8X4zJsqhJAdZl/HpDfOIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEjUOy1HYUL2KirGSggEIeheOudK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHpuQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJTq
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MnTvKQ0TtfgDg76t
 MX44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSITevqb0oIi65fgKo
 WO0bptcoreEVc=
X-IronPort-AV: E=Sophos;i="5.88,319,1635220800"; 
   d="scan'208";a="62312889"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMqjsyICpmme3qIZlMwpd3HKlLjaVREBslIC21Fr4j71kPxrjmN+a3F/IAn8RCYifMX/mBzyivv7DBesSiq8eMClns4HGg+F3CBj4ZUhvLjVBtcd/X6sDhNLzHZN5zC0m84hyFoQJsB1dCwtbjh+pwWm7gYAJ4bM2INRkcRHIvGXTv4lG0/NZ+m/8Q4klO1QVBuxE0L85apd8Fg+Gi8tHxGhL+5H/U8ZgbTKiuVMaPvMh37EAJtwJrmSB4a9hOZUO3bdOZr3C09DP8tScwDMmW2BXvyD1SgjprAclgkGTG1Hu76V92SvteTO+udpKdTQP2BWpC8cPs7gmeD8fe/x1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyIrf5WQuqLKHDNniuuW9zi6d0mYsluPDskZtluFvS4=;
 b=N9ctVI68rExuh9P9D1K3+KHOgHrtwf9WXjlVuPPM3Zepw9aYRDX8/dyYUiiPxUvC86eTOts0UCFLLX2VnTqOjpz6j9vlhi/fLG55eWupiGUlGcGkbJTFPGKCISCi/hm+mv92Bii9u4bjDmInpXRLrspODi5Fb8c+gdWmp6oxlZDoju/81uMx+V42LY4HuiiiY4QOjg9/Lhp+7Ad3k5cFuMdATVsq0JZT1yJgJb2AV9tP66igPozF7MwWOACErR1Kxw/u2hmLgE5R/C2a+yAobce+AiEiyxBcK1LlxbTI+j4gngW+xL9QDSpN5adRvTm/GYyhD848gbg82xSzeQ+hbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyIrf5WQuqLKHDNniuuW9zi6d0mYsluPDskZtluFvS4=;
 b=c2ONZW7hNiL9n9Uqmwb2STjzenD8ny/sk6/FNF+X9h7zi2o4iuDQuttARCb3cNmTQB/+xORwCV9vklWkKWL1LF/qmveNABbl7XTt9z28YlPZPLDcPlLB++PIym6hqp25UbzTnr9QKhkjQH/enY+LmxuiM+p37Jb8T6cb4UUj3kA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/Intel: Sapphire Rapids Xeons also support PPIN
Thread-Topic: [PATCH v2 1/2] x86/Intel: Sapphire Rapids Xeons also support
 PPIN
Thread-Index: AQHYDghfa/pC6q0h6U+J6bRuWTmtTax19SeA
Date: Wed, 26 Jan 2022 23:01:11 +0000
Message-ID: <e9aae44b-1fd1-2952-daa1-fa36e89eeef6@citrix.com>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
 <0a8981c6-b3fe-c805-f45b-b6da5d0aa1af@suse.com>
In-Reply-To: <0a8981c6-b3fe-c805-f45b-b6da5d0aa1af@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5b75445-0286-4742-f5f8-08d9e11fbf18
x-ms-traffictypediagnostic: DM6PR03MB4651:EE_
x-microsoft-antispam-prvs: <DM6PR03MB46510356635E103E1A4A1395BA209@DM6PR03MB4651.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1dGs+ra4wzmGnkdV/WfusfBJh7JiUkEqLZtIHZ2e0pMNt3R/qy3jBV/O1HibTlS8F70q41A3maBhJJNYZD8Y0RjpNZVjlwXXLLamoIbAPWEZ9Dkth+2swRPaNUKRbbnMeACJ7Ew4zVCRnf9rW4anyKX9ilZnAYig+rkCcZXXxy82mjCGJSiJ3X6nPWNFaNJj509P9S18HbCHZ0p2FycgarvvDqoGSRUkCQfv3/jkLs/Wfv/7pg8diNAxdSET3HDMyikBWz0JWWqznaWmhN95x4MxQAJT/69gk72vC2ObBU6Lf8f8Fm7F6p3goq/z8ufr+nLCb2Cy32+JHOW7N0B/swTbxrmdshuUpqAz+V8N6EzH+p6AJ+yN0q3dbwN6+cY9Pi7+IgC02RfsY040H3Q1dMzyfOuM/eERBqqlbdkjEsx6Gh2H7I8FSwT4/mQ6C10F6n+LiP+mCLx9bUY4BXjPju3rTQ7xyG/Lox6ZOY7Gwo4jmA0bCW7EgcH1rLAp1/8nHph1kUSExYy23UyIQ423ENWVnzNAyFAOUlw9IoFWXlxHefNmZLX3YEZoJzrfQKyd92RfludY2AjZUcS+E4QXH9qCy+60mHZQimPuLF3J5BXXP+P2FKrDByFgWVsDAp5+ou4D5K6P7exFImtpMoDxY2WZPlmpt/hOFv0BsvKO4JVjlNrtzRKSmbGWcs6sZ0tpkkBkxdHUeQQOYQ5q1ZQIajQ+a2rZDurDS7Txj8fzinsiRkSCo1edhPJiNu/rji9S80OLjqTdtaJ3FNG2Jm7IyBL7CVHrqCiI9fA1LClKLMMmtsL4yzqWCTFsGmaVtyjZvTFpvya9EOcMFxCHyJzU9FgeIHCtoEYwqvvF2u3Zhc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(82960400001)(71200400001)(66446008)(66556008)(6486002)(83380400001)(66946007)(38070700005)(66476007)(53546011)(64756008)(6506007)(91956017)(122000001)(6512007)(31696002)(5660300002)(107886003)(38100700002)(316002)(36756003)(508600001)(4326008)(26005)(186003)(86362001)(8936002)(8676002)(31686004)(2616005)(76116006)(966005)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlFjS2dVRm1nd2I0ZlNBcmxMbnNEZjQzUG1MWHRCQ2VoVXlqanNkOVFRMlBD?=
 =?utf-8?B?d2xXcWVMc2ZFR0RqVitrdGdwOTJ6bnNEbU1JcmVvSGFPcFBCS2thSzNDME02?=
 =?utf-8?B?M0hXbitrbUpNd0VHTG53OWlWSy9aYXk0OU1mT0YxTVgrQ2hjZDR1RlBsbFJG?=
 =?utf-8?B?L1A1MVJyVklhaUZ2eWtCVHI3WDNJTmN0b2dEZnI4VGsweUFidklOdHpicEJI?=
 =?utf-8?B?cHI4Y1pqdW4xZXNrcU56M0xVOEZLUldIMVBKOWhnTDBuTERQWno5RG50V1Zv?=
 =?utf-8?B?VFhvUkNlWjFJZDUwbTA0eisvL3FnbStYRkJjR1hoL0d0MWZYZnBKTVRkbmE1?=
 =?utf-8?B?ZjhNcXJyNy85TDUxa3p3bGoycEpqdjIyQTZBc3F6UEJOUkw1Z0ZJd3p4NXZS?=
 =?utf-8?B?eW9malB3KzMxbXdDMC9xTDZDMk5VR0xTUE1rY1dsK1hYbEFnQ0JPQllET1cx?=
 =?utf-8?B?ejdPeVQvbWZPMVVlalQ2eGVUS1Rad2prU2VDTERhVFg4OE1JMzMxL2NjMEhv?=
 =?utf-8?B?Mmd1SWFMekZocXE3R0c5M0JPcXlzRFRoa0dGUm03dTc5VDMydyszNEZXUVI3?=
 =?utf-8?B?QXlsM2I2UEprQnhXR1gyZXo4c3ZTbTZFZ0NuUE1xR1k2Tnk0N1Rwck9FaUhm?=
 =?utf-8?B?dFpUKzRoUEFCVnJVaysrUFRiczBoT1E5RzM0ZEhpVitTSlFIZ0ZaT0lkVGdM?=
 =?utf-8?B?dzlPVEtGdTdZQmRGdnZDeTBYaUpYNEZ2alNnN2VCSGJsVEw0Z0JtRHYrbGV6?=
 =?utf-8?B?RU9JTHlKU2dnekd2UjVXREVPb1ZDN3ZNa3BmcSttQ0gvcXBaVEwwbEtaMFU0?=
 =?utf-8?B?RnhRWmFvTWp6UnFGUHdiU1BEQmxVMVJnYjVEdjRUNFdJZFIxU2Y0bnp0Sng5?=
 =?utf-8?B?aHVnSHcvMmF2NnZaK3F1aGw0djhsdyt0TE5KRzEyZ2l4RXlkU3JGVW1VTnNS?=
 =?utf-8?B?eHdHOHlQcXNGRHc4UXFTZ29xanBNMkJGTW1ZT2NKSHd4SHM4NEFEMW1DcXNM?=
 =?utf-8?B?SW1QeXo1MDNHUGRaUk9ydElSNFBXNDNyVE01UFZpVGN3WkNheXE3UFlBSk0r?=
 =?utf-8?B?dDNDclh6VmhYNFIxRGhvbEdBL1NYQ3JBY0l1WFUwUzMvMmNvUDNMblI4a1F2?=
 =?utf-8?B?NUQ0d0lGb1YvQnpIMWNXeUJoYThpaHB5bkpVZ3h3Qmg1WmxjVXZ2elQycUFj?=
 =?utf-8?B?NGN3RVFhYU1CLytMbHYrd1d6QlY3Rmp4dGIyVUFHcFlyaWtYNGpkcGk5MDh4?=
 =?utf-8?B?TzZvU0o3cXNqS1oyVjAzb0lWaXhhU2RIeGxtUTJoUDh6cndHUDcxS3BscEl5?=
 =?utf-8?B?SHNpR01FQytBQ0JIcmUvNEtaNWx0dXViQXRzVVd5UGdaMWZRRUE1UGhOUUEw?=
 =?utf-8?B?MlAzbWNIOXRjUUlGR29nZU9YQ3VTaTR4b25JQ2lUSzdpaC9xUXhwTFBCSkdF?=
 =?utf-8?B?TW15MTJxd3puSzNwWFBXaVNndEFrOXNTS3F3RjlWbkplQU9KOTFjU2VkTnJp?=
 =?utf-8?B?L2FUT1hUaUcwTHNZaTZBZ2JtMXNhMzFHRmluV2laTVhmRE1xU28yYTZZbzN1?=
 =?utf-8?B?TGRHbUl6SVhTbnZ2ZVJ2WlVNVTVCd0ViMExndkxFcm56bnpiT1ZQS3JGYXBJ?=
 =?utf-8?B?UXJiYTh0VHl0N0YwS2RhSUxEN2daZ3B5a0p1OXVyQlk1MFp1ZXlRV3NmYTdP?=
 =?utf-8?B?WW9tOXJyUzRFOFdpU0ljWW5wQkd3eEgxL29nSjk1a1Y5Snd1NjhVK1liV0VU?=
 =?utf-8?B?VGlwMk1ZWXhvV1M2dmpKSjE5Q2owSmFWdkh2YmFpQ3dOSVdoMHY0TUtUZkRT?=
 =?utf-8?B?eVU3bWpQOGlDYmF2c0YxaElDcXEwYjJHY2c0TUJNdVhvbHpnUEh1QVhuMEF5?=
 =?utf-8?B?RUQ4ZlRqN2lEaVBwdW9MbWR4ZFAwTlpMV2ozcEVWc0x1Q3dRTDJDdWV3S1o0?=
 =?utf-8?B?RUlhbUxHUTh2WHc3UVpwNktkRHZuZG91WjRPNS9NOGo5dGZha3l4SjFQUldR?=
 =?utf-8?B?ZExpcGV1dEtpTVRoLzZLT3dIOUhtMFc3b0IxOXlhd3h0eTU1ejJaYmZSRTJR?=
 =?utf-8?B?NXV3QUUzWWFtTUp3ZzljUUdVZmk4WW5FcDBZUXk5TjFITzQ2c015N2dTMGpG?=
 =?utf-8?B?cEJWeVJ6MjljTFBKSUxZZWMzTXRLT1BGaE03THdqa1d6b2xHSk9PazhxR1pW?=
 =?utf-8?B?ZUZYMU9aZXEwM21HUlJGY2k0d0tHWnhlYXFRUUxwanBub2M0Y015V2tpZjNk?=
 =?utf-8?B?blR5a2VjMnR3YnMrN0dURWk4a1BRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <458001976AC18D4DACA9CD02CD409064@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b75445-0286-4742-f5f8-08d9e11fbf18
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 23:01:11.4861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWjjgTjAVqjf2GKwGwwlupoLVrHPSELK46yTu5ucycfKdvTChuFv7X5TVoqZsfoRT9zxGuOkz62T8cUgR/ig3wVQjOA3iKOCpYm1jYhI+oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4651
X-OriginatorOrg: citrix.com

T24gMjAvMDEvMjAyMiAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgaXMgYXMgcGVy
IExpbnV4IGNvbW1pdCBhMzMxZjVmZGQzNmQgKCJ4ODYvbWNlOiBBZGQgWGVvbiBTYXBwaGlyZQ0K
PiBSYXBpZHMgdG8gbGlzdCBvZiBDUFVzIHRoYXQgc3VwcG9ydCBQUElOIikganVzdCBpbiBjYXNl
IGEgc3Vic2VxdWVudA0KPiBjaGFuZ2UgbWFraW5nIHVzZSBvZiB0aGUgcmVzcGVjdGl2ZSBuZXcg
Q1BVSUQgYml0IGRvZXNuJ3QgY292ZXIgdGhpcw0KPiBtb2RlbC4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpTYWRseSwNCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0L2NvbW1pdC8/
aD14ODYvdXJnZW50JmlkPWU0NjQxMjFmMmQ0MGVhYmM3ZDExODIzZmIyNmRiODA3Y2U5NDVkZjQN
Cg0KDQpJY2VMYWtlLUQgdG9vLg0KDQpQcmVmZXJhYmx5IHdpdGggdGhpcyBmaXhlZCwgQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXINCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiAodG8gc2F2ZSBh
IHRyaXZpYWwgcmVwb3N0KSwgYnV0IC4uLg0KDQo+IC0tLQ0KPiBJdCBpcyB1bmNsZWFyIHRvIG1l
IHdoZXRoZXIgdGhpcyBjaGFuZ2UgaXMgYWN0dWFsbHkgbWFkZSBvYnNvbGV0ZSBieSB0aGUNCj4g
c3Vic2VxdWVudCBvbmUgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSByZXNwZWN0aXZlIG5ldyBDUFVJ
RCBiaXQuDQoNCi4uLiBTYXBwaGlyZSBSYXBpZHMgZG9lc24ndCBlbnVtZXJhdGUgUFBJTi7CoCBI
b3BlZnVsbHkgR3Jhbml0ZSBSYXBpZHMNCndpbGwsIGJ1dCBldmVyeXRoaW5nIFNQUiBhbmQgb2xk
ZXIgd2lsbCBoYXZlIHRvIHJlbHkgb24gbW9kZWwgY2hlY2tzIG9ubHkuDQoNClByb2JhYmx5IGJl
c3QgdG8gZHJvcCB0aGUgc2Vjb25kIGhhbGYgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJlbW92
ZQ0KdGhlIHVuY2VydGFpbnR5Lg0KDQo+IEl0IGFsc28gY29udGludWVzIHRvIGJlIHVuY2xlYXIg
Zm9yIHdoaWNoIENQVSBtb2RlbHMsIGlmIGFueSwgdGhlDQo+IFBQSU5fQ0FQIGJpdCBpbiBQTEFU
Rk9STV9JTkZPIGNvdWxkIGJlIHVzZWQgaW4gZmF2b3Igb2YgYSBtb2RlbCBjaGVjay4NCg0KUHJl
c3VtYWJseSBub25lLCBiZWNhdXNlIHlvdSBuZWVkIHRoZSBzYW1lIHNldCBvZiBtb2RlbCBjaGVj
a3MgdG8NCmludGVycHJldCB0aGUgUFBJTiBiaXQgaW4gUExBVEZPUk1fSU5GTy7CoCBJdCBkb2Vz
IGJlZyB0aGUgcXVlc3Rpb24gd2hhdA0KdGhlIHBvaW50IG9mIHRoZSBiaXQgaXMuLi4NCg0KfkFu
ZHJldw0K

