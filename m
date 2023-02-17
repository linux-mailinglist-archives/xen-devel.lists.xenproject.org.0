Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E469A9FA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 12:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497025.767956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSyfi-0003tC-1J; Fri, 17 Feb 2023 11:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497025.767956; Fri, 17 Feb 2023 11:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSyfh-0003qp-Tn; Fri, 17 Feb 2023 11:12:57 +0000
Received: by outflank-mailman (input) for mailman id 497025;
 Fri, 17 Feb 2023 11:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSyfg-0003qi-IS
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 11:12:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05569297-aeb4-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 12:12:54 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Feb 2023 06:12:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6990.namprd03.prod.outlook.com (2603:10b6:303:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 11:12:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 11:12:47 +0000
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
X-Inumbo-ID: 05569297-aeb4-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676632374;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:mime-version;
  bh=gKJYXNh7M0FtffvLLmo9tqFjQPvGHUA3fef9zCMyXKc=;
  b=KOHx2LGwvqs3Zut+4nLX/WUX/XkKyxxOkF34R4Raf2+kmLP1DuwZRcQE
   eDYJQGcxlgPsLwvz/bwHT6dfNGbNbTochsKYj4r3AVBmxAi99Xs9r22uX
   D9nsZNgAy/WbyUPEOW4A/3HOwvdShhvIUG/Wr8T03XDV53zJGYw65kO1+
   8=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 96845219
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xI6trK74p4KTQcyor+T+iQxRtNXGchMFZxGqfqrLsTDasY5as4F+v
 jdLCj+BMvfbYWL2fdl0OYy38U5UusOGxoUySFQ/qSo0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 M5DEjcGNxe5h/OG+5iDT/RtjOUaI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+CF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNMROHlrKc76LGV7kk8UScPSgqrm8aaqG2VYI15N
 kow9gN7+MDe82TuFLERRSaQr3ODpBERHdZNFekz8CmGzq3J70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaGwIYMGsDbi8sVhYe7p/op4RbpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pdEP/7W2+xbAmT3EjprUSg844C3HU2Tj6Rl2DLNJfKSt4FnfqPpFcoCQSwDbu
 GBewpfGqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:YkNqWq04kqULmW3N7dN8oQqjBGAkLtp133Aq2lEZdPUCSL3lqy
 mLpoVh6faSskdoZJhAo6H4BEDkexnhHPFOkOos1NuZPDUO/VHYSb2KjrGSpQEIeReOlNK1jp
 0QCZSWYeeYZTNHZITBkW2F+r0bsb66Gc6T5Nv2/jNEURxtcK146hcRMHfnLqS0fmV77FgCea
 Z0KvApm9NoQxoqUvg=
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208,217";a="96845219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRDBG1ObGV/YFl/O9ivrmaiCUVyYL4aLkMogbgw1OHfU2kLJElEIQolKyk5NgjIV62iXtaNZv0sSkqvzLVNjOyP1NrR8SWCAm/ZFCkaa+lEVgg81Y1CCwncm2478FC84qs3LoZIxUUxB1s9L6ISENFvSIQ4xUl4/5zfVofAsEMmFH8Zhd6WBZ1xUCN2N4Ntqp/ZZOpcl86ViCpvDdC4UAMvgEQV3UT6Nz4ogKjdMmHNzq8HZKDssOuh+D2qzkNVLti9v4RaDSBtyl2F1EVEi9L/5cR7+nJud+eJuvMKWofb3iuvPhe4s9CPaFq+0gXtk0UBXU/IMnIG2LnApsc3vpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qptmatrl1jrfmwiJYqpMfXHZ3BDToA7+rN/yVyHhoTM=;
 b=jrvYnH2tLZ9f4bSEkpFUEwLnlZDw/HwgNg08Rsib186ZjShOLi0t8VrmVjJYSFUK0qQVHKUwD795eXFv37c2oimKUlg5qd/9cPkCm/6UHtEvel4CQ3TABEfg/Fazr1YIZllWa72IMKEKb59zJEm3cz1g3qx+Vk6mSSse78jbBhvY5e+WCqqgn24Bkdv97mLXy62btm8BcCgHl34H47XghbbgN/L4lOaoy+XGG6BiUqD6DvHcQxQErkrps1Pr2nmmyqj9xeFOs4NLd47tkAIYQ7WVf+ZjM9o2LOM9mQUbiWkIqrtPz1O3T+PTGS2lxYMVcKbH0DKoKk3h3M3AEhtdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qptmatrl1jrfmwiJYqpMfXHZ3BDToA7+rN/yVyHhoTM=;
 b=jQrrxin/msMRW+ksdzqj5e86kS6LuqiRBoWjvhLDjKq08TzVsTutaG/hQbkjwLT05tMPeB7QgKDlDYQkrqcSOdCJpdvp1ZxO79R0XDiR8URtzrTBFrfmKJipnlGg3jtN3H7xyxXgJFLOik71RQsJmv8xe6qAr6HEsoxAVGuT1Ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/alternative;
 boundary="------------LqKo3VsnUwEadxeTZXot0vMz"
Message-ID: <a6f89182-7fef-6342-e0df-fb122712dfe0@citrix.com>
Date: Fri, 17 Feb 2023 11:12:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools: Remove the use of K&R functions
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20230216231636.714006-1-andrew.cooper3@citrix.com>
 <CA+zSX=ajuBw6GmsyiNPN3EJ5_KYafUxNX5fTpbAY=4ByE_Z25w@mail.gmail.com>
In-Reply-To: <CA+zSX=ajuBw6GmsyiNPN3EJ5_KYafUxNX5fTpbAY=4ByE_Z25w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: e233a8e5-82a9-49e3-a810-08db10d7e693
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bBM0Ujn429JT1kcEL5ICt+rpjCihyU3sMSYnGJUnsBd4s5sHe8qinWWVSGOk/tUdQriiXg0CK3+JeuPtwWfh5DWx+NvDdhjgoY64x6Rf8M3PZyl72O5X2AuP1RBj7duqNtXksXYJUK++Gam6AxYWatb3se+xVtCjN824hpBiTzcA0/nAFycJ3QCt1Nm1E3h9SMBmCfcSs33QHyH9hBlyH6ZOYAccboCaniZgcnZ4kR6Gz/NUDtcwBaJ6/ZyoQC+eGONSHQlKBo+eVoh/oO6pOFPRSZLFO9IvLEQPuqgEn7gsBaRsqx6UdIOc1sFbCXl1DxcG2jc0iMx7UwlAf/6ea5NkoCAJD2XnExyIOcCE6nofxDTC7kf0LPj5mSi7eZyPugg+5VLQCgbhZLyGv0WwjJvHD8vBNFZonuepEZbz8iStUxV+/RDO0zVq2tG0Y0DoNGlb7F3dmxcu1NJsx535kKsSEun4yTTnVZpeDceT8eCiEBH6PYO35oZvGfDvu2NMpweJH05nHH9P9iw9sN4+85q6qo2z+Y7uwGpXUoO4T3Ry93O7As+iSlqHrOVM4885YtXJMWwPyWL+E7UWhnOMGsbitLMtZXP1ZPw/Yc84ZzpV/o2h0qgpYuUjmRBLWuXB+Vaewr5vxvRVcdY41a0z55IvVm0RMdTzQQWLm5cBTRxe/cxUN3qh/9RiV8gINovYDWEJ9Zfq7V6XLcOiHCj27sIUF1Obd6On6HqD3OIw4oo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(83380400001)(2616005)(36756003)(82960400001)(86362001)(6486002)(478600001)(2906002)(31696002)(6916009)(31686004)(4326008)(316002)(41300700001)(66556008)(66946007)(66476007)(8676002)(54906003)(5660300002)(8936002)(26005)(33964004)(186003)(38100700002)(53546011)(6666004)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckd5WWx0RkVKMlFPaVROQUozcXd2YUgzWlJJV1NQUnBvSkRBaDVuWU05SmFT?=
 =?utf-8?B?UzJPVGEycnVKMkJDTnMyc29EQW1Tcm5QY002TEh1K1NWdWtoelN1NkNTNDA5?=
 =?utf-8?B?ZElVZzZTQUtqRU1VcFVCbnlKMHh2ZE1WMCtObU9udjdDUUQvRnplWC9BczdF?=
 =?utf-8?B?OEVIWjlHdzZrZ2p6bzJ2WE53RXVUWDBqR2ZBMkswMmxNZXFKNWFpVkFRcGtS?=
 =?utf-8?B?aVFGbFFwbFBMc05ZbHMvYWpkU3hTVXMzWFBHY2VEa014TGFZZHdBQ25SVzlZ?=
 =?utf-8?B?TTREc3dVVVljWEZIdFcvMGh4L1BibGFjb2NuNEw5ZTRWYmtKR3k3bzN3ZUs3?=
 =?utf-8?B?R2E3aHVNRGlIdlFMN2dDbW9YaU5IZ0c1dUpZUC93ektDMUpvK3VkcTVvSFdt?=
 =?utf-8?B?UjhUb1I4d1lTdjV3MkJENUxMZjdNMmc1UlNIS01jSmhpRm1IZWFJakJxcGlC?=
 =?utf-8?B?Vyt5SVFQOVZNSGM3cXJSV0MvUnJvT1lVbDI4UmVGcTlycXpBOHV0ZG0ya2tj?=
 =?utf-8?B?ME9BNjhrM21VNjZBcVljaWJzc0MwYXF1ckxNWDJaQUJ4YXgwbmlhZzlCMkJ0?=
 =?utf-8?B?VmxKMGJZYTVRMWwrNUFpU2ZLclQ0R0ZldWdjTkpOZ3RBVU9QVkZicGxibXVV?=
 =?utf-8?B?RmpRcXZ6MVJxZ3F2MW10Rkp3QjF1bUVvVi9YVjRPbm5iQktldVZGS0k5WjBF?=
 =?utf-8?B?Ly9tbUNPRnR6OFNVZHN0YWJSbTBBTm83VDZZZDdyTUdSL2tNNGdJOHlIRnFj?=
 =?utf-8?B?Zml0T0ZqWUpXZG52cndjZmlVOXVMbEppTGFPcE8waHcrbXpBY3VDZk5mM1dB?=
 =?utf-8?B?NFpib0phZHp5TFRob3JmZkdyNUVFdFdndVpNVlRpeXczam9WRS9VblRQazI0?=
 =?utf-8?B?WStpQ1hKQ0x5U2xLcXBoNWpkTisxZEI1SGNjeDdOejFWMm5uOWV0Qmk1WER2?=
 =?utf-8?B?cE1JVy9aYmttWm5md2xoY2szRGVMNWNxZlBDTVc3MERodWpOUHJPTVJKQ1ZI?=
 =?utf-8?B?Vmx6SUpBb0ZmbDlDamNSQmFMcUQyUmsvRUdGM0JtSVllM3gwMlFjeVR6eDdW?=
 =?utf-8?B?cE4xd0Q4TTF0RVdmNzVGSWttYVdDc0VINlJDU2N6a1dEUnduc3ZQanlieGRY?=
 =?utf-8?B?eHBQbytqRHUrbjVjTko5SGthTGNSdDhFU2d4NUFhZkVXTjY5ZS9rTlJSWGJB?=
 =?utf-8?B?c2ZXNjdVcisrTVRHR0M3Mm9YZ21Hc3VWTlhud2F2ZU5TMkIybDRMWGZmeVhD?=
 =?utf-8?B?MVN5a0RZUnY3cERWdlBCSmlUNkdEUFZ3R29zZXBuTCs0SkxCelMwOEdEaWJU?=
 =?utf-8?B?VlFZNTAzL1V3SFNReWZaZXhQRC81Q3htMXA5K1FYWVFPSHc2bkFrMWdobHVQ?=
 =?utf-8?B?dy9LMGQrdUxUNVB2L1VpZzRERFdGMHorcnhzMkVVdk9CYnZPQmxBcE1nOWh5?=
 =?utf-8?B?ZHp3bDdObk9SbHJhK1ZwR3U3RWRUV3QvVTdsTUNmeVVQcnE4UjhYNncxeEd2?=
 =?utf-8?B?SnhZMUt6L1ZXVENEaGhwV2JNc2xVblNWL1dmYy9VR3pHMVFSaHNscm9kL3NI?=
 =?utf-8?B?dzJnbng0ZDhoeERnZHo4c2h3Um5zbHA2MnhxZDIzYjZZT1R4SnRuaHhQaXhj?=
 =?utf-8?B?TWwwYllLdHI5STRJTG1RSjR1VllaVHFSQ1lZRS9jemtLbHNHNU1KRysrWW9M?=
 =?utf-8?B?T3pNT3VZT3M3MzVnYkxXSkRub2VCalk4YTVxcDNTK0UyK211M0QwYnc3Qi9J?=
 =?utf-8?B?WHVaTXg2dzRPRk1USm9na09WWGl1aTdpeDNjWkYrTGovVGt4UE5iVkZsR3I5?=
 =?utf-8?B?WG5rODhpVHhlSmpmTW5JKzdSaXBtRXoxTFkvWUFEdkVpMkFvRitlNHQ2WDJV?=
 =?utf-8?B?d0JibFpiaG16c3NLakFEUE1lSFlvYXN2WnlhZmxqcGtwNU1sZCt6K0JNa2kz?=
 =?utf-8?B?Wi9nOFV3QWVDK0FnYjVGcWdhQnhqS0xQclBtUW9FMlNFSTZ3YmcwbjVuWVZo?=
 =?utf-8?B?UlhFQWI2eEpqYWp6SUVEM1dXcnpEMWNrQ1o3Z3lxWGhXSjlvZk0zNHFhS29I?=
 =?utf-8?B?RndrZ0ZKRTY0eU8xdDRjR09XOERrUEFZWkpVcERuUlZ1MWFaNnVTeGRWSmpr?=
 =?utf-8?B?blpxZU5iQzE3VDV1RWRhdE4rbEs3SmVwaUprY091dTBiTnBMN3YzVjZYcTRL?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+9Ti5bl9H+rhdOOBFEIH4WowUGwNihdJ+YqAWOQqJpccrqC9IPtW2G/IVz2YyDje9dVjZTf4kTMr+mnheW9o10+MdGoZFg4tGTKXLNYAdd0qYT5ERpf2LLU6ys7bO5e1o1ffU3jxD/NtdsWOlMbCXRj+h+ZBgzZ84qHrYFV+fFBU1ojko6FntCQNf/pd7cWWQ5Sr44qT74CdfROj6hRKejpUds3wuSxukpSiu8Pq050KAKEPZexlhK3fHSq4RYuQ9nFqdKnlazokBrh1LoIeOlgHBuJ7pJwkkZh2CUBk/d9922IN8t0fdz3KC9rMEtNWu0GOZqRVX159sEjnOWVly873UMS1lgQss2e0eA8p8HSNT7Jx/H6J1Pd5eKx4QGpANumVS2G+x8dPV0MQdLsfjWFbrQQXJE/yk71fDzn25cwE7iO59jj2jjvZ2/IByqYiwDOG9S4TIE7NBLxynuPPgOsUDfmVbRE96RoLTIIbZp5iwp+kyRCt1nYcnjGOPyVAJeXPwtecyZktWjLFoVXP2pok2EMqVDBK2A3fbs5pdCZAKgcUSz7bpza0MNt+GEzNpMGvL0p5IbxJnWenGPJgJfjfXZ86F0RBHaq1dnnbPa0u94sqKPETZZmzHrpNUu12VNwe2xs/j+F5+eMp3ZzTvYBr3KkGbANyiEHjscE3+A+r1nuNIbNwlQc58G5DsjmfM7dRJnAR2NeDlthl+vQQpW04OM8EILqslCLGseF6vnFFh7UbjDSLq/IzPxNyWWQrDkZ2GoXHfiHnWl8KKjFPssr/5sjSAnnZCy/XCeaq/wyd8Re3ar78p4eok8yngRcVv4i+hExXhuZ78kHo5Lg9viRypbhVaaN/o/2U8WIhcyej0y8TbJ6C7zG/mHhaJodJ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e233a8e5-82a9-49e3-a810-08db10d7e693
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 11:12:47.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7VbjwQfTBDggLwb9/okr+tw5sSdrKEjiXaivTB6km81P151oz2oJqYFB3awyD7AV+AdDukiJrvZz1AyBBnQArhZW8kfTUKsmmJNiBNBbAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6990

--------------LqKo3VsnUwEadxeTZXot0vMz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2023 11:10 am, George Dunlap wrote:
>
>
> On Thu, Feb 16, 2023 at 11:16 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>
>     Clang-15 (as seen in the FreeBSD 14 tests) complains:
>
>       xg_main.c:1248 error: a function declaration without a
>       prototype is deprecated in all versions of C
>     [-Werror,-Wstrict-prototypes]
>       xg_init()
>              ^
>               void
>
>     The error message is a bit confusing but appears to new as part of
>     -Wdeprecated-non-prototype which is part of supporting C2x which
>     formally
>     removes K&R syntax.
>
>     Either way, fix the offending functions.
>
>
> Nit: This says "functions" (plural), but I only see one function being
> modified in this patch?
>
> Doesn't matter too much but might save an archaeologist some confusion
> if someone were to fix this up on check-in. :-)

