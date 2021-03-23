Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D00345B85
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100558.191678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpn-0007na-Jq; Tue, 23 Mar 2021 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100558.191678; Tue, 23 Mar 2021 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpn-0007n7-Fr; Tue, 23 Mar 2021 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 100558;
 Tue, 23 Mar 2021 10:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpl-0006c2-Ue
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32db4eeb-74d3-4558-b643-b0ec1e9c8a9f;
 Tue, 23 Mar 2021 10:00:06 +0000 (UTC)
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
X-Inumbo-ID: 32db4eeb-74d3-4558-b643-b0ec1e9c8a9f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=US6kAIf+2labk2oCST9gZ6uChRGzP0iC69NC7ePJygg=;
  b=BJErWs9/beJOB+kvaEcC/6x8Dq+z+Dk1KS5f7KilDEOsZtzYkyOw838Y
   EXfLA3b9efDoUdTJXxN5YoB+7aXrPKjT0+d0iQYEMwlskIVzMHpcXNRGz
   ukK40NVaOS3WDp+jGsrF1z/YDJgKz46cwNwF2R/Yjgsx67v2u/9r1oVg2
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GVSMCNCdokr7gSpcFW22ITltZD8ODexzTt+VH+cZHrxf4xTk98NRvEB5x25qrcf/nKuvJg0+r3
 DWi+bbARwa00W0oIY9khdGpDycK7xOyrPEOnS9gTeChH3NwDxSu0QiIothywpu6vz7AHuPCGGF
 dEuaj5zkNV0K2VBBI5IfKYlDGLLwZzc1rfBzZ2Qg/qdkpAk0XJlgsX8AxGKnjzwjg4Xde4jjjG
 K/Jf1OFZtdbAy8Otb5xIpMEDlSRuY7sIUtXPSTNFMwms2Hhr8AEfcelDbnYtNkPraSHou5HS5K
 3Ig=
