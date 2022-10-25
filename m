Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9060CF77
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429880.681211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAt-0004hI-Se; Tue, 25 Oct 2022 14:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429880.681211; Tue, 25 Oct 2022 14:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAt-0004e4-NX; Tue, 25 Oct 2022 14:45:03 +0000
Received: by outflank-mailman (input) for mailman id 429880;
 Tue, 25 Oct 2022 14:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAs-0003SJ-BF
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:45:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9964d07b-5473-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:45:00 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:44:58 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5808.namprd03.prod.outlook.com (2603:10b6:a03:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 14:44:56 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:44:56 +0000
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
X-Inumbo-ID: 9964d07b-5473-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kAAdyrIBV5b3v2jo4pvSozj+LaxTfiauFnyu5tTM1Vc=;
  b=DLqrMperFyoT35zJA53FUubjbMqiZZzbbjQuOUwWsQ4Xp1Ob2w0enkhc
   WdjdShsNKlNgm6P/172dwFVmzrpj7jcc/Lqoqg4rJ/2WjQrycM3/KdpWe
   W+MGdqS79Osglor+9J2uyoRli2eY4lL5RLXRmFzikMYGOBq8Sqr0jbLv0
   w=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 83892324
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GrTWkalU8/w2SaLnMBoeeuPo5gy3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2mOafvYYWDyeIx1Yd6y9kgHvpLTzNNjT1A6pHg8ESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGXxe1
 KRbDxU3cEqxpuuW0aijda5qv5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL31r6VxnmnMG4UPLS30P5hn3G2/1MsJDgtEkW1gKa61kHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcabDIAZRsI5Z/kuo5bs/7UZtNqEarwi8KvHzj1m
 mqOtHJm2+lVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:ttY1oajIy5hpiP4ByAOPyAnOUnBQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VfN1xJ/dfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83892324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddaiAYIhXwakw0LKgOAWdPyzFGWgZbgHtsD4Bu9Y9F74omlc6Y1+5pTFBoaC9H1x/QkebCtr2PV/Og6Rgw3lc/ubLkcDJU4zPvSGiz2NF5g/o1LsmE+NMZkCkksuf6ts7I7bGpsJDAkBbb4CR2Szut/Tsx1EogtroUI9d1yAqrl02pTv9QCPCpDhTMUBrWc+lUQcSOEcyG9z0Kmcv5B7OCAbfGr15e2W1NFwmAH4S3wKrdHtc8tptfH1ttSg9qRqh2Jsh10IV8+6AHFt/VX7RGDJV9WAJpNNHxHN5E4j1KHzcLpEiYWsTPfZqDe1rXtslVW2Ce8a/4HimzP6W5DYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VZPXsMkn9fam+VCRpitzkT4VDEDmOwmP7P5aKFDPN0=;
 b=nqxLUVl3imGNgKUZCMFNpumn9fQ9nTHuEcvnsvLFVdKKSxLUm0KQeMeCajqxRwW4WLzulFAl1iSt64hoeAMt+GTuRAAbtQA7p3h+uU+kmEO6pUo0T9QGpOyKL2UFe1HrUkfVWV9qI3kqzdeUu3zZyqZOaTCzcGQON/ckiyWOdmSPDP+8vvdTWet4IE/B94YvgoxFSL0Zd2U+wXPI6FS0ARiw2K1OmirUJL/Q5PtpAZAsQS95MqkFQLfa/KgAId2fProMtfdAL2PONbVD/qmxKQfsbSDpY1Vnrf3Asrqg10rBwJPYwnlLyPFKFavTVLkhjxISoOuCdjl0eT2lEADCMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VZPXsMkn9fam+VCRpitzkT4VDEDmOwmP7P5aKFDPN0=;
 b=hoNer72MTBxE+546k55+LMnfvswn8Zv1HHQeJ/mq8ArSIl/1xiKC4u3HFFhhw/vlg59xN0wWpveLuy7iA64D8JG0gh5e0gNKtIMGOJbmzWSBRxL+z7zFl0ovA9f3X8sdcWXADK7aBEC2tmLjMIOVJtsTm7fFO0owDXlhZ9XbQ9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for devices
Date: Tue, 25 Oct 2022 16:44:17 +0200
Message-Id: <20221025144418.66800-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 21544477-07fb-4242-fe22-08dab6977bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aZpEGhq5xuM7SfX+0toQZIbMZjAw3nMbAzpwytrsUPe7qj1Jupibv/k3D+k31c9hPW84NizZUXmq3bC+LeRGSB+2HQh/TZpz3ICvNY/Q0AVCl5vxQ6cRPGT+0TyZkj3caSi9dOuEqe//FoVMPUCbwbddt9nt69bPyJJjs0G/5KTz0mDGsup4OxbdF5HtgWYTqINAhE8qdtRXu+fHQQj02kASQFzp+B1iK3IjAp9ae94oDFZnSm0EW0Kgwse/OGEpXNl7AA7BN6ji39mmR+wandvb/tkapVnWJravvLar5ovC5Bgl0IYbB7438GHN1vY7C7AhNE1pcTOVAD9p6CfaWWt2oZptCpkxn2/yh52G6ajZipuhfcZA5YV10aQgY3qsZ9yTCCia9gmrYlG5K7Ig+/dIbKXK+4//Cx/jWjD9eUZaMWwrZWEqoNevl0eXGqp7Q/LjanXRtMpddiQDHBB5s2Mzlua0dvAyDWepdV6sXWoK2vHMlcguYXsU+SBzKTTbjpXXoANK+reZhrx2FjQu/RGk5VjfkGxPYVE7XP1jcDx9xYna1khrsJaUY4+tAoD6WmsMQxS0MADxNvKrUxM5XvoQxEVMhWXbvNbN9iYBMPxj8g2MDNny0kbK9gFm4OJPVEsyIskL7QCc6yVyoMAtHONuAISd0HQvKP0VpNfEsJyXHZZwxAzsrWoTrG1NEYjOBA9HTwheyc3P1wXp84rUaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(83380400001)(316002)(54906003)(6916009)(5660300002)(41300700001)(6512007)(8936002)(26005)(4326008)(66556008)(8676002)(66476007)(66946007)(86362001)(6666004)(36756003)(6506007)(2616005)(478600001)(6486002)(82960400001)(186003)(1076003)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9OSnBBWSt2MWd2dkYwWU03dUpuWll3aG01anpYRzFDeCtONndUVFF3M2o0?=
 =?utf-8?B?Uyt3UXdRcjBhc3NXNm9Md1ZiNFBncVh1OGFmcTBjNkQwRFQyUzlyTVB2b1FV?=
 =?utf-8?B?YzM1czRxaUhOb2VBVmJQd25ITXJsekVxWjVPT0xzZklyT3h6c3JwRUpwcFhJ?=
 =?utf-8?B?TEZOSnVjVlRxTC9zRVUvaTR1K2oyS3JhYnZSR1BTa20wYnJMbTJpRVBib2lv?=
 =?utf-8?B?LzJqa1BoSnFvR3NiWkt5RXhNVGh3ZFl3aGtSY3JvT2tZbTRTU0JYUk1mZS9y?=
 =?utf-8?B?YVlCWkl4b1Rva0kxTTlWZFRxMExsczB4WmxIRlM1a3N6bVYwdnhpYTdpZUNs?=
 =?utf-8?B?QTEzUzNZY2pXQkRLQWdkUldBb1RPR0xCMnd2YmhiSFFwWSsxMEUrTGJMblhk?=
 =?utf-8?B?OWdhSk54VlQybXZsUDFoaHQwdDU2cGcyKzZZd1d4TlpFRFkyb2IwckRyQUtj?=
 =?utf-8?B?L3pkTS9lVkJJTGFQdDQwQURramwrM2liZkowMUVwT2JYSjhISXhBY0lYUzJ5?=
 =?utf-8?B?TDZCVTdJZllLT2dYU3g0T0FjR0NuVDJSSzFXU3MzOVFXQ1Zib3k4cFRqWExi?=
 =?utf-8?B?a3U5RXg3eVpTSUd5ZTBRYTUzMy9TVUVPbzh0bVArcThCSUh4bUdmZWxRblBn?=
 =?utf-8?B?R2srUFJJK2ZGbGYwN2RhRjY3Vy9YUmdwSm5uZFFEdnFLTWoxNGpLR3FianUy?=
 =?utf-8?B?ZXM4T01jcjRHSGpNNk1kTUVvL3RyMEZBaTJKck5GREpjblpNRGtvK0VYZ3BX?=
 =?utf-8?B?UzZBVkY1WTQwRCtZQmtiYk1GOXpmSG9JVGRuc3NyTVR6SG1GNjFuTFByVjVq?=
 =?utf-8?B?RGRIbHFoLzQ4U2VhOXdnWUFRL3RwZTdPU3BrL25UQUZhUkhMK2VCMGdLN3Fh?=
 =?utf-8?B?Ri9wdDJOQ21YUXU4WENIQjZ4cWZFN3FmdkRzdlV6THVUYW9Femd2c2crWnly?=
 =?utf-8?B?MnVVYXcxcWxGVmRQeE1IdWtJQk8xNnBmZVFTbVRPSzhmelJPTWdtU1hlRUVR?=
 =?utf-8?B?M0YrRmFjZTNPdFpHdWNwdzNGZG1aa0VhbFBaRk9kUk82dGx1QWZQeVQ1Z2t4?=
 =?utf-8?B?TVJxNEFST3lzOHdLUlhIMXgvekd5VzVENHJxOTdyNDdXRmIxS29CclNaQWY1?=
 =?utf-8?B?TE50Vnl4NGF1dzNYVkVvQlRRQXdTdHIrVmk2aTNrUjhEdlBBenV5OUpCR25L?=
 =?utf-8?B?MksxSnNyYW5pcDdLZnQ1Vk1tRDhRM0xkZGhtQzh4VHU2SVRoNnE1UjVHcU4v?=
 =?utf-8?B?Z0lFZVZ2SXZKWjBOOFZLU203VkdaZThlOHA2NHlrWEJ4Z21QcHpDK1NZVnJp?=
 =?utf-8?B?bmlpMThmejcwVGxxQTlodFNqNWVFMjArdmErbDJKM1FEaC9CbnJZRTRDZjYy?=
 =?utf-8?B?SG8zNUlzRWhiSWZOWHFVN3BXQTN5MjRXdXo5ZkpNQmxFc013TXNjTElqdkU3?=
 =?utf-8?B?enVuZlloV0YzN2VKM3hKeDBsN2NObUpOM0Y2STduUldZdHdOb2VBRjgvL25O?=
 =?utf-8?B?d3ZpSDZBRllhM0pzcGRFOGIwWmJIOFRNSlBsUzlTbDhEZ000VXQ2cWFBODRH?=
 =?utf-8?B?eVF0NXVHQSt3TWg5MmRiWE5ub0JYbUtKUU5JOE1wWGxVdTdhbzZmRWJxT2hw?=
 =?utf-8?B?KzNDQVJrWFRwSzk3akJ5Rmt0djJYZ1grVFJUK2QrRlFLd1dtWi9DS3JORzZx?=
 =?utf-8?B?V1FVcnJVV1hoTS9uMlRodEszOXVsckVDR0MyTDBsMDhsM1psRDZGQkpWd21z?=
 =?utf-8?B?ZHZhaG5uVFlxRG9YRGI1SnVHTjJEU1VkamlKdGN2OS9GM00wb1hLaytmN1Zl?=
 =?utf-8?B?amJORmlrYTduWGtjNHBaeGhPMThrekJINnBjSmdTTXg1TmVZTThYT2tRWG5s?=
 =?utf-8?B?SHdNbjFVaDBXSk0rV1FYdnczcStVOWVOY25ScHJHZVJzeFhGdllVRmgrZyta?=
 =?utf-8?B?VGRBSXpDSlZkUmxobFdJUFBVb01DalNPSFQ1OElUc2h6Q1NrUFRsbk55dExM?=
 =?utf-8?B?RjR3bmsvTC9WWVh5emNNVjM5dkdWMWM4QWZoMU5WK3hFcTgyQUFaUjlRSzNr?=
 =?utf-8?B?RjFvVGZiUVlyVnUyUEJHODFieEtsWlpaRStnNzhDRk5YdXRnQWF1Zk82YUly?=
 =?utf-8?B?M3dPcDVUNlRVdHZaMHZueXdSVUlHbUZGOHg1ZTVlQ20wUFUwOHV2TjQxbWF5?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21544477-07fb-4242-fe22-08dab6977bd0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:44:56.2626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXQKxf7/VNw4V5BFWPtqP6rzxdrXdPLONEElawKQtu3Cn6ZSMxawMSpbyTgA3o/TBswShrKyZl06LgHQc87qmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5808

Commit 75cc460a1b added checks to ensure the position of the BARs from
PCI devices don't overlap with regions defined on the memory map.
When there's a collision memory decoding is left disabled for the
device, assuming that dom0 will reposition the BAR if necessary and
enable memory decoding.

While this would be the case for devices being used by dom0, devices
being used by the firmware itself that have no driver would usually be
left with memory decoding disabled by dom0 if that's the state dom0
found them in, and thus firmware trying to make use of them will not
function correctly.

The initial intent of 75cc460a1b was to prevent vPCI from creating
MMIO mappings on the dom0 p2m over regions that would otherwise
already have mappings established.  It's my view now that we likely
went too far with 75cc460a1b, and Xen disabling memory decoding of
devices (as buggy as they might be) is harmful, and reduces the set of
hardware on which Xen works.

This commits reverts most of 75cc460a1b, and instead adds checks to
vPCI in order to prevent misplaced BARs from being added to the
hardware domain p2m.  Signaling on whether BARs are mapped is tracked
in the vpci structure, so that misplaced BARs are not mapped, and thus
Xen won't attempt to unmap them when memory decoding is disabled.

This restores the behavior of Xen for PV dom0 to the state it was
previous to 75cc460a1b, while also introducing a more contained fix
for the vPCI BAR mapping issues.

Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
AT Citrix we have a system with a device with the following BARs:

BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
BAR [0, 0x1fff] -> not positioned, outside host bridge window

And memory decoding enabled by the firmware.  With the current code
(or any of the previous fix proposals), Xen would still disable memory
decoding for the device, and the system will freeze when attempting to
set EFI vars.

I'm afraid the best solution to avoid regressions caused by 75cc460a1b
is the proposal here.
---
 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 22 ++++++++++-
 2 files changed, 20 insertions(+), 71 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 149f68bb6e..b42acb8d7c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,9 +233,6 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
-    unsigned int nbars = 0, rom_pos = 0, i;
-    static const char warn[] = XENLOG_WARNING
-        "%pp disabled: %sBAR [%#lx, %#lx] overlaps with memory map\n";
 
     if ( command_mask )
     {
@@ -254,8 +251,6 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
-        nbars = PCI_HEADER_BRIDGE_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -272,75 +267,11 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
-    case PCI_HEADER_TYPE_NORMAL:
-        nbars = PCI_HEADER_NORMAL_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS;
-        break;
-
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
-
-    /* Check if BARs overlap with other memory regions. */
-    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
-    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
-        return;
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
-    for ( i = 0; i < nbars; )
-    {
-        uint64_t addr, size;
-        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
-        int rc = 1;
-
-        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
-             PCI_BASE_ADDRESS_SPACE_MEMORY )
-            goto next;
-
-        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
-                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
-        if ( rc < 0 )
-            /* Unable to size, better leave memory decoding disabled. */
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            /*
-             * Return without enabling memory decoding if BAR position is not
-             * in IO suitable memory. Let the hardware domain re-position the
-             * BAR.
-             */
-            printk(warn,
-                   &pdev->sbdf, "", PFN_DOWN(addr), PFN_DOWN(addr + size - 1));
-            return;
-        }
-
- next:
-        ASSERT(rc > 0);
-        i += rc;
-    }
-
-    if ( rom_pos &&
-         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
-    {
-        uint64_t addr, size;
-        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
-                                  PCI_BAR_ROM);
-
-        if ( rc < 0 )
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
-                   PFN_DOWN(addr + size - 1));
-            return;
-        }
-    }
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index eb9219a49a..4d7f8f4a30 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -121,7 +121,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         }
 
         if ( !rom_only &&
-             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
+             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
+             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
+                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
             bar->enabled = map;
     }
 
@@ -234,9 +236,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
+             /* Skip BARs already in the requested state. */
+             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
             continue;
 
+        /*
+         * Only do BAR position checks for the hardware domain, for guests it's
+         * assumed that the hardware domain has changed the position of any
+         * problematic BARs.
+         */
+        if ( is_hardware_domain(pdev->domain) &&
+             !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pp: not mapping BAR [%lx, %lx] invalid position\n",
+                   &pdev->sbdf, start, end);
+            continue;
+        }
+
         rc = rangeset_add_range(mem, start, end);
         if ( rc )
         {
-- 
2.37.3


