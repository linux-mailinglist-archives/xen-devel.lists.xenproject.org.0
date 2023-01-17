Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E2766E6F3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 20:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479778.743834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrdL-0003O9-KR; Tue, 17 Jan 2023 19:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479778.743834; Tue, 17 Jan 2023 19:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrdL-0003Ly-Gm; Tue, 17 Jan 2023 19:28:35 +0000
Received: by outflank-mailman (input) for mailman id 479778;
 Tue, 17 Jan 2023 19:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZI9=5O=citrix.com=prvs=374c09890=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1pHrdJ-0003Ls-EN
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 19:28:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e902521-969d-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 20:28:30 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 14:28:22 -0500
Received: from BN6PR03MB3378.namprd03.prod.outlook.com (2603:10b6:405:42::30)
 by SJ0PR03MB6873.namprd03.prod.outlook.com (2603:10b6:a03:438::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 19:28:19 +0000
Received: from BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b47b:e121:d2c1:1e4a]) by BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b47b:e121:d2c1:1e4a%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 19:28:19 +0000
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
X-Inumbo-ID: 1e902521-969d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673983710;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q0nEVV+PKACxNuyLFiJ+cSFauCEtuldpdi8hWhQlFlg=;
  b=fGbTq8rOgsA7Xm91ZjoR8VEL3i/EiFhax1Wwk+NkjA6EkNOfGjU+ss3U
   s7r6ZrA+7lTeqeNwCcd2zjPSn8nBg7Z8HcvCIIYxb4UVbQJ9SPd8nBZZw
   PQecITTvTdLjbmgOlDolRMXyQ1soDJRmt2sqH4/YDs3HRKeHTyoU/tgNR
   M=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 91960519
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ueT7CKpUeG9S0bEV5x5vfI5zhMheBmI/ZBIvgKrLsJaIsI4StFCzt
 garIBmHbK7YYGqhL993a422oU9V7Z/Wn9dgGgJk/ygzHypA8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHziZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABUSfyvYi6Gf+umYdrY8m9sJPOPXYKpK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWIEjCJbZw9ckKwn
 m/cuU74BgoXHNee1SCE4jSngeqncSbTCdtDSuXlr68CbFu75mVNFzY4U3qBn9K+plaaSsN6G
 0I/5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptXm/oc6i0uWSs45SfHoyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:F+DhFKNYZRIGw8BcT13155DYdb4zR+YMi2TDiHoadfUFSKelfp
 6V9MjzjSWE8Ar4WBkb+exoS5PwOk80lKQFqLX5WI3OYOCIghrNEGgP1+XfKnjbalTDH41mpO
 9dmspFebrN5DFB5KqU3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGemO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWKyIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmlM7rq4m1OcJ+OEzSvBkufJlawkEvzzYK7iJFYfy/Azd69vfkmrC2O
 O83ivIef4DoE85N1vF3SfFyk3u1i0j5GTlzkLdiXz/odbhTDZ/EMZZg5lFGyGpn3bIkesMop
 6j5VjpwqZ/HFfFhmDw9tLIXxZlmg69pmcji/caizhaXZEFYLFcoIQD9AcNea1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0Aesoie0iRQnnp+00wErfZv6Uso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMbTc6+GgX2MGHx2aKpUCTa/Y08SgPwQsTMkcoIDcmRCeI18Kc=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91960519"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWKv8wLWZqt4bX4R/9hedM09pbsIhVzAzhMKEejT+hRStqczyqg+W1GbmLE/YdGQM02TJIPzXq7H0PQMf1+r0nj3gOz7y1spVU9Fv8yPm3JcEt3hWTkZWkWd9bHtHb5Ic/aMkSyHyElZVLcqrV8qBQlLu/dKFm+Idlf6RT/jbj5JCq2ye9xt0NIN9aaTTRw9DE22VzD0tcIFXnmVX8e9zHVeUkiQuA9TvFObxegB2TW3ee1AtyDrYXE/w7TpF+OKbthOuaaJqWLhEBclkOMnL35ygcsgX1VDdPqA+5SZgT4ow6txoohnPgNPF9UHc3iGll/c/owtS3KVKpjtYpJMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0nEVV+PKACxNuyLFiJ+cSFauCEtuldpdi8hWhQlFlg=;
 b=A8Y+jJ2n6SjtKBTCBMZXC0xKaEZvqYiWQrlA38yZpLbEImo1XJqcXhkzCDl7Hyl577hLOx2gAbxTnAiF/HHNvpdzYDLsR0W63Xk7fmCBCbukv5lH8wuz1Vs3GsWOBYJpYYKVpIIlG0E1587QphJw6XJPShFPXJMOVCxfb8a/wd321LcZBoNioqjqAkt3AzfK7KRDKmPIlPeJmIRS7wnSsfFL888Qn8DUju/+OfXzn6iM0zjrsLb/vtAUui4a4ZYc7rMaeO48IuH1H1VWTBQWszRcbBLRjqDH2hd5mvWJ3PIgE0bryioVOEJWpiuTNxgYyw10cNmIzM6S7KAhT3rkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0nEVV+PKACxNuyLFiJ+cSFauCEtuldpdi8hWhQlFlg=;
 b=xhP7hcUCoDh05Fm9IZ+rI3J9pNk0kUctJZOz11ZUWEWpryciR+dFlbYknVN8+Zera7UP2UWvDO2UvHoDqRmt9mx6SkGdN/nAG99iHxHta2gIgB8nP5s/yAkcqvFCpmBRwFQXQFE+EWv1F0je12IJ80gmwSz1agvgikGzfAdre9o=
