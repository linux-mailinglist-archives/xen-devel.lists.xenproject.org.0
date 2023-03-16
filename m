Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883C6BCEE1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510532.788340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmJ3-0002Xp-M9; Thu, 16 Mar 2023 12:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510532.788340; Thu, 16 Mar 2023 12:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmJ3-0002US-Il; Thu, 16 Mar 2023 12:02:05 +0000
Received: by outflank-mailman (input) for mailman id 510532;
 Thu, 16 Mar 2023 12:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcmJ1-0002Oh-W7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:02:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d700e7-c3f2-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 13:01:59 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:01:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6695.namprd03.prod.outlook.com (2603:10b6:303:176::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 12:01:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:01:39 +0000
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
X-Inumbo-ID: 59d700e7-c3f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678968119;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RJw5gKtZ0aOCvmg7K+TiE4jbPkZSxmCsDXw8GHxM/Yc=;
  b=bKPqtORsMFRSPomS1jI/ZtTHHeR6Xv4ay6+AVv6AT8EryXLwPibvOuNx
   7TgOfUK7jxITJOVAR1vWTDkzk8EadBWn3Y13VhqkbcNN3uYV34o1/U961
   6GR3OlmtSJr6D+7flE8qEsqwqIqOfh2dXxtVHfTGBgZoCoGLdAix5YqaY
   c=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 99907419
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V2Lyqa+69jZTH2snRLTHDrUDJH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GEXXD2FMqmOZWbwKo9yb4y2pkJUvJDXytRqTQE5qCg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkV5AG2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklK9
 KMqcxUyZCyZrPio5PGUTulNt508eZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUuj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdNDTOLkr68CbFu7x2w6IUESV3SB+fialnzuR8tUN
 04J0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqYj3aih4UrOhT7qo5HTVxM0/S3eRGfj5QR8DKa7YIiv5Une/Ox3Jo+TRVmcv
 1AJg8GbqusJCPmlkyiAQ/4MHfeq+uyCOz3fhnZgGpAg83Km/HvLQGxLyDR3JUMsPsNafzbsO
 RbXoVkIu8AVO2a2Z6hqZY73E94t0aXrCdXiULbTc8ZKZZ9yMgSA+UmCeHKt4owkq2B0+YlXB
 HtRWZzE4aoyYUi/8AeLeg==
IronPort-HdrOrdr: A9a23:zFHdQaFy6+wrjDCjpLqFlZLXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdoZJkh8erhBEDyewKmyXcV2/hZAV7GZmPbUQSTXeVfBOfZrQEIXheOj9K1tp
 0QO5SWaueAamRStP3dxiaTMvoL4rC8geeVbI7lph8HcegpUdAH0+4TMHf5LqQCfngiOXNPLu
 v/2iMonVudUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLolCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlZwkEyzzYKLiJaYfy8gzdk9vfqWrCV+
 O84yvICv4DpE85uFvF4icFlTOQkgrGoEWSs2NwyUGT3PARAghKQPZptMZhaR3e5FMnvNZglI
 x2/0/xjesSMTrw2B3n4d7GThdrkVfxh0EDv6o8s1xzOLFuLYO4l+YkjQVoOYZFFi/lrJsqFe
 F/Zfuslcp+YBeUaWvUsXJox8HpVnMvHg2eSkxHocCN1SNK9UoJu3fw6fZv7EvozqhNPqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOVfUki93aLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCG2XCjryMtZ+59l04eMM4bDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7v5IW7nCe9yrn7DsllpWAkjueEuy6gGsgi10772w6XRx5PmTMo=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="99907419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRfU6HTIvNAW4ErJ6zajewQEtTJa1GsQhFcIIWOAvNv5+lw072dFIBqhUOV2dKxk/Eav5/EpOugZppmEAm3aHs9HGqVHoyBx5+LAM5YsMHcWB30qb2i+QxwNCv5IMqRlLmUXcKMROjSmRyb7ZQ6V2WnGNcrMBQsE8rxW6aVVqKMQqkHEdbCbY3Uk2bK4fc3H4EbK8aei+/FacUVI3c2rRi6bT4marWxqT46Wm58vDGFqE/JiE3S0lrkQAdaj7rjuH+fANty6pH6h79Tf9HRDD7p1Mj/19X0M7g92HDHfQynvWaRNnTQ8vKPwhBBtbhASTAUT+TFg3jnVuJYVazrCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bDehOTfNAkQLfz1LgU3bXcJBHOB2suIW+GNIqQw1bM=;
 b=TYjnzyE9L7edo1xg5i4mcM7z8ak79ysD5WMlEucMvxzbTzR0gRtPMMRdVNjr+NhnSTrlMlTB8m6JTQvIkvL+4Ad4rtNZ1sZ/Z3daTQx+hSrshcGJ5+zk9cvGDzdnxxHYsCsXtFqfjzhnbR35zcZWV313L0Qm6SxLSPCP0xt9Ip93N0Ws3IIZznJrqfnwyppS8WmCKqyRl5eP225bfYqUNMWxIGmBu4lR+7DnFSbPn0mCfl5lwyZlZEF7ld2S/vGTsqc4zbNpcmaexaB9wOMhG+7kPGDRPRJ6/iqNjQhfVJ7kzhmiV0BpSTlqa7mauL5/rJcol5KeITh1JmdwkMgm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bDehOTfNAkQLfz1LgU3bXcJBHOB2suIW+GNIqQw1bM=;
 b=TKINze/G8iUmWVyYkyZ6OD7JzhjlsgKaXc8SRnpY/iT9++tV1ekG22wCxakKkbVl8OErfKlnx+wmNXw8eWWvupaAtn54Ycxgkj06Qt5sQf92AmoQKsEfbJmHXNFnhchhOt6RFqtExYvhLkSBEZkSzK18fr+BkDWiCRdaU4Im0Jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6999624a-80a0-711d-bc39-9b180604146d@citrix.com>
Date: Thu, 16 Mar 2023 12:01:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] move {,vcpu_}show_execution_state() declarations to
 common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
