Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54535E0CA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109781.209581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJco-0005KS-RN; Tue, 13 Apr 2021 14:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109781.209581; Tue, 13 Apr 2021 14:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJco-0005Jh-Kn; Tue, 13 Apr 2021 14:02:42 +0000
Received: by outflank-mailman (input) for mailman id 109781;
 Tue, 13 Apr 2021 14:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcm-0005DI-TH
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 443fcc63-a9ef-4fcc-b101-606f42864a7c;
 Tue, 13 Apr 2021 14:02:39 +0000 (UTC)
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
X-Inumbo-ID: 443fcc63-a9ef-4fcc-b101-606f42864a7c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xAaavw8tLgCKI5yDj7+ij6kDHsh9Urpoi2CfeTGi1ww=;
  b=PKxcJ8EgeIPpGDg5nI2ew8th5zs/t7FGpPRsdz/S1aVKC6SzXJq+BDbS
   Wi5+3f35QKNDbK/BOZ42k45QsHnbQx8KBazypUDOQpzzKb3YKvEhUHgLH
   Opek2BCBfU/yqyDjhW4rJmT8A835NITmNwxsQqOpZb/rObEe5BUgziBII
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mjzN2C9ug2pI8YZWOnJ8vtQRdzvPYsSriq45UkfvX5jS6Bn7WOPsCzVgA4LQ7MhbJuOGcjkUbW
 NOiGenB59l7jkEiRA4HhsYNJjc8E1pjLif6piuHmoLi6v4uXHgJ0udxlOD3XmSWJf6pT/8pJ1g
 Jl9z6ehzC8BuUChRUuZpRZuB4G21oxcOChY/9j5zQCnUC2DM5t0jmLrgR4DvlBjarGGgLFOHsK
 JByYgolWBgERtU2plNw2G18Kxozz/xKcOQfkuhx9+3cMdcMh0hBHfEu/wy/ryUxd4su9i6BQ2J
 oE0=
X-SBRS: 5.2
X-MesageID: 41476465
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7fDn3K6Z/UHCc27tDQPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41476465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+kWog2isXEbBsHil1Z7u11+uQFk/XcEz3JV90a+R6mao9tVCos8sWvDvYnMtj6uh2AC08JrTLicFgdF+co0FYmgzp8moOdZ+bOr3vVROxoCfDon7s2T5Wl9ISX29KS3cj2XuEULCLdbcldHruywJb4Y6V0Y52p1ZWMjZBK92KHHofGn+gjKHShuWqRc5CqF2nmIqwJOJykoB6lQ2/If9iqYo8IhRkPDQ1/ZkubYLwejZiaJNFOfP3D1QS4HabCK0i3Apms6v4Cc2ckJZliPfYOR/1AhLqmyji2BjeHYkqbqJj5ncJd3EVmy44ApZJy5NLy6RdcW5nmQcu2xdDI+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts6808t8I7OOkQ2S6zJoNr6HGxOEnfocXKMyqX7zdFk=;
 b=Yn2Oy3fq2h1KILOwZ5/dyDq5MrbsDfbvucfuL0vFD+7Zcd7W7Kp0LIsaJjUWo4qyAnnJQWWLOPAF6zNlq/enYxKjkJ6/r2RNwsbSvlbYLpUcXmSjMhFk1RVEn5SLDkbGte9gDmEwqIf++vMtXm31L7haS3BnemKyrKLUl9zRTH2cWe/kL8zKkg2HWairAUiXAzg1FQ8x2lj46z9uu3eOXabMF1FrkUH8WDVhCvjlD+9Chucep8AUtpt7q7+6tH7L1p7AR74El3oZ/qoLlJ+mK6GwpGyWpXdSDOOvOX6P1L7bHEmSRm37jcUD5PBCEAKBxga1HX91NtLbWg6Ppqg5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts6808t8I7OOkQ2S6zJoNr6HGxOEnfocXKMyqX7zdFk=;
 b=neSQTFRItJsIKQNC7TcC8QEtw0WagpoZ4nSkQ79aphkQkyxq99ZAvGlKiUx6LP15q+sZMCr7gH6NM8d21KtRc0l6AQNA8gTJBmNAun3ZfJ+N6hHpn0eSaL1kfa6bsLhxDMc8uAWOv83bPZj6JZrN47UPlliBqNyh83fYfalSqg4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 07/21] tools: switch existing users of xc_get_{system,domain}_cpu_policy
