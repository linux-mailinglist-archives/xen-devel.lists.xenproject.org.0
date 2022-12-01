Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9663F176
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450700.708096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jUm-0004Pk-Iz; Thu, 01 Dec 2022 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450700.708096; Thu, 01 Dec 2022 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jUm-0004NE-Fs; Thu, 01 Dec 2022 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 450700;
 Thu, 01 Dec 2022 13:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0jUk-0004N8-St
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:20:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a03577-717a-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 14:20:52 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:20:29 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5996.namprd03.prod.outlook.com (2603:10b6:408:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 13:20:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:20:27 +0000
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
X-Inumbo-ID: f9a03577-717a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669900852;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=Ad4vnWy6uCPbZmg0JycUd/quA2Q5q84+ISpzbu1LsB0=;
  b=d/MxUz2KT1674Xmr7uswfNwzzDCe5cbVhI7pLECUFAlFwmZ1NP0TFlb1
   Ic9rUip2O3uRDZ5HF2cCnw00bRyiw5oArudOoh4BinyitC++b/7P5RiwJ
   xJD5wcNraNj1/IFdX/vKzO5KW5et7CO6lN8M9Y0E3NlbVjNzbqvJwCOqc
   c=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 85083880
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gEXJ6aOtYXii8/zvrR2plsFynXyQoLVcMsEvi/4bfWQNrUoggTRWm
 mQWXjzUa/fYZzf2fN8lbIS/9BsF68ODzIU3Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0spvLmRTx
 f84EzYAYDuulr+E2KyHS/Y506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efwHurA9JCTNVU8NZaknivgXEVECEZWF2Vk6CnunS+YoNQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcOscY3QXkg0
 ACPltawXTh36uTNETSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa387159jO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:wRwxHq8i2/99YN99jmluk+DlI+orL9Y04lQ7vn1ZYhZeG/bo8P
 xG+8526faUslkssRQb8uxoV5PvfZqxz/9ICOsqTNSftXjd2FdARbsKheGO/9SKIVydygcy79
 YFT4FOTPH2EFhmnYLbzWCDYrAdKQC8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85083880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9QbLwwYvkSEMlSbnAtp6ZvHFnKMDPo+CrRojiGsZZnPIhVUvBY4c2qcvTvRU2fJ1LAFNnay09HAiQnTm7oTaQAInq21p+plev9AiKl+qmWjgJ2En3HjrLHNEeZGb3RqFFZTIUr8kj9WaK7Z//O57lgDPW2BwmL5SxzgHR9aVy4tXUBI0P5HV0Y1xb41/rGCUASCBe60/T6n7GB5VuJIz8ypB+JbZbJQ95VMMQxTfWMHT1V358V7nBiW93jaVFiTTq2dqbqsI/V4g8Dae+sLV7yU5x24HgX/DvkIEvMlulwWXCGOu+BUuurhlBPE1yPGJWjw4CHUe7RY7hQ9kLEh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad4vnWy6uCPbZmg0JycUd/quA2Q5q84+ISpzbu1LsB0=;
 b=eDXJuO1VHz885MUnT+lG6XZ+yeKKQcBM3fE8GcC0z/Km3+NlXClkW8GmNtSrZPnOpqPwh0gbPL/A5qjg+JjWEvUF2Sor4Rbrl45GXz0HU+dd33joysGTUIs9RRGdNljskmA3RJFY8olNcogyzTO8G4EOCxWMA+fY2gmvwO9Q8EVM3slL1ZPJkXsAGZpYWXvDxuQAJSPvtYQls5Fp9ImQ0lKaT5rBzo+A6jf+t6UPJrLjtd3xl9316Ae/0+VE+Gi3fs97eTYNYna/pdjpcybODuaJCl8f74rQArm9Gf2h8YHNjYohkXuZXdjbgsidWvyPbjbB+jAuKcg+0ij2XW2c/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad4vnWy6uCPbZmg0JycUd/quA2Q5q84+ISpzbu1LsB0=;
 b=eVdQdtgMHAEMQYw96bvFCbD0GsD2k4xYGMiXSHG6qPGSybVEQ8KMv51zIXxkhvJ1oHz3LO+dpjrKYOwmtjuyBf/vC890mmyJXiHaN1Js043BdfCwtqaNjFi0TE1ZFIF1oCHfTPHiA07id8/tIIv+gy63SyPmIQ3rdQ3gNigCmPI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: preparations for 4.16.3
Thread-Topic: preparations for 4.16.3
Thread-Index: AQHZAxdQbElMHcNupUajNspL4cb9tq5ZCSuA
Date: Thu, 1 Dec 2022 13:20:27 +0000
Message-ID: <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
In-Reply-To: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB5996:EE_
x-ms-office365-filtering-correlation-id: 3a9ad9cb-dc9a-42db-7854-08dad39ed051
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Qbb0bd2rwSJFc9+JuGo57sybCbLYa5jDGvfeyXsZFyPd2BGUuoxHXVFN0b/ZGMvMSjJrzGK8j5yzN+dZtDLnjb9D7BwXnclgMQDW8mx9+/70iewqXAvJpn0OL+0p3AJELks0u9d5QuZiIJ7+Csbt+P29qo19V2S7qiDY6NC9HxNZP13nK8pnbDiGNSmp5L7s8kdH1/rH9hTu8tRpSdL0kxn+mnvls8f09J6TTW7RcQM6YDOTAktU9SIZZKC6XiLEjGVL6sA5Bu8yem83dgzRmL/zUOfXGb6cAmHH7oC2xUbQPATqoIsG+Kl020TRzEYEFOYBK+G1D+8L33qUJ5lSdJAvooZ+C+MvPnvaLjZ9NCxBEc0zBKJAMfjKLCMymoX3XfdNzA4EEBjWcBRGQMfUvtcX9E/CjC8uN1zIKAWw4Z4espzvOJzIqW/1QYiaVb7ZzEjCE+NdnZD7C/UQwnBm9vuTpJBlFgBOygee0zznk0Rdg6vHr9CWIj3bMVxvsPEzqxfXbp/oFvztQcolATq/ctpd4++qzVBCi8n0uJ5rRebdvjI+qT4oqtBF25FbLPBvgR7XvTt5dvzJgvywXuzvlEwlRf1Tat9DaD0ctqc9movaOM/+4psa3FMIN17j/ZoqE1I+nei/LQiI60M2LGwlzkQiRxAd7DsszCTTZYTUuVgGvwZYJiwYXTJr/H+8l4ZUEc4E3IIV/r+F96kknc5rTyJ30FTNlNWv2bhII9k5+waUKZEeJirRdQxAhaS0rUbuJfgwY3Wb+o45e07DkSuXOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(66899015)(31686004)(2616005)(6486002)(6916009)(316002)(38070700005)(31696002)(36756003)(86362001)(82960400001)(83380400001)(38100700002)(6506007)(26005)(186003)(6512007)(2906002)(122000001)(53546011)(5660300002)(4744005)(478600001)(71200400001)(64756008)(8936002)(66476007)(66446008)(66556008)(8676002)(7116003)(66946007)(76116006)(41300700001)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckc4eFpEenZheXhMTnBlSXRqUnVFMWdOcGNWaVd4bHRWVXp6UDZnMjVkY25Y?=
 =?utf-8?B?YzFWeDBiMHFTQ1ltTUY0NkNNbmVOOUZyQ3pwRDVvbVhvQ2RyczVLVXBGZXFU?=
 =?utf-8?B?bkRjNURBWXNuTlBNWDRlNldIQWlKT2hpbzcrSmJIcGJaeXdsaW9HNkxCZk85?=
 =?utf-8?B?d1h3UGRZQWhZTFJRZ3FnUUhOTEtWa1dmOEc2Z001SEVhYzQ2dWl4aVlwUmZr?=
 =?utf-8?B?aU50NnVpNHRSWnl3Q0xXVjJzbnFtbDRnUFV1WEoya0xRNDg3eGFnNGg2MDFl?=
 =?utf-8?B?b05pRHVpcmdwKzVsZ3l0MUpySTJrZHc5TVJDOSs1V1Y5WmFScGhUdmdMdTR1?=
 =?utf-8?B?dWxBYVNVR3JjTjJoMVFLWDRSOG1pZmp6T2FENWZLaXJwZDV3eUh5RmZQL2VH?=
 =?utf-8?B?UW51QXEwR2lFY0pUd0pwV1BpY2hhUHg5U3JQaDFORlZDanA2bDZNVEZydmdJ?=
 =?utf-8?B?VUdDRE5TUVNBcHJONCtPbm82VG9CQ1IvRmNtZmVUMGZWM2txcU1NY0dXM2ZZ?=
 =?utf-8?B?NjFVb0ZtQVJxY2xGcFphRHpKSFFpUlNtNzh3V1JURW1RYnlBdk50bkhmTVZk?=
 =?utf-8?B?MUJTWXU1KzAxOEdTdkZLN052dS9NVWtLZTAyZ2VQTFpCd25NcjhzNFNnKzhO?=
 =?utf-8?B?dUplb1grWlJCaS9LSFhvUEJieVo1NktFVzArMHJHNjZoR2JYSU1BUy9UTTN6?=
 =?utf-8?B?eFd5VFg4UVpyM2QrV1Y1OWMxZWJOVTBGdUxsWXk3ME1lUmpRMzVoa0crNnh0?=
 =?utf-8?B?cE01UkZOL0NrOG10NzVCNVoyMUwwMFJ2TmNBZmpOZExCVEVhM25LZUIzcVpY?=
 =?utf-8?B?NkZwNDAybVBHNVFUcTAwZmpxTHpPblZ0UGdLOGRQZmdteTAwREpEd0Q2TUM5?=
 =?utf-8?B?eWFYam03eTdWNVZuOGs4bDc0TFhXRUhCS253RDgwMHdQZWZmelQzZFlPcUZO?=
 =?utf-8?B?QVAzUUdhQTJNOFNhNllRazhEMGtwUlA5SThlb2JIMjlMY1R2UjdqSTVEMi84?=
 =?utf-8?B?d1V4dU5XRVF5UWMzb1RSMXNVakVROXU4Qmd2ZFU5V0huSXpJM0J6SzV3VEFh?=
 =?utf-8?B?cUpRVHQzdzJUbXRTcXplRDFjcnRreXY5ZlN3czUzQkhBdTJFNmlWY3VkbC9w?=
 =?utf-8?B?dTJOczVzRC9jSHlMQ3RWL1hCeTA0NzRjZmhROFdhRVg3TDNGVWhJTy8zZGt2?=
 =?utf-8?B?c2p2MFJFaDArTFMwR29jc3hqRHAzOWNBcTdubDRLeldBMTd4dGRRQnFhWWRX?=
 =?utf-8?B?SmZjUFA4SDNNMnh0TWZUSjVpMzJld3hpZDBETmRXd1AzTXY5bFNwQk9TTFkw?=
 =?utf-8?B?MjAveERZOS9KaWE1cUZ2VTEyemw5Mmp5cXBNYm83cG5NR0V6OVlDWlBNdS9J?=
 =?utf-8?B?R1JyMDdhVjhpdXFrSisyazFwdHdaYTJzZFZLTUEvUXF0eHNvMUtlNGhoVE9B?=
 =?utf-8?B?Q3BsYm9uRU9kcGg4c2VlUUdVaFBjaUQ0RXorSTVjU2M3SHB3bjM3b1k4aito?=
 =?utf-8?B?aitlZUVCNit4ODV6ems1UmxzSGtzM0pBaUROVVhySXNzVWZWY0lGaHdVV051?=
 =?utf-8?B?eGJZMFlkZDhMWHRsc3NQdEJyQm9XU0hqMUxCaC96WnlRZlcraVVRZmdhTlRC?=
 =?utf-8?B?eEtBOEp6QlNBZHIwelV6VHdqdUEvQWVLWVVvdG55U3R0TWc4OXJlYkVUTW9n?=
 =?utf-8?B?ZmhUUlZqRzlOMHA3aDVGU2dkWGZXSFU1VlNlTjA3TTl0alJtNkJqcit3bEYy?=
 =?utf-8?B?L1ArT3JKYXhyZFc2VlRWT0tEZWJUY3NwUDVKWlpMMUpLWWloRjI0UDNFUEN3?=
 =?utf-8?B?TnlmbjlLWWNrS3JlVGh3SmtpWWJRbnZKNVlSK1FZeTZOaU9haU5JUW1UMmJn?=
 =?utf-8?B?amd4ZStHN25hcTJORzEzeXlPQ1g2T2ZRS0k0VG9oQ2pIMjd5ekRZbG5Ub3dY?=
 =?utf-8?B?VEp1ajBIWXBWaFJsQTJENEtOK2tKWE81RCtkajlheDF0dktWdURoQ0YwQ0Fr?=
 =?utf-8?B?aWlqRFVtVmVqS3Q5aGV6Skdscmhtc3RPdE1lUzdETUh1dDN2MjRVaEhJZVlO?=
 =?utf-8?B?WllNZVNVR2htSW1zME44UDByWmJJSUVIbFZDckxYekNBcG5HZjV2ckYzN2xJ?=
 =?utf-8?Q?HNUEoNO6CADUa9i6GCWBmG++q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F807044E236CB441824023E89854514A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zeK9TwNIN5npGIGl+5PmWpNsy/e3HOUnj/pILAb41TJ2yjyAC2btYGUkcPVCaYkBDExJ+jm5/WZG9nSbTP6uxbp8b1po/VdDgYChjhryGCnWFvscpczpuwU+C/J91TpZwh2I7mRZPxQittbYbqmmCa1bkW+QFxfdRy4rPw9W//1FBzek7+BWSqaPINqSvdXX6RZil7RhXCmMxJ63B6BYyqyXCobZKX3fi2LNss3FmVO9IVMcxhb+VLAzKPRU49DIeCEieI6UE73CiJWUxkH+oNtq+Nm4hG0+PxSlvev3E9chfAsOFOjqADGM0rDgNINVdr73rHTcbYhoDYsgAyEe1DVkirChG5KOYaSIF9XiQf2x1c0BEkBSOGDmpIMcTNT/HeSqKmcjwGRIrqhxFogIAWrlIN8l5+2kKB08gRXnsDKLontyZeAwAS7tYELbPHPzbndiLfzeHIDtv1TgRsMx1H1ZLksHFqcVj6ZQePRfCttl6thZ3i+/IBaEBSTEr5Pmix47DVrbLAlUbGImCw1M1rEzJKiBRzOl3WAwASIpJZyvb/gp8mNE0M5GBFoQXtM5ayILIwgkdjtl88RquzlNy1Rbak2113h61n9f2lG3CiExpK+8MInfkYb7bAI5IePZpmZ9ka/UXEHcFHeRsc1jZbl1woapHSVFL1SVNz3vd5rZ51q9G6MTZirdQBCVWvolvI4e7inayHS9xl68g5iMVafvLIuSSBxWQIeMC9R7cOYAadM9c57kKm4kgKn1J2CJ/dDtFxiLT644v3ZLGOhHnw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9ad9cb-dc9a-42db-7854-08dad39ed051
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:20:27.9483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eqk1MaFTVeysD7R6D8gtSS0gpVuCapicMHKRa2EZHy8DfBF/YT32AQ3Vr2fa3Gll6ei+asfcQ+kqMcO3qzl2PEkNG/R5hqBS16H++TV6V+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5996

T24gMjgvMTEvMjAyMiAxMDo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFsbCwNCj4NCj4gdGhl
IHJlbGVhc2UgaXMgZHVlIGluIGEgY291cGxlIG9mIHdlZWtzIHRpbWU7IGlkZWFsbHkgd2UnZCBn
ZXQgaXQgb3V0DQo+IGJlZm9yZSB0aGUgeWVhciBlbmQgYnJlYWsuDQo+DQo+IFBsZWFzZSBwb2lu
dCBvdXQgYmFja3BvcnRzIHlvdSBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZSBzdGFn
aW5nDQo+IGJyYW5jaCwgYnV0IHdoaWNoIHlvdSBjb25zaWRlciByZWxldmFudC4NCg0KSSBoYXZl
IGEgd2hvbGUgcGlsZSwgYWxsIHRvIGRvIHdpdGggKG8peGVuc3RvcmVkIGxpdmUgdXBkYXRlLCBi
dXQNCnRoZXkncmUgc2FkbHkgaW4gbXkgcGVuZGluZyA0LjE4IGJyYW5jaC4NCg0KSG9wZWZ1bGx5
IHRoZXJlJ3MgdGltZSBmb3IgdGhvc2UgdG8gZ2V0IGludG8gc3RhZ2luZyBiZWZvcmUgaXQncyB0
b28NCmxhdGUgdG8gaW5jbHVkZSBmb3IgNC4xNi4zIHRvby4NCg0KfkFuZHJldw0K