X-SBRS: 5.2
X-MesageID: 39900265
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:68XtpaCBQjI8bbjlHejTtceALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPtfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VDdMgXE3Kpm2a
 9kGpIVNPTZB1J3lNu/xQG+HcopztXvytHQuc715R5WLD1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 Khz+BAoCetfmlSU9SjChA+LqP+jvDotLajWx4JABY79BKD5AnC1JfWGwWVty1uNg9n7qwl9Q
 H+/DDRxqLmiP2jzw+Z6mm71eUxpPLE6v9uQPOBkdIULDKEsHfjWK1EV6eZtD445MGDgWxa9O
 XkmBsrM8Rt5365RAjcnTLX1wbtyzoo4XP5oGXo5kfLm9DzRz4xFqN65b5xTxrD50Is+PF63a
 5btljp1aZ/MBLakCzxo+XPThFh/3DEwkYKrOh7tRJieLpbTIUUgZ0U/UtTHptFNjn98pobHO
 5nC9yZzOpKcHuBBkqp81VH8ZiJZDAeDx2GSk8Ntoi+yD5Nhk10yEMe2Yg2gmoAzpQgUJNJjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDBGLwYPWnO77r6+q886u3vWJFg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjs5E4Zx0vaD9WarrPSWPREtGqbrgn9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObXkSOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8GVDj3L8NQ81CzVhbD8VvsckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn84NqKJz1Euqk/Z1
 B/P7vjj6O+qQCNjCj1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaZXpfx2KdJhh0T9rfFQ
 lWo1gfw9P0E7WggQQZT/63OGOTiHUe4E+QR5AHg6uZ+IPOYZUjFKsrX6R3CCTGHxF4ghxRtW
 9GcQMIL3WvUw/GuOGAttg0DPuaX8RgiA2rSPQk0k73hAG5n4UTYVc1GxSpStWahA4yQSE8vC
 wKz4YvxICvt3KDC0saxN45PlpNb2r/OsMeMC21IL97tPTOV2hLPCG3rA3fsT8cPlHHzXk2uw
 XaXGqpUMCOOHRy/kx9+oLR0H4cTBTYQ2tALk1f9aVGUUrtnFFduNX7Ppab23eNa1cE3+EWOC
 zEZzxXOQ9129Wrzneu6Uq/PHE9xowZO+TXALE4Goujp0+FOcmGk7oLEORT+4sgPNfysvUTWe
 baYAONKijkYtlZkjC9tzIgOCNurmMjnu6t0Br57HKg1HpXO4ukHH12A7UaKcqb9W7qWrKB14
 h4l8s8ua+1Pn/qYtCLjaHRYDgrEGKknUemC+Upo4tTp6Q8qf96GITaSyLB0DVfxwolRf2E5n
 82UeB++vTMK4Vvd8sdd2ZQ+Ucojs2GKA8uvhbtCuEzcFkxhxbgTpu0yquNraBqDlyKpQP2N1
 Xa6SFb8vvfVyaI1LIRCcsLUBBrQVl57G4n8PKJdoXWBgnvavpK+0CiNGShNLBaU6qIFNwr32
 VHysDNm/XScSX22Ard52QmZq1P9nuqWsO0DkaHH/VS/9mzJFSLhe+r7aeI/UbKYCr+b15dg4
 tPMVEUZIBEjDIpiYUsyCi8SqDtuCse4i5jyCAikkSow5Ss5WfQAFpPPgLYiIhHRDU7CAn3se
 3VteyDkGnn6DdL2ZPfBF5dc9FHFd8XVJX2JU5VWLgtla/t+bEujCRFaAovCGB5iCmV5ZIY4Y
 uE
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39900265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXJ1iYuw4/bok+tKQ7fDpj75KpBnWo4cbSXSA/uzhFay4Clfuk6Yy+Xaga1sfOfENCEcLJm1fCuSMwXNf9RzMWr+6zlgesRerDbRR7AlWJ0dosMdKX6xJwLfvvxSGDbIx5FbsobMiOfkFSOpVE5+Ggd/Y+IwOK2Pf8rQhwtKW25nP7YDfwu4f9L89rYd7u8bChBwjwRryxZTlZlvKboUV+G/Vmwix/h5zlugyOHLvWJkEFhyyATFFD3lO53FqahAeCBsEhIeygeb0hVckq/uxH1HfYSoSOYI5Zn3PCNlLGrX2n7E5F5rp8gNuYA2EYiy9p5jR2iP4DCS7KvdfKe0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x96POU3Rped/M3iZclAcVyiA8U+JKnNokSoJ4Bo8H4w=;
 b=QxxxS9mldxbpf9U1yhZOnwLE6bEk3bWXn9cIUhc8mvrYLFrT+ZrOJzK9HX8twmgpLPPa2/moPgsPrnQBAuzmWHFJ2iqSkwqrvAf/X2Wg2y9XC++4DAl2bMDK/2vwpXNc9UekJMPDsFasX2mvNqilVRWxf48Lgoed2CdAlgM3KkrHChhQ9QVMCMSxNnw9f6NQQD/cL8jl4j347Im5IeE0oHZtGL8s/YaF41sAJ9qOf3cLSHqsZ2DQ5+QVgNefTwbANlswGdOx4w4Fweny/pYgUwedZ8USyEQe3XNmusygdOM5Cj0eUYKK60r04cS9njej5hbM2Amy7P1jkdUlU0vq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x96POU3Rped/M3iZclAcVyiA8U+JKnNokSoJ4Bo8H4w=;
 b=Gjt71eSLm2Rh1h7PKyIkj3J3bWVSc+qJcvBFSa4wkS7cPVWzSkDjt5eWNAbV4ImxEsAwG7kFoOTFqCYBIf2B9qpSQBqgVmZiw4iimiYn6EWfv4Mqow9+gklK8U/jRNIcRhfT2WnGOPz+6gULCswHaGX1RSacjj+jN8oXMsg3ZZo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 06/21] libs/guest: introduce helper to serialize a cpu policy