In-Reply-To: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9df072-839d-4280-b6d1-08db26163302
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ckyCfhVENFtu6/ueyw6LEvntH0N01R+3jdmFwKYhh9izTbwHs59jqVf++2C/X4R9k2fQxPD/XY2KNIz1IRStpwom5PYnCCcoZ0nrhPl5680/xbneeVCYkPy5TucSvWdyg8P+yqsRUXEx/y7RHMCV+j6RV1of0CeTzshtz7+tSapXDGd2r+UNGXWPZsWsxG5o6cr4UCHzNcXeUkH55jnSQrBrN5M+65akNuFz4exAhM/tK8bZc283CKhcT40IRy0Y5EAS6noHltuJrEmMpu8bZJtND55V/FMldyf5DRge8gXIfiGveAMLHBKhv14C6KkJ3sk/hR4cwkQT0w+hCpxhTWH06pbom1XpTdXJYfD3wn361JVg7GVu6T+HobIT3DE8fj7Kpx3hSZVoWb7uQ90lw2yo9WouGpgibmvyroGOYAoVhljBDM4BE40P+U1A62tnkumyaOCzrk3G2C4ldNYM7gK01hs1necQGFi6kBvXLSMApejcJU1f+2fUPbC/vXunG4pDj129xPyYAP1j+jGG5JJAmWM+rm3Jkvf0TlSo3xM0dgIDiPtZBH5wsblErHJDFo7gXJDGZzXz13kElO+F+XXcYpk8RYXl/e/3gbhHLZnkAjpSGsF6225/jNR2uzSo4EysCwxqqz5w29mkGVsax7zVUgqE3ZdRpybDDowoEwlI7Esy1fzy0679hYH+CKIN/qv7QCOESicl9SjkcCrFHyz2lNCVZPxp7H5gqa9+Q2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199018)(2906002)(36756003)(7416002)(5660300002)(478600001)(186003)(54906003)(53546011)(6666004)(2616005)(110136005)(6506007)(26005)(6486002)(6512007)(66476007)(66946007)(66556008)(31696002)(8936002)(86362001)(41300700001)(8676002)(4326008)(316002)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnlzMDM4QU5Ja1dOUlVPUXJIYnBLSHZEbWVoaWhZSVhzWGJJSmVDODFIS0do?=
 =?utf-8?B?RU5QMC9zc3pJVXdmNWdjRkVIM1Qwa0JmZm51RWp1MVo0NnZlRld5a0NtV0R0?=
 =?utf-8?B?b1lvcUdWUngrZW0wVzl4MlZtOXRoM3g1bXF6R1R4R3ZhR1pOMmZGTUptanIy?=
 =?utf-8?B?K1prL1hnemhpSGUzbDZzbEhvbytucFI5b3N4Sk9tWjNHb0ovdSt3Y3JZWXk3?=
 =?utf-8?B?YVdVWFBuL3cvZk4zcmlGRmQzL3d0bW9YSjRuTE85Z1FWM3VOZGV1L3pPSmxn?=
 =?utf-8?B?NE5SWVh2Sko4L0dJRVNTYzg5dWtUaUdseUZNUjhLNVNFU0Q0dG95bzhHQzFk?=
 =?utf-8?B?SVdZQUxNNmhFUlRDZ1I1bkNJZGtpdHRmMld3Nm8ycUExQlNsUDhMQjRhbXpt?=
 =?utf-8?B?bXloR3RXaElZWlh2Ri9EbkZXbUNoNjlqSkhOU3YzQmxBc091SEhRaG9FRUF4?=
 =?utf-8?B?TW1xVGlXQmJMNXR4VDA2dHE5eXQ4YnhvNjZ4ZG1hQkpLNG1nOC9DYkhWZmlB?=
 =?utf-8?B?dzA3cDRIZmtOK0lNZ3pRd1pwTmpDcEoxT1VDRVJrakZHV093WTZQM1FJVGVW?=
 =?utf-8?B?dStQS0FDM09oMkhVNjhBd1VkcmtiV2ZWK1VBU3NMM0doMkVabG9iV2RvNUNS?=
 =?utf-8?B?ZFAzeXh0VkJHcjFjMS9FeW5TbkduSGFEZkczYW94Y084cnV5UGxDTkUxZnlW?=
 =?utf-8?B?SGE3ZVltS2kvSkNQZzVmTHZmWWxOc2V4QmltSWg5SDR6MVo0SFpSU0RWaEs1?=
 =?utf-8?B?U09TN3RhcXZqZUtEdDluaE5qTm9kNk94WG9CQjVSUXZQb3FhLytmUTlMbXVo?=
 =?utf-8?B?VmlCVnYyTTZES2JEMStTbmxnQXV3NHFyd2hOWFlLYVkwZjJtclNEUCtzNUFt?=
 =?utf-8?B?M1BOUnFvV0NEVDhNa2NzYnhTQnJRaXlPL3p4YkFEN0l3bFN1REg1cGF2dHVE?=
 =?utf-8?B?Vmp5b3Z4UHduZGdVdXpqY2NuYkNWT3pra3hzTWJQR2FnWldLVk5xRzhNenRQ?=
 =?utf-8?B?N2hDNVhoNTVJMWdNWldCNVExOFB5ZWo5UFdzS1duNzJpSmpyNjFuZWVIWENj?=
 =?utf-8?B?MWFtR1h1STJnNUFQWHMxNzdVQWgrSTdlVjF3Q0lKRFZScEJobHdoWWdCazkz?=
 =?utf-8?B?cVYrRWYvQVl6ZTBZckdLWUhiS3JkV2ppTkkxQUFETjl3WjZ4Z0hOb2YzcnI5?=
 =?utf-8?B?ZjI0OUx1V0JWdnRGZUNHZnFUUlcrcVFSWFl0WTJoNnJpS1dYaFVLVjJBdWRh?=
 =?utf-8?B?bTFuQlc1b2h6ZlBuYUxpem1JdHZ5SzBMTFB4dHhIbFlNa0RvNFlmWElnaDhi?=
 =?utf-8?B?NjBTdFNUOXNZUm1QMHBIWFZWZm1FTkE1SlBPNnJ2THkwQnNzWUpmdXB2L3ZZ?=
 =?utf-8?B?NVU4ZG45WXI3a2pkVEVSZTFVSmE0WEtqTFV5b25QOTZyTUJhRVVZNmk2NjR2?=
 =?utf-8?B?VnIxUnBwTldGci9kQkllYUcyNWdtWnZlZDhmMzZmSXM4L1lHMUZyU3AxSU95?=
 =?utf-8?B?YTlmemtrb1g3UzcvNEt2dUljT2VRRkNzVFg4VjZ3RlRDS01BZFlMZzhtclJZ?=
 =?utf-8?B?YU1CT2NrNC9IYlY3SDExcXVjbXhaWHN1dUhBWXlVNlRZNnQ2OHUzQWJwR29j?=
 =?utf-8?B?c1o2QUE0NlcrRHc4Z25VUGZTaC9ya2RUc0pIUWhDLzd0S3Q2REhsdU1nbWkx?=
 =?utf-8?B?amw2V0ROTDF1VWJCbmZ5NnJGVnhEWnN3UXI3SEowTTBIa2xWankwcUIxT3Fq?=
 =?utf-8?B?Qm5WMlJyazNhSWRNRXFSaHdYd1hpcHdSQUVmaGJMcUk1bjdpcXA4blFXTG83?=
 =?utf-8?B?a0tFSEhoalFWaTZtKzZwOTdHVlFLdXN6TWtCcm5OSzJ5UWovbXBkaDJ6VVhi?=
 =?utf-8?B?MTRKSVh3YW5nSmIxL1I5bnpOU0NaZ1BGVXh3R1dvQnJ6S1o1MGVVS3BSaWZl?=
 =?utf-8?B?UmFrQzJBTkhEbDRNSVhnUWc3Ukh0c0FacnhBaXdtZlVyQXhNOXJqenpha3I2?=
 =?utf-8?B?cjhicXVobU80M0Q0aThjQk5vU3BSRllNbEVVaHVSUXhPaFNpWmZUQkhLZytU?=
 =?utf-8?B?NjlrNytDWUxnTWtqcExSR2UxNXk1VCt2aGhILzZBdmFJNk9oejhCV0txd1JD?=
 =?utf-8?B?TjBXWmZ4aDJFNWEyYmtZT085VDlBYlMxeFBTcXZoRW54cVhFOVNuR2VnUmp5?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oM5+b1u8f84WuTVZillqbqecw1qW/N1JHAlU1gXOnFxt1nJQEEjWCx6rxi46BggooCfxHRI0ijus8OcTVDn/7vy0PIR5MsuJ4tSfWmwnmL1xHxliJj9vq+6My6gZTFgRz1X0spykrhgUQYZqFYejFer3CHybKjp183XOsVNQXLmT0chX4JyBfJ+mH2HXDPoW9Xev/oPrWaNsrRdk/XsebvF8Dqb5TXQ2s1hu1QPxYz6MN8yfQ+61FKr4YpR6HvQxmSHwAXqrZNahuvoo81qRlE8hDJNq+qf2WXvU0ZvmBpQCKklvG2PMAdIrDNSuJaeX3LZSVPKUO1z0PMAW3fzbcDx1lfxRF3zSOqQ2gSBIY5NDHmvZ6H19jU1hI0UlwepH7NuVjRLpfFnsKwYBLjBpg0v5lXxXSq/XBcZcLnBnpLIUHb6GNXPAOJegz6rOG0Kr7S8dIGJIw2Mz/nId2yB6QR76EJjdJ/aBSveXIUO/toc2AUEuhmTtfvkz7JGgnVBIgal6rt+LL+QFNy2q3ojmnUPVtvGiSAFtiCoTfKqxUD73ED4a7AJscvMQwtXAu8HphvLrbJyRZTVjtGoNFL9HPdB32NCfCKy3k/3UB6BhG5C8TPsarPQXE8IK2wKWO7Tbp0J1EQ+oNGFT8UEIYXYLebNsxX6Li9XRrhVGrJG7Zh7mzp143cvHPwnrWnI84FdbCBvOq8vw5dl3XTg/+XDtaJ2NHWJarUI9u5mD6FGPlrxqOXFhXGdsAg5kH0Ttok1tE4drWfb0qj7zetiM965Qhwj9SSYdtJDnrQHuzoTx7HMv/wdT0Nnt3qXjvaV16jXGmwpq3oV97UIeddC9m19R6XggYTupXSZOFM71HySAsKj/F9tHBywTFupa8unY3p0U6ABKqIEzrLN2WYhQgsbH8zxeq398KKqHKxpc+2hKLoE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9df072-839d-4280-b6d1-08db26163302
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:01:39.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phFHg1vl3o/PWWIXpsflqJZB61DmKO0ZhtSlab0s8n6XTRuZjUY5O8F5DdJMvLvGZ8P0MnADnZkODf88VA3BGCCRVJHAHVyi4a+s9HklcYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6695

On 16/03/2023 11:55 am, Jan Beulich wrote:
> These are used from common code, so their signatures should be
> consistent across architectures. This is achieved / guaranteed easiest
> when their declarations are in a common header.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> There's no really good header to put the decls, imo; I wanted to avoid
> the already overcrowded sched.h.

Yeah - lets please not make sched any worse than it already is.

I can't suggest a better location than kernel.h, but I certainly would
like something else if one were to be found.

>  show_execution_state_nonconst(), being
> there solely for dump_execution_state(), could of course live in the
> upcoming xen/bug.h ...
>
> Is there a reason that Arm (still) expands dump_execution_state() to
> WARN()? Without that moving x86's show_execution_state_nonconst()
> definition to common code would also make sense (it could be done
> anyway, but then at the expense of introducing dead code to Arm),
> perhaps (see also above) into the upcoming common/bug.c.

That sounds like something that should be fixed up...

