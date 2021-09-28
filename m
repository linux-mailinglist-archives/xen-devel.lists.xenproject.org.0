Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187F241B8E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198475.351991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKEy-0004bb-M9; Tue, 28 Sep 2021 21:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198475.351991; Tue, 28 Sep 2021 21:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKEy-0004ZI-IK; Tue, 28 Sep 2021 21:02:16 +0000
Received: by outflank-mailman (input) for mailman id 198475;
 Tue, 28 Sep 2021 21:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKEx-0004Z8-1K
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:02:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a7e798c-209f-11ec-bccf-12813bfff9fa;
 Tue, 28 Sep 2021 21:02:14 +0000 (UTC)
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
X-Inumbo-ID: 5a7e798c-209f-11ec-bccf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632862933;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6UE6d1M7eYdCGTmwe2ZPJbBVHToWHugrAczuoQ0Il4I=;
  b=DfQiS/hwuqr8sIKLNkf/OSrVaxtBZ/HoX5LYt7e/T5rUxriWTL0+bE3a
   yxdOrPgzCvBglajlLPKHEUNiVTfpKD9y8qu3bJFDHu3mMDP/5sacpk/4J
   VVeSdlry5unlH8Z2LZ9EZ57LjEX9MkwBGz7Tuc+pYPHgfHbsKkdLOJNt5
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZpgM0Zh2jkKA71TlQpN5Kpw2HnqvBVD7uf2oiXURlF3gR+oVaT5BipZJlf5QWCk0FaMWf8clgL
 V+5DMbSeJtUjaAt6uoM8Z8OYS53zNYMB3WBBYW+lChC8td/00vs0tVfp+1BKtafHIzKCTTxp40
 QOk+ehQkJoEdSXyGCn/uzSJIhw7Q74DWwNPG3E+bWVgkWI9yewRKmH8Mexfo9W5LmBKakJOpPB
 UhEpx3Ps7RVBLiE1Y3Rt7YLZIseqhZQvFQfcLRuFOHY0LpH/spGc7EEBDXxVS8TuMmIa0e5CzZ
 WLguJW8XFvWlyuCcGhjXAitC
X-SBRS: 5.1
X-MesageID: 53453677
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+b6V2a947nyH1sfStR/+DrUD9XiTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GocX2rVOazYZWagLdBxbI+y8EwBsMLSxtFrTAZq/3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j0tYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+0
 d5GuZqwcT4IYIPMluQUczN0Sw1haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0VQauFO
 ZVGAdZpRAWePzFVZE03Mrl9u/y5pCHzWAV4lGvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt8G+oh+LJtTP2XsQVDrLQ3vRtileCgGEICBkbUFK9ifa8g0+6HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLq5AKeCnkBXyR2QtUsv88rRhQnz
 laM2djuAFRHvbmYT3vb67mVqC+pNDYcBWgYbCQAQE0O5NyLiIAsjDrfQ9B7Cqm3g9bpXzbqz
 FiiriIzmrEShs4jzLig8BbMhDfEjofNZh444EPQRG3N0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas8eH5+sCC5G1rQ3TbuUDHLiJzdrdHCKJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVkPvcACZRNGeYcyM9roVJh6pUT1PY69Ps04eOaidXSYmOWv0iZ0eQa01n3hnVIgmKUyU
 XtwWZ33Vi5LYUiLISDfegv87VPJ7nxirY8wbcqip/hC7VZ4TCXOIVviGAHSBt3VFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo8JYHK7LefVE6Rz5J5xrtLVUJINcNc0N9zLugw
 51AchUAlAqXaYPvc21mlUyPmJuwBM0i/BrXzAQnPEqy2mhLXGpcxPx3SnfDRpF+rLYL5actF
 5EtIpzcatwSGmWv02lMNvHV8d09HClHcCrTZkJJlhBkJMU+L+EIk/e5FjbSGN4mVHHq6pdu/
 +P6hms2g/MrHmxfMSofU9r2p3uZtnkBguNiGUzOJ9hYYkL394Z2bSf2i5cKzwskcH0vHxOWi
 FSbBwk2v+7Ir9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7IA4Vm2V
 0uD98N0I7KMPM+5QlcdKBB8NraI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsom
 L5zttQX5gqzjgsRHuyH1i0EpX6RKnEgUrk8ss1ICoHclQd2mEpJZobRC3Gq7cjXOclMKEQjP
 hSdmLHG2+ZH3kPHfnc+SSrN0O5aichcsRxG1gZfdVGAm96Djf4rxhxBtz8wS10NnBlA1utyP
 EltNlF0evrSr2s52pAbUjD+ARxFCT2Y5lf1mgkAm2DuRkW1UnDAcT8mMuGX8UFFq29Rc1C3J
 l1DJLoJhdoyQPzM4w==
