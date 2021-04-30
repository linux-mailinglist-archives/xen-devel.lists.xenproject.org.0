Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FFB36FE22
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120635.228192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTV-0001Qi-PF; Fri, 30 Apr 2021 15:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120635.228192; Fri, 30 Apr 2021 15:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTV-0001Px-LF; Fri, 30 Apr 2021 15:54:41 +0000
Received: by outflank-mailman (input) for mailman id 120635;
 Fri, 30 Apr 2021 15:54:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTT-0001HD-6X
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cb1a7ef-8314-414a-a12f-6e0fca40efc5;
 Fri, 30 Apr 2021 15:54:36 +0000 (UTC)
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
X-Inumbo-ID: 9cb1a7ef-8314-414a-a12f-6e0fca40efc5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Z6rM4sPpyB5WFE0aM6KS6fS53aeoShZ4p2FpkyddptI=;
  b=UBiJuYzwdVIdJu1kuPonAWpo5MeZiZ7yht20Kr+QO6LfH4+NIUESguW0
   9liYWOFipVzexzDmgn0dXEwVCSPvAhfNbgteOeH61JNeZlMRiasr8q8id
   vfj8BWXyGM9SB81EIz4NZtZvzCMXw0B+GGYGH+HM8jiU5t4RGeCl+ShQH
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fMD9tSFRe1Dhctu5MtT3XvJvvwXbQn91vi4L3QiHMXW1AcHWpaJcrNSndXzpdv2eVQ+UB/MyC7
 0v+oyb3QpqpSdWxlOixQuYvYQoQibccHk01xKP1lMOv/NI1nprOnqfT5ODLI5Ruc4yPUyks1RM
 Ofo4rQv2+ykzB20Owym7xpnlYV+xpcYpVLwlS8chK3VWLMwBw+pPd0ZMFfYK1s1kqwJLIf97hW
 UFRHn3jsuskz1d7yMjc/OTe54KJdodSLKNoiWUwU23lui+pwoUsam6w3YytItKX+vdmlbusggG
 OvE=
X-SBRS: 5.1
X-MesageID: 42930075
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f6cJ6a7sgggeMORbnAPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
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
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42930075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVozkcNqy1O0lDtWH/quK2qUi2V12PLKqAmRDDuzWcMaiVfJ0dy9xGaJEIO5PmtR9ifBJ3orTpbWhh9DWS5Q972JojUowNTfRHaDWk3GsSY8Sk+woMga62Nn8Tt0nUrGvbv6qV+C9sRpEm8+8PpxSYNlcPyCkfW4g1nvTtxjwS7MskVxGCThcvWy0BZg+E0H91GPO/2CO52kmcXlAGWtxJoHX+AUuYtMwU+03Bz2uo0aTbDnQhvnEHJBRjr3BDIirNN/WPGnh33N61hgcgUODw+rrrKJ/APEArY69BZipUp2PsQkbmFLT4LnIyV1hbNSG3+pMe4O4Bsy8ypOSnbQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a5L+d5za5DWdudCEWDZUtzQrAZyeZPsBE0hIe9r1IU=;
 b=FP3rGVzfQ1kk6X/A8EOzbu2e1IJtEnFdfaYYqxAo4uDr2HMrPdDi7SGieN7Q++7IXKb7xf2tNs3jR60YehfrEQBsFKlv2GaOONuyfi95MP/8hOSrvn9Qxty81oSlu6HjSE7GGKu0/s/Rioc5nTahRIXVSo3FR9ZPIUNe3gRAS2WDdfi3Syt9NxIRoTOqW+T+oU5TimUNiuvsW5fLRHnvPh6QdKaRfkTCLp/7zmL361dAqsr1uQtGq+K5hgr6oziOmFG5ABj5qOj2BukTzoUdUH+ddFD8VkzvO6u5wVfzaO+8T1iE87yH/bUXNBj6Ak+mzIPEIH+Rleecsa16+P5jFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a5L+d5za5DWdudCEWDZUtzQrAZyeZPsBE0hIe9r1IU=;
 b=jiDhTKTVcCw8bAJzJ6hPes3f63IyJB8G8Vi1k09Kk6QVZfTiwdQFtMzJFtyxKbVVXPaop45I4uTNbgm0Q9DAIEwP8BSQaM7a9mu0K21/DrmRxj+U1khGLWRZrq08mM7vFTX+uhj+is9EPEvkm72EXGbmOQWirRGBdWdZER1e7lg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 10/13] libs/guest: rework xc_cpuid_xend_policy
