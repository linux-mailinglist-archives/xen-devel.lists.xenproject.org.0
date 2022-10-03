Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F745F316F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 15:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414891.659316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofLkB-0005cz-Kv; Mon, 03 Oct 2022 13:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414891.659316; Mon, 03 Oct 2022 13:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofLkB-0005Zl-Hd; Mon, 03 Oct 2022 13:44:27 +0000
Received: by outflank-mailman (input) for mailman id 414891;
 Mon, 03 Oct 2022 13:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjbh=2E=citrix.com=prvs=268c0e076=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofLkA-0005Zf-HB
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 13:44:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75961eea-4321-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 15:44:12 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 09:44:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6719.namprd03.prod.outlook.com (2603:10b6:806:1ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 13:44:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Mon, 3 Oct 2022
 13:44:13 +0000
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
X-Inumbo-ID: 75961eea-4321-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664804662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=phPklzWJl2iCNTCo+wf0KloNacXhGY7U2fvnwZKbKvg=;
  b=BjkM6rdc4tFaqECGo1ihe3SPahZ+ErjTUmp7oxzkdbV1zK9kejb2XYHf
   G3fj/yqd4W37K+noAWcu/kMtUlQAMMXUfS1g9cdbR7MCzjMAcuLAkDRSr
   dDyll0tbOd7jJSjoxVB4eMGgNjgDp2Av7vxpRPIoL4p6ZCak0j1ETj1E4
   A=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 80976897
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N29kh6oKVPljcc6ZUe014CJ+9cleBmIKZBIvgKrLsJaIsI4StFCzt
 garIBmBPqneamT8L4ojbtuyo0IPuZfQz4JiTlRo+SsyH3kR9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPKgT5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 v0/cxssU0q/2N2cnpukUcdrvpggM5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+OF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJKReLmpq816LGV7jUCFwcNeXqVnfWSih+EVMtmc
 HUOpBN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0fKz8EbCpdFw8duYC8+8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:mCPwgawGIXdErYYHElJsKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.93,365,1654574400"; 
   d="scan'208";a="80976897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay0OVj44V+2V26UdcqmJ9qx0C5JwmrgSMWdB97pnrvuhU2I4yeV2D+zjJ7H7T6C1fIRwdVR6PvADjVcZvIa5Su4t7eX9Hd3n1sRed6cZxiy1qDIOfKfZP/azfWJ3M8kKVw2DRUJGn/RhlMZpJ5x5v5h/aEa2IukbL/4oi6p1E6n0B+IKw2AXtqMY9eAe/ZeiSg0JxlDgBVbVxtHtWZMGy580UqVEjuMp+H74v51n8Pr59xyMkpFXJthc7k0fry8B1CPd9ho2Ps1joXWCcvH59ALPNaj8m9RbbYxm2U4W9O8kvhNjFsUB1bFT8Q2itE1is0Zh7uOk89vf4YNilIKrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phPklzWJl2iCNTCo+wf0KloNacXhGY7U2fvnwZKbKvg=;
 b=RDfSvm2gdZPysGm3WHmgPxZmGbi7p2j1/1kxc7zN6ZmZhtwEbmkIRbqhOKQtbU1HYlbo8LWADlNT9nauDDsZQrlwOcyQ7Z15nGdwN8HnBcebYjsXD62ZXLRvkHf/GdTuvFFu1nPkD4QHNlKy40aax3FkY3zUxszcpAibm/hSWZmBw1h3WdX6rFKFTe2mggq0PeE8OYR4lW1MyaDwAOrroOEi8KNbjwEeiGBmc2+QwyqIflA7KQ7IiaLRJ8AibQZJgs8CAq5jtci7+DNtV9wJvGQczOpbyOj6X/cV4UOxOpFW1OgG211oA1WH73nnPmtYL7iZeJ8GlaienR92vjkCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phPklzWJl2iCNTCo+wf0KloNacXhGY7U2fvnwZKbKvg=;
 b=fZpYLWV5Vcqu0FnGr7Lls7AvaAlkSB/uh+lfg4ABSk250SvG393IiXjZgM+PEMfQEOQsMJuqKhuq3Nk8A7CgPdlUR9REMQBzkHuh9sx4CWLB06tSqD2Cc7pxkTdcWThP1YnwqdJjDbNsobtmh21KyRh2IunQdlguB5sy8jdfSzw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/2][XTF] build: suppress GNU ld 2.39 warnings