IronPort-HdrOrdr: A9a23:st5XNa0otwey7ArKyUdZVwqjBSVyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQiDuRYjzrY3GeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="53453677"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaaIF2OTHUSoBpozmdiQ329EwYYmOHxJDwlaaQxJ3tGUh3k2NuHSollODHbXI91sHUdUbrh1K5H7v+Qz+Rj3H/oFv3sHDTXlZFFo+mL+V8yUJ2vuYnycofXMTgSkPHF+BZh7w+ycpyaqPrDaPoWM9vAYVoB1VEcC4jO7BQH3ohbdmJp4ayKOfVywvzFbbPyfKq57OoTFrgPDRfFSCFvS1wo0kjPXVWLGXOctZRmAjTWqIA9fw5wS1ZC6j1uvSSe3yQap1B5liDgGw4NTGPRjwil+hlxFXGSIZ70ocwRIyoXS11Mq7IdWAnUoMvqMuxdHQzvYYy6pBnsN15wU/QMx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6UE6d1M7eYdCGTmwe2ZPJbBVHToWHugrAczuoQ0Il4I=;
 b=VXQIg1FB/n5cq2v9YbYcUorL1oZU13YmJLIYmYmQRP6Z0et7rIit/ugbzXZO2pyAUn+C5RjGfwofGv49fUk7fZ35u9lSrdCsOnchtlb2EgF1VAJVM0+xKQJqxGt86diZp7SAA7x8IKjbbFlv1oljJETOp1qem3JtjDPtgaNnfqV408MiBWZxwwwH6565kxhABoYwr0DAb8VnVcfWHeW93FxOovDqxepIfaa99sHTbUv2cO6uDeHmnk/kcuHAPr9R+EF8I2U33amXkaLQc1RixowD5vNZlVhApMwfNU7zL3nmxPaRkTAPEqXmYMDzEfi3Z7PVS5tp+XSLlqN0OAN9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UE6d1M7eYdCGTmwe2ZPJbBVHToWHugrAczuoQ0Il4I=;
 b=cgL55hKiK+TeflAJ4i6hAdWk3RKEaC8TL0OsdCbrMZs2d8rlTWPN7Y/np4py1Qc7yFTxU7IACXW1nkxQkHXDmqYx0RnRZFEsY8DEMotIXDz/B4P1K/E1yWhMZiWsGWsot5bqaAcQe075hpnqJQU2edFy5azy3QxuQm64CuUlI6g=
