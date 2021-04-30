Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A836FE24
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120652.228215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTt-0001kY-Ku; Fri, 30 Apr 2021 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120652.228215; Fri, 30 Apr 2021 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTt-0001k9-Fz; Fri, 30 Apr 2021 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 120652;
 Fri, 30 Apr 2021 15:55:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTr-0001jX-R6
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:55:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e17ed7e9-646d-4094-a0fa-63fc2e859e13;
 Fri, 30 Apr 2021 15:55:02 +0000 (UTC)
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
X-Inumbo-ID: e17ed7e9-646d-4094-a0fa-63fc2e859e13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=t20EnpqKBlUzjHM5i+zlh4pmJDciRR7qXb3GX4KHcTE=;
  b=LWytefZxYqDf93BAww++kAAYT5UbM0vrvUcorKEwsPlx+W2HzWQqAELz
   CvqwJHFORo5t/y+Edvkxt0uW36dkRLq+/c6FiF4jeqf6q4htF3ttoMlSz
   cubX/Xuoe8UogUfYgNBc6PM/NgDyeL1ZEp0/1qvBkklMu5zVRmvsaFZEg
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XmvZSEfulV3vHW9Ck+CzUz6k4wE/Gtdcw79Wf5aNNZ8NuU4pNIG6/88Cje98wbVdh8AMnoHOCN
 dRrSYoG6szqblOVB+seXyFTgCX7qabNBGHZ3z46wVV9EKcwl0d2S9QRFc81FL1Yp9W/9NTY5X0
 vXnVt8TP70tXkM3qSTRNLs3WjkVQ/FeaRt1TN5niJXUtq+fG7pyZef+wJpZjr1OKlgG7i+aMHj
 5eGRNaTJpilptdc32IJUdFUKozb36buq2pgKiuyWmnw4vZ4zQinpSdCeTVzRFZJt9m782/ooiB
 xOw=
X-SBRS: 5.1
X-MesageID: 44331764
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UlZV3aDt1GAGz5PlHegrtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmBEIyycFVB7QxQDOIEwE4
 CS6tECiz2rf3kWacrTPAh7Y8HoodrXmJX6JSMXHhJP0njzsRqEyp7fVyKZ0BAXTi9Vzd4ZkF
 TtvgTl6syYwoiG4zDG0Wu71eUypPLAzZ95CNWImowpLFzX+3yVTaBAf5HHgzwvuuGo7z8R4a
 rxijMtJd565X+UXkzdm2qU5yDa3Dwj62DvxDaj6BOJy6GJJ0NZer98rLlUfRfD500rsMsU6t
 M340uju4dKFhSFpSzh5rHzJmFXv3Cpqnkvm/N7tQ04baIibtZq3Ogi1XIQOpIBECXm0ZsgAe
 ljAerNjcwmAG+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoi/A3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QSyvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSvGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erG8
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdVAoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYezn1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtGEfIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3HToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5YvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjcvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMdAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCL5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3dml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NDgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso5I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfC/A6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu/lZMfRmmIpA79Ij
 CkglZg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyOrH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8QdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X/KYAr+TV8Zi4
 1DfVERacoGqgBKtvxI7gGCDortokwklFNC5ypAjVCF4Pn/3Fvm
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="44331764"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVIDwR4oCD7Gwg/fgtdKqdN11Sf4qzymaKYRYAMbKfxzaADeox2SKltoYn26gWr1TxhN/B3mm/kScuB4Djkf0Rlg+VQjhA8d8RbR3/YIC6BKZOFcd2whm4UpmjsQTkVh1Tmcm+fG5y7mhq5XA79t2cFNdrl429No330SzhQdQUGXWC7+TS06J/VMCQwMFxPIwLKyJ4o6gz+8DcDClIrSwWtFLQGugpOQqEUK5qUSeZyAecksQyaxVDCfEyom5CcoqxDNbGLwoXpDK+OHYNHrl2lr4W8qB3nEBTvAPfNbgFkosv4hP27Ff61axELVHB/h1xhiak9z4a6Gs+dAlA2FUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN5vLdUrRPJsQKL4S9ockz5uFH49rwlndHZPbJDf0P0=;
 b=DCy43dh/j8yUkPwpn4sCkGammSg5LXvUS5y/QHsSeG5Oxn9GzmucQY0uxVjb9+tq/PHnmjd52nbJ7/64L/hPHlO2Mvn8w/Gu3N+FgINb7GVIoat2SWuk4GbvagTVoKt7/606HXcrxwoYw0mWKgTyTVrG98ibi7WqK/PEC+LgzJhHkmp5G5Qr6rxhmEeKZiXD6U+OVH2Q+EKR3lDS24Pibjt3OyzMdVOX1GngTBmRl8M8PfuDkvHHEXzY3b0pqjMVy2jrLLUIU5E5KZHD+XnXv/tkoEwUspBQFe442EkKYp9D7o9Pe2TroVDwGOABeC2ccsDUDBjgKvgnZfaQEtu30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN5vLdUrRPJsQKL4S9ockz5uFH49rwlndHZPbJDf0P0=;
 b=If739HcVR2x1/PB0vYwBhFAEY6ypAhGGKzYxJyxOL0sRorijVFNoo0x5nZyIoXa6PIJcMw/h0iCRXtGEh6yqudgQpwi8nCh7H8US+n7cVl4UCoK4WPXyu8O2SyCYfFZGeW8yQAtUbKjCAPuvN8LDQpRBeFsPv1pu9e0eXuYplxI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 12/13] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Fri, 30 Apr 2021 17:52:10 +0200