Date: Fri, 30 Apr 2021 17:52:08 +0200
Message-ID: <20210430155211.3709-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477b2cb1-6298-4fe6-a98a-08d90bf03ed1
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923F6DBDB6D1F81E8C4AD4F8F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2DWjIn5q6ZKtznP5rPpIuXJt8ah8wBVuvSZKAvC16YTkoQwyEU36orkDQ9ANOwwHG/voVfCuHmx66yeDoyvn7AygBGbxgoV+66cBzegqiz7uwlkVZrITxTg0jgs+8+NrqYKIV1hMghtkJ2gcSsnPB0UvsZXAJLDsILZMqeoOg2A/MHLQHWLhO8BbiuSPeXPIueZIeMS6YfDwFQ/07PdHRtYtUkilBi5gkJ2+iJrPGWe9fMyO3jRZ21V0I2aXDlcNLKUyMh52OsqPkuByNn+f4goZXuz3Gae046b/vrScGlvycv2m1Z3gdDeej3lQvYRj2w/yOcPqi7ej/TuF3kCB0RrQANOVrrr+pXdiOuOKDkKvTAMlOYYxBGHSEau0VT+DfPnCjPOWOz5UbkG31r/P6XKzsfr1nhAvSdJUogPXarTQb3YGIdsCqCqsiYko28EDycD4y53QngprvveFAwu8xAkD/xdznfViSXQMVRvidB9Wb9nPAsSdz+Z2nA15IDPgwS1j6NGllERKHNAJ4NLpTf8hOctNLclbkyoRjhYV/6zT3hjUXjkO0IHqfjhPIJ4GTOX+E8yPw256lQ7XmJTPrmChMH5LIJm013pwnMUiF3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0lPR21ncHA1WjdYeEw1Qjh6SXFmV1IyOHRhNFpLalMvUjdCdUxNajdGdk1R?=
 =?utf-8?B?SG0zem16N21qOVBFMEgybWRVdFlDYnVNaFZEcWZMRG5aWGNqOVBFTStFQlRR?=
 =?utf-8?B?YktoWi81Qk9BY1JXQXRUZ0xlYWF1U3F5SkRTT245UFlUc1BFU0Y2VkZhNjBv?=
 =?utf-8?B?cFdVaTF6V2ZQQlZTREtYTnZZUUlIV0ZvV0FFeFI2UVJJYkU4YUNyVTdhTFRQ?=
 =?utf-8?B?UndiL1NZT2NBbUlTN1BlSm1oS2lIcHRWUk9CZ0FocnAvcVdWRzdIb3d2cVBQ?=
 =?utf-8?B?WkowT1B4eVc1QmU2UVl5SmZBVzZhbXQzOEpwMnZnY2RKNUUyTzFYR0Rhcy8v?=
 =?utf-8?B?aEVNamVReDFTbmowLzhrNW5jNC9oUDJhblZDMjZueU5CaXQ1aFI3L0hDY29F?=
 =?utf-8?B?UklFRnBpUGFvdzFGYlJGOFE0SFJ3bU1udVcrSC9hT3A3NkI3WUlGa2ZkQVF3?=
 =?utf-8?B?dmg5cnR2Q2Z1ekpjTzdXQTBFQXZwTm52c1QvVlZJa0s4djQrUkV2VXF2dlRK?=
 =?utf-8?B?UWs3SWVoTkVydTFGUmFWZDA3UGtvWndKNTBIU0JpamxZSGw1bXhHeklJWlF6?=
 =?utf-8?B?WndhdFFMQzVrbEYyZnZlNDV5bjA3SXVWYnNnbG03YWJXQzQ1VGlicGo3bFVm?=
 =?utf-8?B?aldLZC9QVTIxbmFNUkdhQ3ZXVGVQSW5aSURtNzgzaExwbGszc0lROCt4cnVE?=
 =?utf-8?B?eWZLSzlwTVM1a3JYZWlicUxtNXQzellkVnVqWGw1bDRGeG5QYThPREF5MmZJ?=
 =?utf-8?B?ODNoNHVYTks2VUU3d2dYZWNBQWIzTzVFSGdNWDVhYVIwSFJLSk1YVU41SFZv?=
 =?utf-8?B?K3dxLzZkSklSTWowb2JsQy9pTkpBTVE5aWZXWFBCMHJRU2R0U3lLK3F3dEY5?=
 =?utf-8?B?NTUzbklpTklxRVlua1ZSbjQzeXN6VmdnUHJ1bGcwb2lFWWQrWUo1TXpEUGE4?=
 =?utf-8?B?eGZ3UHlNVTk2UnQ3eWRiRTVmWlBDcEhtbUpjWWE1ZGhXZlcvNjYzNUxnNUFt?=
 =?utf-8?B?MDR2L1FsaXBFSmYvRDNaekNRYmZ1Yk4zRVJSNC9aaFY0NEJGWFNURG9WRytQ?=
 =?utf-8?B?YlJSWjJmeDNmUGR0SzcvL3BSZlhXZWFkMEZYbUFkS2xmdUZzWlh2OFFEclpt?=
 =?utf-8?B?N1JHZVBmMmx0aURtbUJDZ0hIY0N0ZU10TG5WRE5mRS9qSlY4dTJQWFZTbW1r?=
 =?utf-8?B?VFdBV2dac1MvdFduSnB3Q1RSdEIvSWlEM1VzQjFyWnJoV0k5NkVUV1FTL3Mx?=
 =?utf-8?B?azBTVkJYVzlQRFlmei9WOFVwN0RKQm10VS90b3ZFb1hJRGZodEYwVFJCMHZJ?=
 =?utf-8?B?cDhuUFVuWSt6YVhVcmJud0hLNEI2akZhS214Wkw0QXpkNW1tRDIwOU8zaFJV?=
 =?utf-8?B?dmU5Y0c4VVA4ZForeW41MUxhYStmN2ZmbCs3WFp3SWRXODFCVVJhQlFqNGF1?=
 =?utf-8?B?SXpzaDhkb2tTR24vMjJsK2F1Nlo0dkZ4bnFMU0VJUTA0MFpGaDNqYXlLUXBP?=
 =?utf-8?B?a3ZNVWw3VFBacDlXL0pNN2h4ZU1YbGdpenM5SWM1clUyMXMvbnBlNEZtVVVR?=
 =?utf-8?B?ZFpVd3cyWExZVmlNZDdjQ1lIb1ZJWHpBYWZ4cHdvdFJpckgyMDNqa3VrZ0d3?=
 =?utf-8?B?SGwwdnZMSG9DVzVtVHZ3cmtzZVo0VXNUUHFwclUyMll5bTREanhaUmdBZmZO?=
 =?utf-8?B?ZldBQmdRU05nVEtNREs3Nk85YlROb1VYWjhhMDRZdGJINmF3KzNmZGd2WVBC?=
 =?utf-8?Q?rzpDuqnvJqt5YXRb4Jmr1GuzIXgIECicNCV0VlO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 477b2cb1-6298-4fe6-a98a-08d90bf03ed1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:32.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWdibR6sUlzYZNpQzqBLxCoApewI3mb+qAPmnberdVK01TyYdsD4JL8cEzurif6HhgUgwnyjsAXOY7wELIIyZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 ++++++++++++++------------------
 2 files changed, 84 insertions(+), 102 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ec184bccd3f..ce0785f7654 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2635,6 +2635,10 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index dbf2ef67ee0..d313a093af6 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -288,124 +288,107 @@ static xen_cpuid_leaf_t *find_leaf(
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
 
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
+    xc_cpu_policy_t host = NULL, def = NULL;
 
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if ( !host || !def )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur,
-                                               xend->leaf, xend->subleaf);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def,
-                                                     xend->leaf, xend->subleaf);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend->leaf,
-                                                      xend->subleaf);
-
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -413,25 +396,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -439,7 +416,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -559,6 +536,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     *p = policy.cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -576,9 +557,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.31.1