Thread-Topic: [PATCH 0/2][XTF] build: suppress GNU ld 2.39 warnings
Thread-Index: AQHY0+qyShr3jKepJEmQ1kbzugJHQ638tJsA
Date: Mon, 3 Oct 2022 13:44:13 +0000
Message-ID: <bd57773b-77d0-8e69-69ad-d17b272996de@citrix.com>
References: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
In-Reply-To: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SN4PR03MB6719:EE_
x-ms-office365-filtering-correlation-id: 4e073dec-df95-4d81-874e-08daa5455b8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1WUCc2O8eNGpKS7N5gIg/FTaWrYLBra3FXlAeT3UDdOgC5Y3E2IetKI7KuxSpcHBEDJI1IvWLrr0zm09Op3elN4aZgK0GRoNg/bg31Yh27xEf4Y/drZKCnUPv5mHLY0X+UGGq7iD2vpuDMFe6UKiFqFBN+y9QcDTSQdVsKx5SSGX5VAb8B7S8pQUuByaAbul7L8/CN58W0h5xCz4DpZxTjZj5OqBqCfaaqVOgFm6GS+QqLJZu1RI8DcMeZ+tJb5sCvTOnv4Oh4iep/sAF9O6b0eALODyEu7udKuEg8fH6XxgNOR7UnDPf30ArEhwPDReFfF/JjxqzFrZCqK1sSOLOa9qWlD+SoHMDTt0JcbcyL3zE/p5MWOuImehD4qW8SqLnITpsYZpB3FKcFzctEY1w1WSZKkboZTL8trJ/7lazOVP9GE03IM21DVCG5Pvo8PG7+Z2gaFlrnt5uziu20SGZFlbEjQaS6P1ybNzPw2tO0ATlMYJJBXaOvFdif6Ntn6d3zpBoc3T4w6xntg9nHWM0YN2Hzaq/x9saLrQUUhToL84pXZXAhiM8PxrnE9PlTccmzl1kgEiIZXMrvzzYPK92oJsyKfioVJae0fUKjimPBu/9co+XTahucBmJmDlv5iWKYEqhxFisvJrgWAuyMCjcsbks4oN8ZO3R+e6UtgVHC4S+q+d7+hUKcV0nI37dvSYcSo8ZQRafkv0zt72ahh75vViG+rkN3aYQBdcZraSFrjkRO66E693tmHngRxyHD1Kky5e/q2rDk0G6pJrG9lUWPc7rvHSdjkDMkROf7KfqRoLGPfwpiHuqSYvgzkKQi2eRgGLIAWhd8DQvP/3d6Cy9Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(2616005)(82960400001)(122000001)(316002)(186003)(38100700002)(64756008)(8676002)(6512007)(66446008)(4326008)(76116006)(66946007)(26005)(38070700005)(6506007)(91956017)(66476007)(53546011)(66556008)(6486002)(478600001)(36756003)(86362001)(31696002)(83380400001)(6916009)(31686004)(71200400001)(8936002)(5660300002)(41300700001)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vjd5VVRnYkUrRTNGU1ZOYVRJbkJmdHhZTm9QMmFFY2w2UWJMMXNDUkszU0t6?=
 =?utf-8?B?bkRrSC90bWFHeUtyVEMrRVQ1UnBydG1JazNSeFc4Vmw4ZDUzdy9hMlJkU2FM?=
 =?utf-8?B?UTJSOTlpU1FPNEJ4MnAvc0hoYW1jV3NFS1l6K2ZBcFlXa1J1aWNZdEVrajVP?=
 =?utf-8?B?VEppemY2YWN3Y0NvVkF0a1FidzRKYlZCSWhTYlAvQTIzdTVqZlM1aU5ic2c0?=
 =?utf-8?B?L0FTZFZWOVhZQU1NSWI1aCthcWFhMm1nTWJWNzdGOGJpMVVNNlhsTU13WHR5?=
 =?utf-8?B?b3lMVjVGSHUwYmpydTZnUWpldERuaGpWVGZYRmY0OWJQeFdBRTFPU3F0YWty?=
 =?utf-8?B?Qy9BeVhQOUZ1c1lpWEY0ZGpJMW5sbmZjRTBFRDExbFlxdjRJN0prZDFSNWxw?=
 =?utf-8?B?YVFyRzVqSDJLZ1l4RXZWUDFMRzdzQVFIUW51bGZzUTFXenpHdElDVGxZRUla?=
 =?utf-8?B?UXNQc2NUdDNiaDAxTWNqNnFVWG8rQnppQkpyQmltMkJ5WE82cENHeVQ3aSt1?=
 =?utf-8?B?MVIwa3FFRE83VGpNWk90M2dKUlVjdmlpcXdsa25QV0pNbzRLUm1mMU9vQXVD?=
 =?utf-8?B?QTA3SmxvekNscFlCWUU3KzB2aUlYRG93WmFOTGhhQlhqdGJUZEY4WlNVdlho?=
 =?utf-8?B?S3RQeHA0VVNIcmZhVFFPR2I4REQyUERhTTBUZE5QYVBWZFhRMnJXRmJ5WDFQ?=
 =?utf-8?B?MUtjZnNJdjBFL21IdEt3bUhxRUdOOWF4L1p4SzZvUXpreHNyek5uYUkxalIz?=
 =?utf-8?B?MDgvbXZzby96S0VrblFmUTZHS3RaaFlWN0tkSFhwdDZ6Z3dqWnhEdEpSU0hk?=
 =?utf-8?B?aGRCT0tXQjBKdHpCUGJ0RjhqWVk1SmU1TUErS0M4OFFTU29HQmRsTGZTdThJ?=
 =?utf-8?B?M0RzZ2ExUlZPUjRYU2R2YnpielhtakluVlV3aVlWa2RvR3gvVGpRZ0dPdnNv?=
 =?utf-8?B?Si9ZeHdFQjlpbkxrY09OUTNJdE94UE5UNTVYL1lSMXg1L0kwYzFrdFcrN0Zx?=
 =?utf-8?B?SlNIVXQ3UVJ6MGZ6UDEremNMYnZEaHczdFVhc21sZkQrQ1VGTWY1ek1wdUVJ?=
 =?utf-8?B?SVRSTTRJOXM3VU8yOGk5a240WW1CNllraFdtaWNDemc1Y2N1dHBNYlhiQ3Vy?=
 =?utf-8?B?WXJ3WVZUQmE5L3FMUkc3L1hGQVZDaklPM2F2cmJkRzI3SEV2S2NRRmlETEJl?=
 =?utf-8?B?L1ZlaCtIQXU3VTRKbFNoalZwTnArL3UwRDRXQlZPQWhhWk1hMFhDVlBKK3I0?=
 =?utf-8?B?elJUdndjVXEwbjU4ZlVpaWF2Q2FrMktwZ0ZDdTlFenpNQ1F4L3hMUjJTd1da?=
 =?utf-8?B?K3NhakFLbStRcExKNWM2MHloVDFsc2c4YXZ5eHovTGFJQk5HSlcySHo5cUtL?=
 =?utf-8?B?S3JLMW96N1ZRaWtSOHl5R3U2aTNVV3QybjU3ejBhUm5SR1J1bUMrZjlkL3hj?=
 =?utf-8?B?aFg3cmR4WGk4T2VjVlcyT0tzeXRTVE5XdTdocWFXMGN3cEcvcjRReFZQWTVC?=
 =?utf-8?B?SW1kcEdjdjZZYjlOR0ZZR05nSWpxeDRuL2h4V2NCbjFLNEgvSEpKRWsxSmsw?=
 =?utf-8?B?UkNUUTBXVkR5WnR4czB2YXN1T1JUUUJ3MnNvck9TUW1UOTUwRnIwZkV2amZ3?=
 =?utf-8?B?ei9zdUxhb2wxY0FZQnRRUGdkZVlocmE4RXdVUXJ6cUhDV2oxVC9WdDU0dzJT?=
 =?utf-8?B?c1FIUVQ4RlJUcVhBWjFYcFZZWEhDaVhSRXg5eG9uaDJleUYwMWQ4OU5XRWFR?=
 =?utf-8?B?YTNTMjNoNDBlaVJPYzRkUWEyeXIzTXJLcGh6cEhpMjNnNnBrcEk5TmtmNVFx?=
 =?utf-8?B?cmJiZEpVcWpNTXRUSC9UY01qY1AxZ3FpcDdWdUQ2V3hMY1YrMzJxR0tZajlj?=
 =?utf-8?B?QzczRk44SjBzZHM0NHhPVFR1QjBzZklKdHFvUERBbzZjcUpPam5yZ092WFV4?=
 =?utf-8?B?UGx0Y2JqK2RGa0d4SCtPMXdSd0pxWWpEYVFHVHlndlNSNkR0VkFSQlBTZzFj?=
 =?utf-8?B?MldnYWV4T1RnWFl5STNockN2d2NRTHdmd20ydmNKZThKTVRFZFJ5RmoyN1BB?=
 =?utf-8?B?S0hJMjVRRnVBTmNuNlhqRFVBczArTVVncU9kS2F6ekd1eksyYSt6UXd1U25j?=
 =?utf-8?Q?hkwP2Lq9295IumJuYLcrgxEgY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CE40603688BDE43BE93E50B430BC70B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e073dec-df95-4d81-874e-08daa5455b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 13:44:13.3206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VuCKPKrsLLFdsWC0p+Q+VlREN+P9ANyae+fRR2QG3xb5puruLKaBXufRfKQbmRpIDwywSI9zgu/DsCr2EtnMYZKiw6eEpCjKHA0ZoDkm8Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6719