Date: Tue, 23 Mar 2021 10:58:34 +0100
Message-ID: <20210323095849.37858-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d183e04-e412-4789-dd82-08d8ede26cd2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633744AEBBC9CB3D42A39E78F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ElZibxGi0gY3rzpH2bdPuQKaMOd+JXXqyFRdbKV7brYJ/SP4ra9BnmIvvUHdrF61HfMvXJFFuieeqF4rOd+QAvzZkjPczBQrz1iwYdhTAW7RYsS08MjsYx0sHh9PfdEDJwF0R+0FRBruWhtKZTeLG38BAvApYKpVGwSWSbFU93VRYJYhyQocu5uFLI1/N91VU6CnRWJozdAaVCEazP+7PBZYuRKNFI5G0gCzsaH74ykwuRwd+QKrbJ5e/gU6dG7jT7cja7Et6vnpdmGp4bh1/pSpL0FNUeJoMqqs16P7/NsD5nEO63xjG7L31VMj54dEHucaxacq9UGQ5suhpm+ORCVqrU8JnczpGPYon+kQBaK2Y0VIWPDFaOQd6/k45sSc/yVl0hEuCIvJtwasKE9n0p2qEzTp4E5iA2O9qhAkCp9YXchFdmzEXN5dE7K1HPxG+SZSJjxL+lEVOzyPSduzxZWKBUEwAxvDNTSQUmuFgXPPjsGsBuvKasU/V2nsDyI0hx3CIQonHuoFiK0Se+ZdEB8cLXgMlRmTifGv4gE9n7ncwHC4ubCCH6Duvz3yAt2G4bvyKefM8KBl8zfKo2t0fWCG3HaOwYBe0UVIebdnGAUOKkzhv+yuNir8YAKeFNoS2yUQCogIZE29bFHVmZldR7da2TjuoCI/qWUwxa1PHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(83380400001)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmdKYTdhdWp0cU53Z0t4ejZvb21nTkNBWG5KUms3bkVXdEw1Z1dGNXRTemM3?=
 =?utf-8?B?ZDM3WUk3eVN4QjJ2bUJwM2xTZGZMZE5zMmlhVWRwYUgwT2FEcWNHYkJzdTZn?=
 =?utf-8?B?blozV20xRWV4eUVHcWx0UDB0UlQvZGQ3QWxLMDR1SEJMbXhLKzBKSWY3WElI?=
 =?utf-8?B?Qy91VGs5b3dtM1FTcWN5NUFQSm54Q0kzME53RG5sQ3FxUmFzSzhSbC8xeXNT?=
 =?utf-8?B?eVA1NVFDbzRwckN3N0NKeE9nTXdFSjdKY2dDNVpZUEt4QVg0UnQ5RVZ4WkZX?=
 =?utf-8?B?MXAzeEI0cHlpZWdkUEFxWG44NUcwQVhzZklrSFd2am00UXRRLzFaMERubS9r?=
 =?utf-8?B?eUh3akZXZU9LeXNaSTZLNjhCMFpBTWZBczJoVGNDNGI1YzJCVWNGakJyQkVi?=
 =?utf-8?B?Z25udGFLM21IS3ZmT2VXRjIxUU05dW5ZVjN3Um1XZmQrbDd4TGhwV05ON1lG?=
 =?utf-8?B?RE9DWnh3Q1BnMlFOS1g0RXg3T2pYdXVQTC9sanhDQ0pGRWQ3MkZuTGJQWGV0?=
 =?utf-8?B?NzZVb3YyaS9LdjRNbnJpdDgreHJxWStnQW9NU1ZtbFBXNGFDN21IRk5wMXhz?=
 =?utf-8?B?dk9rQ2xiZXNaU3lRWVl2QlQxeGp5cjVmdWt3UWlKd3hKRkRQdThiVU16TE5Z?=
 =?utf-8?B?OGFvb1Y0anZwQnh4anlSUkZGWjNYTmVJQVUvV2Q5c2dUMWpNSmxkWmwxeCta?=
 =?utf-8?B?SXN2RUJMV0wra0hjemNxNWt4KzJDa0hOTVkrbUlwTHBEL3V3UjBNZG1VcEZF?=
 =?utf-8?B?eE1qRkZhRjVJaDMzaW9JTEtvL1JYM2RYS2ppeXd1WlBRMmMxNEYray94QSs3?=
 =?utf-8?B?WWJCaDZtREQrS2dtVko5Mm9OcEJ2ZWNYZWFtL0t3RDB6YjIya3dZT0NteEFI?=
 =?utf-8?B?b2lMV3FDUE9MTXpUM3Z3czNBem1odGhzVWlBZWNRelFxZHNPYlBSdjJ3MWIx?=
 =?utf-8?B?SThBWThrSHg1aXpxS0Q5L2pRY0FyUU5qYkY1ZForS3hobjFmaXMvMkUrV0xy?=
 =?utf-8?B?Yi9GN1dVeTFOWDZtdWlHWXZ4VS9DNUVUamJpVTl3OUFmRSt5YWYyZFI5OVpN?=
 =?utf-8?B?WjlUWUdla1ZYamg3NXNNNzJHVjFaUXprRThIZUNMV2lwSkxVb21vL2p6bDBV?=
 =?utf-8?B?RFE5d3l6cWsxV3EzdmtwKytGZ3MrNW9aUFlJSkZUcmg0RXdBNGlyZ0NBV2ha?=
 =?utf-8?B?WlRrV3hFcEZOOGJWeGxoNXJhcjhnRjlYL04wSDNBaUIwcjVmc2FETTgxYnR5?=
 =?utf-8?B?aTJPY0NoNW5NWXR6TjFPNGRGaTQ3QzhEWFlROGI4UXR1ZzFkRm43Q0N5eXA3?=
 =?utf-8?B?WFZlaGVXYlc5VXhBOVFXbFI5RHNrOXlHQWJpNEd6VTJvUk4zNStOaXBMNVQv?=
 =?utf-8?B?Wmh2RjFLMnYwNWdNRDRRdEV5RDY3b3ZTd0dWMG83WWhYL1RYSmFGQzl5YXlZ?=
 =?utf-8?B?Ukc4Q0RDWUsxUFR6dFhEYU9ZNmc4dkRabUhpVWZ4V0N4WjJ2QllPdEhRMkli?=
 =?utf-8?B?ZGFLelE0QkJuQzZURDEwZTVzWTRBS3BibSt5UzRVSE5PcWxWYmpaYjNjT09y?=
 =?utf-8?B?UUVhRkJoWEtCQURsWGpJaHlTSGF2NDRUenN2VWN5OCt4Q3BWODlZTVVpV2dZ?=
 =?utf-8?B?UWxKYk5mSUZpQ2F4V21iNTRnWCtkT2hObWMzSERaRDQ0QWkrdjFjV3dobE5M?=
 =?utf-8?B?ZU1HRTVZNzVXNEEyN1pIamNPemxJUGlUUm56ZXBXR082SXNkdlNBWjVaSVE3?=
 =?utf-8?Q?FrdsEH8/npoNr7AEPK7blcZ36hPSI/btMhD/h6t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d183e04-e412-4789-dd82-08d8ede26cd2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:01.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN9TRHtbaV08ZQ+u5C0zWpFawoQxB9E4CeaGr5Xfe66nK8L5KK7/2FySigun1/LIdJ8AU7aq/qvEhP2d87nL9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Such helper allow converting a cpu policy into an array of
xen_cpuid_leaf_t and xen_msr_entry_t elements, which matches the
current interface of the CPUID/MSR functions. This is required in
order for the user to be able to parse the CPUID/MSR data.

No user of the interface introduced in this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  5 +++++
 tools/libs/guest/xg_cpuid_x86.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 8b8b30a2764..983bb027a04 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2602,6 +2602,11 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t policy);
 
+/* Manipulate a policy via architectural representations. */
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 75ac70996ac..812ef14fbcd 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -811,3 +811,35 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     free(msrs);
     return rc;
 }
+
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
+{
+    int rc;
+
+    if ( leaves )
+    {
+        rc = x86_cpuid_copy_to_buffer(p->cpuid, leaves, nr_leaves);
+        if ( rc )
+        {
+            ERROR("Failed to serialize CPUID policy");
+            errno = -rc;
+            return -1;
+        }
+    }
+
+    if ( msrs )
+    {
+        rc = x86_msr_copy_to_buffer(p->msr, msrs, nr_msrs);
+        if ( rc )
+        {
+            ERROR("Failed to serialize MSR policy");
+            errno = -rc;
+            return -1;
+        }
+    }
+
+    errno = 0;
+    return 0;
+}
-- 
2.30.1