From: Per Bilse <Per.Bilse@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Thread-Topic: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Thread-Index: AQHZKc71hMjfkRx58UW4fngDofFpla6ixK6AgAA7aAA=
Date: Tue, 17 Jan 2023 19:28:19 +0000
Message-ID: <348dff00-5ae4-5dc2-64d4-d52409a22283@citrix.com>
References: <20230116172102.43469-1-per.bilse@citrix.com>
 <f7e7b6ea-5bc1-ba2b-5d21-eb431ecff53a@suse.com>
In-Reply-To: <f7e7b6ea-5bc1-ba2b-5d21-eb431ecff53a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR03MB3378:EE_|SJ0PR03MB6873:EE_
x-ms-office365-filtering-correlation-id: 30f7599f-baa9-4276-0ed7-08daf8c0fd7f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LEToopFUhBbsUFPRPRpdxwFWrtCKSqlD8OvmQBQobAHpy7JN7CAu+ZvxDY35kYsAr0856r2cvAT6HsbejGzCqHXOMOClFKWlySlrEx+qKOewPJJ5N8Dbz0fqKh7MLU3d5wr02WQoH9GIO8hrnZ2/0thJQAdIw6llAHS/V+qNIropOzPl5977USpflSnVNiiGuIRIwgXET9WFQ1wmnGn2DAbIwOPzIvVwiYGTlwS5iewrSzGi9DNVCSk2Fk6TxhBUkA9AElDWTYGLGLaitwjgeVIeN/nodEIfb2k5LeDB13AGojObrMDD7rUlds4c4T4xPZ66+eVNSY6sP8N6x6uOTmu+EjIMPWGc1JycHF4zO+7VNMrPegcl2bA6VptVd40zmJw3Fn3DLnOhB0KmFQ3k5agIH8q6rml5eMapPcd+5a+4/fNwyBZGx7y8Bu8ivx7N5rHaDp1DkU0XrachMsdkaEhnYDMVNPKjITu+UfRjn1Ehc5wJ1WufashogpRMouymDCKBXhx9WCIxPxLGFFdVB5L3vnbCNOEgU2MUdxsmrEVh4zpPzHiGd5VAnVdVozGbFpKP7SrYnOVQmMSa3rmYL8RFfvKdaO+JMG6aSc9GweNEgX6pGgifadeiqv+FwaW8+sqN8BAAOrYFTaYLucGhPWMJG5SyvswfyFG1dMrKKbdrk2Goi3fYGfTHSJ8KgYE/JnviZ268td7xE7Chc+moqLALF9jKL8lHOeN363cLvXU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR03MB3378.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(31696002)(122000001)(36756003)(86362001)(82960400001)(316002)(38100700002)(38070700005)(8676002)(66446008)(5660300002)(66476007)(54906003)(76116006)(66946007)(64756008)(66556008)(41300700001)(6916009)(8936002)(91956017)(6506007)(2616005)(6512007)(26005)(186003)(478600001)(2906002)(31686004)(53546011)(4326008)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFppRDZKTTkvSU5SODhIVUdrZDU0Y0M3aUc4VzIzVHpSSXBYRnJxdXBGbURE?=
 =?utf-8?B?cGoxN04zN3Q0UFJQRWQxSE55YXpmUVhsWXowZHF2RUZqUFB5Q2R6NGZabE9W?=
 =?utf-8?B?ZWVWeE0rSlhaSFNTRGFpcngyUTk3emJYc0QrV1BSMitERTNQeWN5Y1JqT3pT?=
 =?utf-8?B?dG43LzZ3aHFod0J3aiswdStzTnVYZlVRRFhuZ0crbVNrdFlCZWNWQlYwdlg4?=
 =?utf-8?B?aUNBT2ZpbFlYMGdQUnIvWnI0K1hlL2FRcFpNUzRROUZtK1BYM3NRQTZqOUJm?=
 =?utf-8?B?VHZjbVlmWGJhcjJ0Wm5QUWppdXpGODRYa0QwZVR5TWZKcC9yZFg2aFBCT1Na?=
 =?utf-8?B?VEltOVFiQ1k5NmloM2laSXk2ZTFTZmNsZi9QNE9NZ0dqMC9nUWJiSTR1TDlV?=
 =?utf-8?B?UzBQbzV0SFJ3dWtSZmhKYitDVXI2dVIvNzNkUWhPTEh4ZERXOWx0VDE2TGM5?=
 =?utf-8?B?WXE4RWJOOE9DbVcrUmxnS28rRnF1RjNVSENLVXpYQkg2c2FxYlRQUU56Z0Vn?=
 =?utf-8?B?cE85QThpVGRqTnVrcDJ3UnpJRGxqNXc4YUtaQjRmYy9KVnBEK1BSWldiUkds?=
 =?utf-8?B?dEx1TDcxRmFxcjZJVml4ejBldTBaOTd0ZGtUc25waHlWRGpZTytUU0VFMEFP?=
 =?utf-8?B?enhpek5ybkdQTGlleU9scm9kZWpnU2lSY0E1UE5xdWZwQjRpQ2hNTW1VY2xX?=
 =?utf-8?B?UzlnaFpjUGlDWGdvM1Z3L216R1dQTGZQVnRldTV6RzBpbzlTdXVCeHBzNGRR?=
 =?utf-8?B?ZFN4OHl0ck4rU2NSd25sTEpLTVlGT2gxbDJaUXB1eTl5ZDVuYXNhZm53WkYy?=
 =?utf-8?B?eExxNWdaa2Y1SlVKdG5ibWhkejkrZTdiZFFqL1RuSDJpdlEzdXNMWGpvbHBC?=
 =?utf-8?B?U28xYTZxVnYzMTVjSXNSV1pRNjU2ODB3U3ZoWGdhUGVEdExmREVCUHVwT3hv?=
 =?utf-8?B?QTFQNFdialR1Z296Z0tZTE0vZkcrUy92OGNEMmhQbUYrYXlrZ2JYb2Y5ck1N?=
 =?utf-8?B?WlhBNE5PWHNtZ2tzdVVvcmxUb200S1hrcW5kbXhxRkRmVTBqaytLdmttRUdD?=
 =?utf-8?B?VEQrSVVxNllLcXpvRnpaeHJxM1g1MEVtWmlJRFBzL3hnNFNzcG1WTDU3dkNw?=
 =?utf-8?B?RUhrR1RnWlVMNFlObjk0RVBLWnY5V3czNWpiTHdXZmdLVmI3dzk1dmNkaVph?=
 =?utf-8?B?b0wxZFZXcGpqVFVIUGVNWnkvTEhwcjZXTDVrZ2pWaDRCZXVtY2E5UU5jaE1o?=
 =?utf-8?B?Mk5tL0ZiRDBzSkRzcnhYWVZib3ZzVFV6RHlSa2g0SFdOTFA4ZFhrRDU1eDd3?=
 =?utf-8?B?RytIdjBtdEkyUTU2TjBGVytZSy8wL09kSjlNcWxjMVZpdmZhTkl6UkNJUzUw?=
 =?utf-8?B?cStCend0T1VYWjdud1owOEFVVG1uaC9iSVZCOWp5RFdvaVZnc2NDdHlzQWhI?=
 =?utf-8?B?bW5NSm9GaVA4dng5NldHeUdmSVd1a2Rkc0ZUbTd3dVJDYy9XNzZnb1JXTVdF?=
 =?utf-8?B?cnAvMkVYNkdSbER0ZXFVNUw2amZDNDNzWFJXM2pDcWYxRUdFSzJ2VHpjME9q?=
 =?utf-8?B?R2JBNkIzTmxuR1hKVEdzRjYrc2w3Rzh5RjN5S2ZjL29ueTJKTGJqS3Jxc3RJ?=
 =?utf-8?B?L3MvVEVQelpJYWZCakNEM0lWYlZrSlRsMFNtcEZkRHpxS2tXM0dTZ2JXY3ZR?=
 =?utf-8?B?K09lOGc4SDR4SnJFQUFFM1NqTmc2eGxvM2lmTTRBTnRMVmxROWw4bkNwczRP?=
 =?utf-8?B?ak9CamNkaEkxa04rdGVmZEJ5azJmaGRpQm1ld3ZnUHM3U3hlNHZ2aFhwU2dE?=
 =?utf-8?B?RUpNRWhveFQveFd6QmZZL0tRNW1UcHJidmNxdDMvUlRHNTU3V0swNDVXdGxq?=
 =?utf-8?B?Q2l4RStkSGJrc1ExSHBMc3dWZzBZenZvS1RYZTUwT0RuVXluU3I3RjllRDNQ?=
 =?utf-8?B?ZE8xWWZ3bVdOU20xa1JMV1locFRrTlUzb3hSSFBETEZuWXoyZFlyVGtRSnhy?=
 =?utf-8?B?TG5mSEU1a3VWTURXelk0emw1OVZ1eGI0cXFvZVBXdTJIclJJNHlHRDVtcEha?=
 =?utf-8?B?c1BndThOaFVJUFhwVG9OZVVqRVhnRU80TDBSdzVUZlVpT3BnSlJwWCtPWlFy?=
 =?utf-8?Q?O5fs87m49k4pJYCKgGKHMHcSN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ABD85C1A18112489BFECE66480DA565@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+f5g6x+wPm4JJt2dP/9jR0iRs6Tm9XNpmjvPlzSY11WhgVfg26sLmuZyTdCdVw7o1VDaUfYv58vLUVAtwA+1JH0bYwZIS5MdFbnFvDppoz7g407XpLklXSYYYej45v5DrQcTArtdVr0QPSKz3si9BrTnaaVfD0c85wUcIAe8SwOk7/FocKIWdlf8oKvsyq/DjVrzHx7RHWCY+dSx7pjOdDM7SRimlXUaZnZgPbEOcg9CtfFYoYyIIdA+kRdhaCtoyiGKgqS7jyKjBMYXnGCT/o+93UnguS9lSYXb4fq4V2oKjrUjHKejzvKQ89XenXu72onTmISBjrjP8YNF9XUJ6CIWjSg71WwzhGMesTgcJyl1aBD6tnpSAPKaojWuzXbXjnU5QmvxjLDdBIvdxt4N6ThHxNPaVot2GdJ1jKUnFZ7WblK57y22t74raotgZFDFYILUas2Fan4dwCADT7vqDsCsdD8VKWp3ew0P5iarvbEkj5g2/Mhbyru3vtT1yg9wY2OwjBBGc2E+5JfpTDuE/AkonvRtsNcI3Ektz9MNJRQgZNXReamMILvYABKBQutNE+WyLbwsgZ8q4mBkEbeASuyqT/yNUlp5uDDN1L1FInDE2JEpAFZQE7lZhCTRP7UcaOtvF+vkRz2dPVMHNp0UwRZeaO0sZ4xTSJ4CPsRctCIA1mDC151Z0y19DjWowZuk10EMuCRziM9EjZXxEbA5Te8INeW2enCk/zkhT2nS8oRpwMblYBSda6R+Qu9UxXMBkqfweXFXrwhrZ5F4GTh3b4lQ+LJZNahiD1ughytmgyQSEZGQd6gvs9CRB0hsawSc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR03MB3378.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f7599f-baa9-4276-0ed7-08daf8c0fd7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 19:28:19.6249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajCwoZdopvrP4Vjg7gWJ+G5HfnT/06eyC9yftpjaglvH7VTpmskoAIw4jHiOVMeJ66qjeMHdSiGZGWo54yIpGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6873

T24gMTcvMDEvMjAyMyAxNTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjAxLjIwMjMg
MTg6MjEsIFBlciBCaWxzZSB3cm90ZToNCj4+ICtjb25maWcgUkVCT09UX1NZU1RFTV9ERUZBVUxU
DQo+PiArCWRlZmF1bHQgeQ0KPj4gKwlib29sICJYZW4tZGVmaW5lZCByZWJvb3QgbWV0aG9kIg0K
PiANCj4gTWF5IEkgYXNrIHRoYXQgeW91IHN3YXAgdGhlIHR3byBsaW5lcz8gKFBlcnNvbmFsbHkg
SSBjb25zaWRlciBrY29uZmlnDQo+IHRvbyBmb3JnaXZpbmcgaGVyZSAtIGl0IGRvZXNuJ3QgbWFr
ZSBhIGxvdCBvZiBzZW5zZSB0byBzZXQgYSBkZWZhdWx0DQo+IHdoZW4gdGhlIHR5cGUgaXNuJ3Qg
a25vd24geWV0LikNCg0KQ2VydGFpbmx5LCBJIHNwb3R0ZWQgaXQgbXlzZWxmIGFmdGVyIHNlbmRp
bmcsIGFuZCB3YXMga2lja2luZyBteXNlbGYNCmZvciBub3Qgc2VlaW5nIGl0IGVhcmxpZXIuDQoN
Cj4+ICtjaG9pY2UNCj4+ICsJYm9vbCAiQ2hvb3NlIHJlYm9vdCBtZXRob2QiDQo+PiArCWRlcGVu
ZHMgb24gIVJFQk9PVF9TWVNURU1fREVGQVVMVA0KPj4gKwlkZWZhdWx0IFJFQk9PVF9NRVRIT0Rf
QUNQSQ0KPj4gKwloZWxwDQo+PiArCQlUaGlzIGlzIGEgY29tcGlsZWQtaW4gYWx0ZXJuYXRpdmUg
dG8gc3BlY2lmeWluZyB0aGUNCj4+ICsJCXJlYm9vdCBtZXRob2Qgb24gdGhlIFhlbiBjb21tYW5k
IGxpbmUuICBTcGVjaWZ5aW5nIGENCj4+ICsJCW1ldGhvZCBvbiB0aGUgY29tbWFuZCBsaW5lIHdp
bGwgb3ZlcnJpZGUgdGhpcyBjaG9pY2UuDQo+PiArDQo+PiArCQl3YXJtICAgIERvbid0IHNldCB0
aGUgY29sZCByZWJvb3QgZmxhZw0KPj4gKwkJY29sZCAgICBTZXQgdGhlIGNvbGQgcmVib290IGZs
YWcNCj4gDQo+IFRoZXNlIHR3byBhcmUgbW9kaWZpZXJzLCBub3QgcmVib290IG1ldGhvZHMgb24g
dGhlaXIgb3duLiBUaGV5IHNldCBhDQo+IGZpZWxkIGluIHRoZSBCREEgdG8gdGVsbCB0aGUgQklP
UyBob3cgbXVjaCBpbml0aWFsaXphdGlvbiAvIGNoZWNraW5nDQo+IHRvIGRvIChpbiB0aGUgbGVn
YWN5IGNhc2UpLiBUaGVyZWZvcmUgdGhleSBzaG91bGRuJ3QgYmUgc2VsZWN0YWJsZQ0KPiByaWdo
dCBoZXJlLiBJZiB5b3UgZmVlbCBsaWtlIGl0IHlvdSBjb3VsZCBhZGQgYW5vdGhlciBib29sZWFu
IHRvDQo+IGNvbnRyb2wgdGhhdCBkZWZhdWx0Lg0KDQpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
aXQgd2FzIGRlc2lyZWQgdG8gcHJvdmlkZSBhIGNvbXBpbGVkLWluDQplcXVpdmFsZW50IG9mIHRo
ZSBjb21tYW5kIGxpbmUgJ3JlYm9vdD0nIG9wdGlvbiAod2hpY2ggaW5jbHVkZXMNCmNvbGQgYW5k
IHdhcm0pLCBidXQgdGhpcyBtYXkgYmUgYSBtaXN1bmRlcnN0YW5kaW5nLiAgSSBjYW4gc2VwYXJh
dGUNCnRoZXNlIHR3byBvdXQuDQoNCj4+ICsJY29uZmlnIFJFQk9PVF9NRVRIT0RfV0FSTQ0KPj4g
KwkJYm9vbCAid2FybSINCj4+ICsJCWhlbHANCj4+ICsJCQlEb24ndCBzZXQgdGhlIGNvbGQgcmVi
b290IGZsYWcuDQo+IA0KPiBJIGRvbid0IHRoaW5rIGhlbHAgdGV4dCBpcyB2ZXJ5IHVzZWZ1bCBp
biBzdWItaXRlbXMgb2YgYSBjaG9pY2UuIFBsdXMNCj4geW91IGFsc28gZXhwbGFpbiBlYWNoIGl0
ZW0gYWJvdmUuDQoNCkkgdGhvdWdodCBpdCBiZXR0ZXIgdG8gZXJyIG9uIHRoZSBzaWRlIG9mIGNh
dXRpb24uICBUaGUgaGVscCB0ZXh0cyB3aWxsDQphcHBlYXIgYXQgdHdvIGRpZmZlcmVudCBtZW51
IGxldmVscywgYnV0IEkgY2FuIHJlbW92ZSBpdC4NCg0KPj4gKwljb25maWcgUkVCT09UX01FVEhP
RF9YRU4NCj4+ICsJCWJvb2wgInhlbiINCj4+ICsJCWhlbHANCj4+ICsJCQlVc2UgWGVuIFNDSEVE
T1AgaHlwZXJjYWxsIChpZiBydW5uaW5nIHVuZGVyIFhlbiBhcyBhIGd1ZXN0KS4NCj4gDQo+IFRo
aXMgd2FudHMgdG8gZGVwZW5kIG9uIFhFTl9HVUVTVCwgZG9lc24ndCBpdD8NCg0KWWVzLCBkZXBl
bmRpbmcgb24gY29udGV4dC4gIEluIHByb3ZpZGluZyBhIGNvbXBpbGVkLWluIGVxdWl2YWxlbnQN
Cm9mIHRoZSBjb21tYW5kLWxpbmUgcGFyYW1ldGVyLCBpdCBzaG91bGQgYXJndWFibHkgcHJvdmlk
ZSBhbmQgYWNjZXB0DQp0aGUgc2FtZSBzZXQgb2Ygb3B0aW9ucywgYnV0IEknbGwgY2hhbmdlIGl0
Lg0KDQo+PiArCWRlZmF1bHQgIngiIGlmIFJFQk9PVF9NRVRIT0RfWEVODQo+IA0KPiBJIHRoaW5r
IGl0IHdvdWxkIGJlIG5lYXRlciAoYW5kIG1vcmUgZm9yd2FyZCBjb21wYXRpYmxlKSBpZiB0aGUg
c3RyaW5ncw0KPiB3ZXJlIGFjdHVhbGx5IHNwZWxsZWQgb3V0IGhlcmUuIFdlIG1heSwgYXQgYW55
IHRpbWUsIG1ha2Ugc2V0X3JlYm9vdF90eXBlKCkNCj4gbG9vayBhdCBtb3JlIHRoYW4ganVzdCB0
aGUgZmlyc3QgY2hhcmFjdGVyLg0KDQpPSy4NCg0KPj4gKyNpZmRlZiBDT05GSUdfUkVCT09UX1NZ
U1RFTV9ERUZBVUxUDQo+PiAgICAgICBkZWZhdWx0X3JlYm9vdF90eXBlKCk7DQo+PiAgICAgICBk
bWlfY2hlY2tfc3lzdGVtKHJlYm9vdF9kbWlfdGFibGUpOw0KPj4gKyNlbHNlDQo+PiArICAgIHNl
dF9yZWJvb3RfdHlwZShDT05GSUdfUkVCT09UX01FVEhPRCk7DQo+PiArI2VuZGlmDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIHlvdSBzaG91bGQgZWxpbWluYXRlIHRoZSB1c2Ugb2YgRE1JIC0gdGhhdCdz
IG1hY2hpbmUNCj4gc3BlY2lmaWMgaW5mb3JtYXRpb24gd2hpY2ggc2hvdWxkIGltbyBzdGlsbCBv
dmVycnVsZSBhIGJ1aWxkLXRpbWUgZGVmYXVsdC4NCj4gU2VlIGFsc28gdGhlIGNvbW1lbnQganVz
dCBvdXQgb2YgY29udGV4dCAtIGl0J3MgYSBkaWZmZXJlbmNlIHdoZXRoZXIgdGhlDQo+IG92ZXJy
aWRlIGNhbWUgZnJvbSB0aGUgY29tbWFuZCBsaW5lIG9yIHdhcyBzZXQgYXQgYnVpbGQgdGltZS4N
Cg0KT0s7IGFnYWluLCBpdCdzIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHRha2Ugb24gdGhlIHB1cnBv
c2UgdGhhbiBJIGhhZCwgYnV0DQpJIGNhbiBjaGFuZ2UgaXQuICBBbHNvIGZvciB0aGUgcmVzdC4N
Cg0KQmVzdCwNCg0KICAgLS0gUGVyDQo=