Message-ID: <20210430155211.3709-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d7518d8-e2b7-46ea-e2a5-08d90bf04598
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923806B49F873A430E615568F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKDMDn49+8BeMrcMfaxgvCw8GKx/Gh6pKGcrXdmuxJYEw9e38aC9X+WYJXnWc7ACspyUJDuQC6hw+MJ8O8qvbRrMmvAz8sg379QgjQR6EuEsElZonYbga3XELZcWBGA0thIf0d32QaWv6BSnaVWatik4Z7QcbNiFk45fyeh8ChQEwPP195yNB+9Ksk29iRAPidIYIHnOqc+jJ+sdmMKHnvN0xgBLMsndze303kCgGAaPvldUKuVvmjF4bNKGkGSJNZZLU4onn7X88CMNbRcIWaDIY4ZnT/T951y3+l4Y6EUIcBic3IoXL47c2+s0V1r0Dia04S7ZjPDs0dPTDLG0tYPTLjbKBndmZMNxpU+jfItNCipuEW+PD9LP8LphqiPp5cyJLLbv+2edr8ggubptA3OtdQ2zOnF9vAkHZjB1NWuJ3QsYqjogFH+CY1LXq3J0tsFi70UUKBIDplrgEvoE6ft14+oaBPDpJ7s/TDmLqhnuJkyhcVDf6h2rXE9x6Okf8rlxfcWqWI+x6emu2cIqPRHjdw2TRLXv2nT83pRe6KDrG9Po5F2wJcogh7O0uRxxQh2TEkTrx3cmb3z4Q5cGsnsYWu4J68ZMsmKNogQwaA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(107886003)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1ovNndSSjZhZ2tSeXdTcGtpVHlIOVFOUlVuUnFZclFPcDZFNUF3MmdBVkFH?=
 =?utf-8?B?WHFMeFo4R00vTGM0bGs4VHpyNWZOamJZWnhFRk1vcEIyRGRPSk9aSlpyenFY?=
 =?utf-8?B?RVRFV1czaDArM1dQUkozNVVNdUtxYVJ2a2JxOU5mWDVKY0xXUWR3OHYzajE3?=
 =?utf-8?B?Um5DWDB2UGR6a1ZJeDJLMkkyaG1BSFZ3V29WcEpBVlF5cFlCYnhBSG9nZ0VB?=
 =?utf-8?B?Umpzei9uNWZPTHBXRGhLQ2FSS3RpNlZPTWZTRFlHL2RtQ0ZJRkNDdlNXQVdD?=
 =?utf-8?B?eW1XL3hCWk1JVzFIeStnVVkwZ0JUcW8rS2FyNEtIWm9Mb0Exc01JOXpoRlJV?=
 =?utf-8?B?ZHE5ck02ZHBYeEVPMEZIYnpxaFlXNDNXQ3NMVFJYRHg3ems0S3BZMS91SUt3?=
 =?utf-8?B?UitVbEYybWpFalZlbkxabHovUGo3TGJTc2o3aHp6cXNDYjNwZUJBaEJ2dHJB?=
 =?utf-8?B?VUhQWW5UTTQ1SGVpdGUxYTY0Ti9ZM2NmVGh3RFB5SkpGeU1vbFBqZStTRGk0?=
 =?utf-8?B?Y3FUYVhKM2VZamVuWVRVTFl0dHRhdk9uM2hQd0I4bkp5WE1IUnYreUluelh3?=
 =?utf-8?B?N0Y0NEhibCtOMmtxNkNRdVUreEE0Q2JGcjJhVnl6M1ZBZVA0aUVJV1c3eFJw?=
 =?utf-8?B?WnpkeWtEZm5paHR3U2RKUXZFTWtVL3F5QmdlaHNTdG9pRXU4U3FoSE05MjA0?=
 =?utf-8?B?RWFDR1NhU01PWnNPV0dnSHE4TGNZdndiVFBDaFVkTHBFazhjS3lsQ1pQOTMr?=
 =?utf-8?B?TzdGeFJnVHVKTXVPeEdVZkpRZ2J2dTFsdVZnc1gxdEtjcWpjQ0kxeGUreXZq?=
 =?utf-8?B?UnNpZVJER3p3WSszOUNzT0R2ZWhmL1B5U2NmZkhJeXVudEk1QzdCSis0U0pY?=
 =?utf-8?B?WFBhSkkzcWIrVU1aZFNwNjRMNGI2bVZlYkwwaGxqMVpFc0pUWHJSTXdGZDRE?=
 =?utf-8?B?cy9XUEdxd2Fld2tUQ0E5eUwzTnVWNTdHQ1JPN1NpOWg0STB1UHh3RUhUWU55?=
 =?utf-8?B?K3FORTNlb01xTzVNSUh3d29kOXVqT1B0QzcxbDdnaHBob0J1VktBcXZEeEhN?=
 =?utf-8?B?RjBsMFhqK1pUNmFjUjdmbWFJZURlNEQ3NnBNQ0RMUStxTmZBOHlvbGlodGc2?=
 =?utf-8?B?K29MaWpBVVdIS3ZoamJscGRJTFRUY2UzeEIwR0VqeklEa0FMYU5OQ1dtbmFM?=
 =?utf-8?B?aG9IdEErbk4yWmlQYWNGSzQyY2FqeG55Y3YrYjBVc1p2cmRmZWhSdTZNMXJ2?=
 =?utf-8?B?TFN2Mjh1K1JDT1hud1BmUHFhdGMwck9FTWZtMy95Q1pmMStlQ2ZhTVgySmJi?=
 =?utf-8?B?d2lWYUtCTmxwMmVUbE4yc0wzemttYUZiMTBFZ1l3QjdQS242RGdiS2JtVG0z?=
 =?utf-8?B?TnNZUWtxUEJiZDR6MTRaM0RZUzJyb0sxQ0F6Z0dkU0ZDS3FKblQ1SWJKSU1I?=
 =?utf-8?B?OHd1UDNYeTFicVhzRlZXRmJMbzRiVXRSOEhLWXN4MnQzMnBPNllXN2JRem9S?=
 =?utf-8?B?bnl5YTN1K1p1ZnhiUjVURU16U284eTBUMFBzalB0N1dWd1FYY3pkUW0vM01p?=
 =?utf-8?B?UEtmcnRFdTBtNlRMaHpubEs1SlpRcndNU3F1U2x6SVZjNG1LZFQrdGVvL1JJ?=
 =?utf-8?B?M1o0YU93bGdJc3JIUytmV1l0L0ZmTk1ZSHRvTG5ldEVHRzIyemY4UUVrKzZ5?=
 =?utf-8?B?UjZZWVpQVWpZZ3FEc3pCd2VaemJRSlZJZ0JxMzhUYzlvNStuNkxNNGZ3NnMy?=
 =?utf-8?Q?kp5J3Q5ni0A2loQMQTwf7t5dC2ZSkyYxrLz5ue5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7518d8-e2b7-46ea-e2a5-08d90bf04598
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:43.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feTmyoWg0YPWjwPWCUveQ+5hlw8vJNx0orBe21RsS9WHnjp6bAFuYetGYgx1PqoKsPlToP/Q6QA1UN+XsDAMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use 'r' for libxc return values.
 - Fix comment about making a cpu policy compatible.
 - Use LOG*D macros.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 122 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  94 ++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 147 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3fef954d1d1..c6ee1142e8e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1890,24 +1890,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index e2237e33709..d00be5f757d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -413,128 +413,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct xc_cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    if ( restore )
-    {
-        policy.cpuid = *p;
-        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
-        *p = policy.cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = *p;
-    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-    *p = policy.cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index eb6feaa96d1..2489ceb49b8 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -430,9 +430,11 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t policy = NULL;
+    bool hvm = info->type == LIBXL_DOMAIN_TYPE_HVM;
     bool pae = true;
     bool itsc;
-    int r;
+    int r, rc = 0;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -443,6 +445,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGED(ERROR, domid, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    if (restore) {
+        /*
+         * Make sure the policy is compatible with pre Xen 4.13. Note that
+         * newer Xen versions will pass policy data on the restore stream, so
+         * any adjustments done here will be superseded.
+         */
+        r = xc_cpu_policy_make_compatible(ctx->xch, policy, hvm);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -453,8 +490,15 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      *
      * HVM guests get a top-level choice of whether PAE is available.
      */
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
+    if (hvm)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -470,14 +514,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
-    if (r)
-        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (r) {
+        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to set domain CPUID policy");
+        rc = ERROR_FAIL;
+    }
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
-    return r ? ERROR_FAIL : 0;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.31.1