Date: Tue, 13 Apr 2021 16:01:25 +0200
Message-ID: <20210413140140.73690-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a2014e0-48e7-4c92-b709-08d8fe84caea
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2553CBAC78CE4E95676D081E8F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltBqwAM+hGtRwnLp2PrwYzeLKzIMQgAtdgSrRE8pc3A0qPa6ZWl/fYCMgpbQI38rd6HJFc+It8c1wrlUWiSPyoChVtR5rskUaVAycK8kmp7pGXZ/MGphRwrTpqtrmUWXda+y6MFOnQU/PSoaZ1gb11tWxCIvDVU40p6gXewOG7pJbTi4aa2k8UA/VML1uJkd7qRpTxO1qAmpYJpd7JKEz6B/Zq2JcMyLFGsbn6hTfXbM9WLhBwGE/czv7qJODSXkUyxYQIcFfJedI66/keWTdQxBSnaiD7yU82/RwyxcsJfAYl41kRf1qBpYxyuXBe/zOAo7o0suSIK+5FHaxDmjdkRozCWLUpnOMNuTkjI0bugsBWYAPRu75YqlO5nndoptbnK8tfsmk9wFr9cj3fZzxN4EMULn6BIl8smvVSml6KOlKsHLXAJwJu9NPswCQCt1+k6xRGyg8aheSbXQtqaIDMyPgu9VkWp11I8hkpms7cOMhEnz9bU4XRIUGJkyYzQpVH3anG0m/7FTT9sK8FI/ubzH3rTR3dbjhMtUS6knk9I79WU0csMGTe9SeR3+6BX/Fz90tpc9m8umDsMRSr4aPxxtqmnUSztgZJ760MiZcsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(83380400001)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekhqRXBTam5ud0RROXVXQ0JSOFFzUXRna3dER0FGL1J4M2UzQUpXUXpwVGcx?=
 =?utf-8?B?WkcyQ2RGbEYrS2F2eFg5Q1d1T2ZjMUtTOXREc0JVamMwcHhwU2hZanhNRk1w?=
 =?utf-8?B?T2xHalI0eW5sUGN1dy80TndmZDFwTWwra3VLNC9qZzJmL0xnMjBDOWJPaHh2?=
 =?utf-8?B?WHkzRVgzZWY1TXcvMXNPeHFyMVNNNmhid3hoczVNSGZad3FQS2dMeGlYWHZZ?=
 =?utf-8?B?WGR3OVZFT2ZsNGlNcUFmSlozV0xBdlhIS3VFcE5XR1ZlREZuekFrL2svcjVt?=
 =?utf-8?B?cDE3Y1Q5akRqcFlsc1FWQUdZZXNwcFRmOVVXb2w5S1VQaU4xLzlCWkRHVHhh?=
 =?utf-8?B?aXR2OWdsZEhmclF5WE14OHZxdUE4RXU4T20yVThrenEvYm9DMlc0OFNxNG03?=
 =?utf-8?B?VjROZGVZTHJrakhkTDJUTHZoMW5UVXF0K3hlVUVOSnl4a0xaaDI4VlE4YWhh?=
 =?utf-8?B?T0xZQkp5WGlPbGhCTlFFTC9pVzJjT1dxeTlxdHd3TitlL1FpUkJad0U1L20z?=
 =?utf-8?B?R3hPc29rN2RTeFRDRnhEeXZQSUh0SjlBb1FaZHZOQmNEREl2YU51NXYwTnhN?=
 =?utf-8?B?aFArRFU3aFJmWHdVSGh6c1l0VEVpUStIQzlpb2ZpUW91R1ZOTUhTdXNDd1A3?=
 =?utf-8?B?TVlqbjgxRkE5ZEhpcXAvajNHSVBSKzd6cmV1UDhZVzdkanRvVUpkRW1tY3BN?=
 =?utf-8?B?LzRBSzdsdU8wNTNLSVh0djhVdHFyQzZ3UVN2SDNMaW9nUWxsb0JxckJabnVC?=
 =?utf-8?B?Tlp5U0NMd2dNbS8xYXZ3eXpVU0paQ3pLLzR5SDNoQW9ibSt1UFFKU0hreXhp?=
 =?utf-8?B?TWh6bERTeEdzaTdIcGxQenlNcmgrcmdWNUNpSHlXNGJQdnR2UDRYOCtrZkJK?=
 =?utf-8?B?NVY4bVpuVWkxTzd3Ym5WQXhuNERUV3gxeSt4Z0RIOUlyUklucTJiTFN1ZU0y?=
 =?utf-8?B?ZHl6UzdoaVNmTzB4Vk9VditOc2d0RWZtamtGRzJvMDZWZGVnK0ZnWDhQS1VF?=
 =?utf-8?B?MlZ6R3pGbG05UUFWWGZvcXE4d1pFVVphMTVrWDdUaTBmbkk4V0xUOElSU3ZJ?=
 =?utf-8?B?VEF2UHJXRUJ5U2tKTDcrUWJNck4weG9zd29HMWg0UU9UOW1UQ2lHQS9FQnRG?=
 =?utf-8?B?QnB2SWNLQkpMM3BLZXRNUysxeHR6TGIxbWI5Mk9kaDZocTNUNVFDVDJxcGtu?=
 =?utf-8?B?MFg1UDV3MGYxUDVZL09HUkI4Y1g2aFdITEZXYmpLN014bUtqK0RtUkZxNHlx?=
 =?utf-8?B?WEQ3UWxsMWMrdFJ1eFVoMEJZdklWUlpjNkVuRXladmJrTmRRbXJTZ0JsbFl3?=
 =?utf-8?B?Z2MxdldDUHBLRUE2Nk1mT3lmWlRpSEpJZWdCMktRRi9pN054NDU1TkZ5ejRW?=
 =?utf-8?B?dEVlTGNBazNoNmQxK09XQytNZHhWLzNCclBXeUFhdmRyN0xDZ0g2VjRJbkho?=
 =?utf-8?B?NDljWW9IUW42aE1yRERtcWg0U0NCOU5qcVgrdmtKVTVBQlF2WkZHOHczWVY5?=
 =?utf-8?B?L0J5NHArM1hQQm12a2k0UVdFNHRDL3NXYW5QR1c1RXl0STJ4MFc1MDZmYkg0?=
 =?utf-8?B?djYwTzZCWngzVVNYeEQ5RFFIejNZc2lBWHlBUjBDbDJtYnNBbUsrSkxZUjJ1?=
 =?utf-8?B?TU95bk0zaHRleml4T0s0WTdyb3lwL3V1U1hycFo5cXJqNUtqTitnalJoeCtN?=
 =?utf-8?B?TjBqUldlSEhuczkrZHJoQ05YaGpVZmMwR2daQnpFdklvNXJjRS9pUkNOWENo?=
 =?utf-8?Q?TxrAmphWfN1N/1NpaNY9POEJGYdiW1dytAUvkQf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2014e0-48e7-4c92-b709-08d8fe84caea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:36.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbxUlADcVmrjuv+lRwyJVr7d73HXfTPFtW7kHp1Zl5SmCsG+1qIP4TiYgep92qCEXHJnCatlds1KXzxbNia1uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