T24gMjkvMDkvMjAyMiAxMTowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IExpa2UgZG9uZSBwcmV2
aW91c2x5IGZvciB0aGUgaHlwZXJ2aXNvciBhbmQgZWxzZXdoZXJlLg0KPg0KPiAxOiBzdXBwcmVz
cyBHTlUgbGQgMi4zOSB3YXJuaW5nIGFib3V0IFJXWCBsb2FkIHNlZ21lbnRzDQo+IDI6IHNpbGVu
Y2UgR05VIGxkIDIuMzkgd2FybmluZyBhYm91dCBleGVjdXRhYmxlIHN0YWNrcw0KDQpJJ3ZlIHRh
a2VuIHRoZXNlLCBhbmQgZHJvcHBlZCB0aGUgYC1uby1waWVgLCBidXQgdGhlcmUncyBzb21ldGhp
bmcgZWxzZSB0b28uDQoNCiRyZWFkZWxmIC1XYSB0ZXN0cy9leGFtcGxlL3Rlc3QtaHZtNjQtZXhh
bXBsZQ0KLi4uDQoNCk5vIHZlcnNpb24gaW5mb3JtYXRpb24gZm91bmQgaW4gdGhpcyBmaWxlLg0K
DQpEaXNwbGF5aW5nIG5vdGVzIGZvdW5kIGluOiAubm90ZQ0KwqAgT3duZXLCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRGF0YSBzaXplIMKgwqDCoCBEZXNjcmlwdGlvbg0KwqAgR05VwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDAwMDIwwqDCoMKgIE5UX0dOVV9Q
Uk9QRVJUWV9UWVBFXzDCoMKgwqAgwqDCoMKgwqDCoA0KUHJvcGVydGllczogeDg2IGZlYXR1cmUg
dXNlZDogeDg2LCA8Y29ycnVwdCB0eXBlICgwKSBkYXRhc3o6IDB4YzAwMTAwMDI+DQoNCnJlYWRl
bGY6IFdhcm5pbmc6IG5vdGUgd2l0aCBpbnZhbGlkIG5hbWVzeiBhbmQvb3IgZGVzY3N6IGZvdW5k
IGF0IG9mZnNldA0KMHgzMA0KcmVhZGVsZjogV2FybmluZzrCoCB0eXBlOiAweDEyLCBuYW1lc2l6
ZTogMHgwMDAwMDAwNCwgZGVzY3NpemU6DQoweDAwMDAwMDA0LCBhbGlnbm1lbnQ6IDgNCg0KDQpJ
dCdzIG9ubHkgaHZtNjQgd2hpY2ggcmVhZHMgYXMgY29ycnVwdCwgc28gSSB0aGluayB0aGVyZSdz
IHNvbWUNCmNvbGxhdGVyYWwgZGFtYWdlIHdpdGggdGhlIGNvbnZlcnNpb24gYmV0d2VlbiBFTEY2
NCBhbmQgRUxGMzIuDQoNCn5BbmRyZXcNCg==