Yeah, I pre-emptively wrote the commit message as tools-wide.  Given 4
in Xen, I was expecting to find more than 1 in tools.

I fixed it up on commit.

~Andrew
--------------LqKo3VsnUwEadxeTZXot0vMz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17/02/2023 11:10 am, George Dunlap
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+zSX=ajuBw6GmsyiNPN3EJ5_KYafUxNX5fTpbAY=4ByE_Z25w@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Feb 16, 2023 at
            11:16 PM Andrew Cooper &lt;<a href="mailto:andrew.cooper3@citrix.com" moz-do-not-send="true" class="moz-txt-link-freetext">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Clang-15 (as seen in the
            FreeBSD 14 tests) complains:<br>
            <br>
            &nbsp; xg_main.c:1248 error: a function declaration without a<br>
            &nbsp; prototype is deprecated in all versions of C
            [-Werror,-Wstrict-prototypes]<br>
            &nbsp; xg_init()<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; void<br>
            <br>
            The error message is a bit confusing but appears to new as
            part of<br>
            -Wdeprecated-non-prototype which is part of supporting C2x
            which formally<br>
            removes K&amp;R syntax.<br>
            <br>
            Either way, fix the offending functions.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Nit: This says &quot;functions&quot; (plural), but I only see one
            function being modified in this patch?</div>
          <div><br>
          </div>
          <div>Doesn't matter too much but might save an archaeologist
            some confusion if someone were to fix this up on check-in.
            :-)</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, I pre-emptively wrote the commit message as tools-wide.&nbsp; Given
    4 in Xen, I was expecting to find more than 1 in tools.<br>
    <br>
    I fixed it up on commit.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------LqKo3VsnUwEadxeTZXot0vMz--