Subject: Re: [PATCH v4 1/6] arm/traps: remove debugger_trap_fatal() calls
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <05ff86aa-8db7-908a-1b96-851c110e399e@citrix.com>
Date: Tue, 28 Sep 2021 22:01:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0432.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae4c5457-4322-4f23-a101-08d982c33b23
X-MS-TrafficTypeDiagnostic: BYAPR03MB3429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3429F59B6E88A7C992B56C4BBAA89@BYAPR03MB3429.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:215;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /smxpm6rdL+WkFCXusJzEyzfoDKysVPJlcYKikqZvJAVA4FJsL5ZYnuYAi6y+kVQTi+6If2UdwNqtAKS6tI0Jizz0f/QpYTn5Mcr73UItIk56gMGQ4NyJg3C2C43dnv5cRDi1mtCcabJUFx9CWHR+XNYAtQWrIFrt8cKxCwSjVDJJMhk6a0WtTyccDw4VFvDxv1nXEztRMKqj2MKQjQT9ZcX7spjZv8LhfM7JaeYlht6dz4AraT1s8b8aNVDz50roU681Q6+8NCB2gHszvwf236w267We2b5QRlKDK6ElBY9f9xO6JFmtFimlxXys+Xzw0Alx2xCD3pIPnGKuOqrVn3ah7tTX8l2VcpGzEa4nsmA8cc4v02ryj0wdeqfO/joC9Jam+CSDwj6WSoUTJ5Wi/1s/CkXKmQaLuulgvl4fXDMst0Ve2I5J/U06ncMlHEW8vbkyP4oMvXl449p8WEB8C0gwban20WuSJ+GbvhRAMfgSL/iiM9gE4DHdLuoo9ZZ+UUXECZHUEvEi2X4iUUBxCOiMDbb1QvpshKhz/uLEcRdtR6j2VuNKqrcey7WXOcPeiaAjfbI6jxsu9fi8RQ2OtmSuzAJ+qF5c3F1DtU0/cWL8yH+YbsM1orsp/PYUt0dtkxMHxnJPfQH/S1borMVQcBolwU3j4+GqgqGB3owDPU/nHvx39WGyb9k3Wbiwd26Xnh24lGI8hYiX8XpHue55b5lf3+C4FI4HYIHmt9OZojdQI1AqWwgqWVBgBz3I4oT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(31686004)(5660300002)(186003)(31696002)(55236004)(16576012)(36756003)(66556008)(86362001)(316002)(2906002)(8936002)(66476007)(53546011)(38100700002)(26005)(4326008)(66946007)(8676002)(4744005)(6666004)(2616005)(6486002)(508600001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU11NFc3dU16SkRmdHMzUk5NK1NML1hmdEpHV0lhVDdSZE1PNkQvNDhmMXdQ?=
 =?utf-8?B?NlY2NzhMQkFjY1l2NS8zenc3L0pwcTBFNnVRY3g2b1hpcm5uUVB2TjRtR3V6?=
 =?utf-8?B?bkRxY2E5UGdvV1BFK2VWS0ZHclRGOXhjM04xYmpmWEI1dEFhTmp3ZGRoVjJy?=
 =?utf-8?B?SWk4SVp4eldpek1wYTY2WTZKWS9kaUs3TWdGbGVuWi9iU05xZGk4UFZkd0dw?=
 =?utf-8?B?Tjd6ZFQ0RlFVeFMrWngzWGF1RWdQWnltcHN0U2NLTEpCWWVLcDY4clI4clgr?=
 =?utf-8?B?NU9sSnpydTNSeW9abkhieWpMRzdCT0xlYU5LZGdReTIwN3lNMjd0UC9uRWJG?=
 =?utf-8?B?VjFLZ2YwWFpjMG9xcHJUbHpOSVJSdEpYL2FUMjUyL1ByV1VUM1pHZ0ZCbi9Y?=
 =?utf-8?B?T2tOdGJTTWxJZWxFaVE3em1zWTNWQXpUei9ybllYdmZibmZ6dGhNTkNUTThF?=
 =?utf-8?B?blJ4eVM5bmZrZnZ4dFlmMWV3WDJDRlVPYXBxUnVGd0JBZDBoMGpWMTVkYWxi?=
 =?utf-8?B?dnJIVmtkZ0FPcFlGRXd2VmdxR1hBRVozLzhkaHA4dFQ5MjZERVZaengvd2R6?=
 =?utf-8?B?RWpVT1F5TXRvYWVoL3FjdGh3SlNYMTNsZnY2ZFQzcGlRS3ZzNU0rV1lWM2tH?=
 =?utf-8?B?RFV0bGZIQm9od1l0eFdYWlFSOFF0OUpxSFdaTnFmSlAxV2JkdVR5SmgyVkUw?=
 =?utf-8?B?aVNkcWRjVlhDQWtOZXZlSWdrdVJQNlpkTjg2REM0cS9LMlBaV25iTDN3bUgr?=
 =?utf-8?B?My8zNFUwRndxb0p5YlJOQTlPM2dFZWpNUTI0TStNMmRmN1Q2R3lucFkwczUz?=
 =?utf-8?B?OTZkNXBtbUErajh1Y2VqRHhSQjJ0bWlGbklMQk9DdVMxVmFCNUxscVBxUFhi?=
 =?utf-8?B?Q2xxRGtCTENkaGlLWjFEL0ZkdmcxYnEyc2w0ZldGYUtKU09PdkhSRm1EbjNm?=
 =?utf-8?B?bk9RRnJCSFkvVTh0RUFmNzVUSzZIOXlOeHVEQlAvUy9KQlkrUTVubjNFVEdZ?=
 =?utf-8?B?VTV2K0ozcXRrbmtpeHRYKzBPaFFrd1FrdW84aVcyWUF4b0ZMN082L1RSc0ZP?=
 =?utf-8?B?VDlUTUJGOFg2djBCZnhYYjJ4bm5MLzhueTl4STRraVJuTlArTk5TSzgxdVZJ?=
 =?utf-8?B?OHZyNU5qMFkxMjZIYUJqWlNEMmNKL1h6U1dTNGlReGN3NC9mM3hjanpBeHFy?=
 =?utf-8?B?WG15UHQwUG8xVkcxUHBDV2YyZmQ1OFM2eWlsT2hST1kzZHpiSkJpTGNXRkhX?=
 =?utf-8?B?NHlNelltMXN0S3dWNGFSU0JOQjVKbVlCeHB0NDFYWkxzeHNGUEYySDBpMHlk?=
 =?utf-8?B?a2ZqTjRhZUM5NGFIcnQyV0tRM04xYUZEUi91OWdaZk9JbDZQVllLbnZYT0ho?=
 =?utf-8?B?NmU5UzFiRlhteUx6MmVhT1ZYeUVNREU3WnVVYWtOT0MydEZMVFdpbjZIbWRH?=
 =?utf-8?B?SkF3REQ0SmhQa295Q2ZXZXg4RUV0WTRMeE5MZkhudkJ5aVpNTGNmeDZlMkxt?=
 =?utf-8?B?bHlWaVZrNktoZDJwcVQ5MURtY2JES1o5aHk1S0NhSUhNbWxaMlRtclBnM2ZM?=
 =?utf-8?B?RTkwTEl5M0ViTkxXTmNzeHVSRnV5OFFpRFpSRThpbEVrZEYxTDBGYVJBODFG?=
 =?utf-8?B?WW9adXJKQzJOdHBnNjJSOE5tWHllK3FPbDluaG9NdFBkRlpId2I1SHB0WDEv?=
 =?utf-8?B?VVNWcFZlWDlGbjZXbytlQkxDalhHY1NjejR5VzJYWmJ5anhhTWc1bHlCZTRU?=
 =?utf-8?Q?9ieKb/dzLAtKojN2DMh+ZrjntnZ0LkmDgtYjTZL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4c5457-4322-4f23-a101-08d982c33b23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:02:07.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKuIYiKQytC5vk9S3DS13WL0zqqNbx/C/egjoGV62q6izrbq3MElLrufZufW2HV5xzr2wOp7As/rPB+a4vMMHT210B/eD3JJ0poDIf76qz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3429
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> ARM doesn't actually use debugger_trap_* anything, and is stubbed out.
>
> This commit simply removes the unneeded calls.
>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Julien already acked this patch on v3.  You should carry the tag on
future revisions.

Acked-by: Julien Grall <jgrall@amazon.com>