With the introduction of xc_cpu_policy_get_{system,domain} and
xc_cpu_policy_serialise the current users of
xc_get_{system,domain}_cpu_policy can be switched to the new
interface.

Note that xc_get_{system,domain}_cpu_policy is removed from the public
interface and the functions are made static, since there are still
internal consumers in xg_cpuid_x86.c

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h             |  6 -----
 tools/libs/guest/xg_cpuid_x86.c     | 39 ++++++++++++++---------------
 tools/libs/guest/xg_sr_common_x86.c | 15 ++++++++---
 tools/misc/xen-cpuid.c              | 21 ++++++++++------
 4 files changed, 45 insertions(+), 36 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a4827b1ae6a..e9a86d63bad 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2613,12 +2613,6 @@ int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
 
 int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs);
-int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs);
-int xc_get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs);
 int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
                              uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
                              uint32_t nr_msrs, xen_msr_entry_t *msrs,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 918591a128c..208a247bb6e 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -135,9 +135,9 @@ int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
     return ret;
 }
 
-int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
+                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
+                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
 {
     struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(leaves,
@@ -173,9 +173,9 @@ int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
     return ret;
 }
 
-int xc_get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
+                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
 {
     DECLARE_DOMCTL;
     DECLARE_HYPERCALL_BOUNCE(leaves,
@@ -329,7 +329,7 @@ static int xc_cpuid_xend_policy(
     /* Get the domain's current policy. */
     nr_msrs = 0;
     nr_cur = nr_leaves;
-    rc = xc_get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
+    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain d%d current policy", domid);
@@ -340,10 +340,9 @@ static int xc_cpuid_xend_policy(
     /* Get the domain type's default policy. */
     nr_msrs = 0;
     nr_def = nr_leaves;
-    rc = xc_get_system_cpu_policy(xch,
-                                  di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                         : XEN_SYSCTL_cpu_policy_pv_default,
-                                  &nr_def, def, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                           : XEN_SYSCTL_cpu_policy_pv_default,
+                               &nr_def, def, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
@@ -354,8 +353,8 @@ static int xc_cpuid_xend_policy(
     /* Get the host policy. */
     nr_msrs = 0;
     nr_host = nr_leaves;
-    rc = xc_get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                                  &nr_host, host, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
+                               &nr_host, host, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
@@ -486,9 +485,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     /* Get the domain's default policy. */
     nr_msrs = 0;
-    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                              : XEN_SYSCTL_cpu_policy_pv_default,
-                                  &nr_leaves, leaves, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                           : XEN_SYSCTL_cpu_policy_pv_default,
+                               &nr_leaves, leaves, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
@@ -715,8 +714,8 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
     unsigned int nr_entries = ARRAY_SIZE(policy->entries);
     int rc;
 
-    rc = xc_get_system_cpu_policy(xch, policy_idx, &nr_leaves, policy->leaves,
-                                  &nr_entries, policy->entries);
+    rc = get_system_cpu_policy(xch, policy_idx, &nr_leaves, policy->leaves,
+                               &nr_entries, policy->entries);
     if ( rc )
     {
         PERROR("Failed to obtain %u policy", policy_idx);
@@ -740,8 +739,8 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     unsigned int nr_entries = ARRAY_SIZE(policy->entries);
     int rc;
 
-    rc = xc_get_domain_cpu_policy(xch, domid, &nr_leaves, policy->leaves,
-                                  &nr_entries, policy->entries);
+    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, policy->leaves,
+                               &nr_entries, policy->entries);
     if ( rc )
     {
         PERROR("Failed to obtain domain %u policy", domid);
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 4982519e055..15265e7a331 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -48,6 +48,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
     struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
     uint32_t nr_leaves = 0, nr_msrs = 0;
+    xc_cpu_policy_t policy = NULL;
     int rc;
 
     if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
@@ -58,20 +59,27 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 
     cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
     msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
-    if ( !cpuid.data || !msrs.data )
+    policy = xc_cpu_policy_init();
+    if ( !cpuid.data || !msrs.data || !policy )
     {
         ERROR("Cannot allocate memory for CPU Policy");
         rc = -1;
         goto out;
     }
 
-    if ( xc_get_domain_cpu_policy(xch, ctx->domid, &nr_leaves, cpuid.data,
-                                  &nr_msrs, msrs.data) )
+    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
     {
         PERROR("Unable to get d%d CPU Policy", ctx->domid);
         rc = -1;
         goto out;
     }
+    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
+                                 msrs.data, &nr_msrs) )
+    {
+        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
+        rc = -1;
+        goto out;
+    }
 
     cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
     if ( cpuid.length )
@@ -94,6 +102,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
  out:
     free(cpuid.data);
     free(msrs.data);
+    xc_cpu_policy_destroy(policy);
 
     return rc;
 }
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 52596c08c90..8ac25581d68 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -458,9 +458,12 @@ int main(int argc, char **argv)
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
+        xc_cpu_policy_t policy = xc_cpu_policy_init();
 
         if ( !xch )
             err(1, "xc_interface_open");
+        if ( !policy )
+            err(1, "xc_cpu_policy_init");
 
         if ( xc_cpu_policy_get_size(xch, &max_leaves, &max_msrs) )
             err(1, "xc_get_cpu_policy_size(...)");
@@ -481,10 +484,11 @@ int main(int argc, char **argv)
             uint32_t nr_leaves = max_leaves;
             uint32_t nr_msrs = max_msrs;
 
-            if ( xc_get_domain_cpu_policy(xch, domid, &nr_leaves, leaves,
-                                          &nr_msrs, msrs) )
-                err(1, "xc_get_domain_cpu_policy(, %d, %d,, %d,)",
-                    domid, nr_leaves, nr_msrs);
+            if ( xc_cpu_policy_get_domain(xch, domid, policy) )
+                err(1, "xc_cpu_policy_get_domain(, %d, )", domid);
+            if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
+                                         msrs, &nr_msrs) )
+                err(1, "xc_cpu_policy_serialise");
 
             snprintf(name, sizeof(name), "Domain %d", domid);
             print_policy(name, leaves, nr_leaves, msrs, nr_msrs);
@@ -497,8 +501,7 @@ int main(int argc, char **argv)
                 uint32_t nr_leaves = max_leaves;
                 uint32_t nr_msrs = max_msrs;
 
-                if ( xc_get_system_cpu_policy(xch, i, &nr_leaves, leaves,
-                                              &nr_msrs, msrs) )
+                if ( xc_cpu_policy_get_system(xch, i, policy) )
                 {
                     if ( errno == EOPNOTSUPP )
                     {
@@ -507,14 +510,18 @@ int main(int argc, char **argv)
                         continue;
                     }
 
-                    err(1, "xc_get_system_cpu_policy(, %s,,)", sys_policies[i]);
+                    err(1, "xc_cpu_policy_get_system(, %s, )", sys_policies[i]);
                 }
+                if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
+                                             msrs, &nr_msrs) )
+                    err(1, "xc_cpu_policy_serialise");
 
                 print_policy(sys_policies[i], leaves, nr_leaves,
                              msrs, nr_msrs);
             }
         }
 
+        xc_cpu_policy_destroy(policy);
         free(leaves);
         free(msrs);
         xc_interface_close(xch);
-- 
2.30.1


