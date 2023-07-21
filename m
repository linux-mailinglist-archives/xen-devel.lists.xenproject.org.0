Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F175C618
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 13:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567501.886628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMogH-0001V8-NK; Fri, 21 Jul 2023 11:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567501.886628; Fri, 21 Jul 2023 11:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMogH-0001TT-KW; Fri, 21 Jul 2023 11:52:21 +0000
Received: by outflank-mailman (input) for mailman id 567501;
 Fri, 21 Jul 2023 11:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMogG-0001TN-6S
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 11:52:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 095c5227-27bd-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 13:52:17 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 07:52:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5005.namprd03.prod.outlook.com (2603:10b6:208:1a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 11:52:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 11:52:12 +0000
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
X-Inumbo-ID: 095c5227-27bd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689940337;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=doZa06Jgwm5f5h72GODvqx1ChEHBzcGFG4e5G1uSN4s=;
  b=hpJ+uGEn4Yp3RbkSSvQrSmdrZgBJrNmpC02NWhSE11vTuqSEVkr0GFCe
   AT56RmKecYyu3oxQGjqe6GrRzf3sDsrjWn5p2fwLa3tG17QZQjErHvTet
   SlJKRvDv8+qSrX3yApx0vZAGbJAY3eiXWvXbAPD9D4Ev/iM2WcyJcS0Gm
   U=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 116866458
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fkkMTqyzhGdrJiiKG1V6t+fYxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 jYdD2uPaPbcZmqnc4x3OdjkoEJV68fVndQwTgtvrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6kT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT1X0
 aU1bzQ0VU6Ope+v442Dd9BLidt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRzX2lBN9CfFG+3tdM0Fyr1G8qMSMPW1KbgtK+ihK/Q/sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwDuEyrfQpT2YAGcEZjdbbZots8pebQIt0
 liFjtb4HwtFubeeSW+e3rqMpDb0Mi8QRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihA86irYIhMgHzZKS+1zdnimsrZjESA0yzgjPV2fj5QR8DLNJfKSt4FnfqPNfdoCQSwDZu
 GBewpDBqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:TZvgiawc7CIdok7SIyX8KrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-Talos-CUID: 9a23:0J2FrWOqwQDcou5DBDBDrWNTHvkeLHD/wW7zHHeFMEFmV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AlmHu3A1QJPfPemomHu0eGKL7+jUjyoL+CXgfkqw?=
 =?us-ascii?q?/hdCKPAxTEDCd0DWva9py?=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="116866458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkHDOdDJ9zkg/VaMGS/gmBGUXs0xK+m5zqGFtuJ5yJxz3gIooQwMkK3kAymRSCsaSmzVI/nQEcuB5Mxy8vpjlsF1EkIC8mDc5YSBDgve/FEwL/SIWW7KUE/RtBpycnxssKJMgwKxp/uHeXapf/dELzlvcuYRiXPpapY6JCcZ/Mjfx55dIhNXqeN7ZcoGuXG+jqU2MKbseh1PfhaaRQnYs4iZf3XxgAlPSOVcN3cJkYw+2byi4VAivRP/HJmR1csc7xBsQgPqrcwDpc/ihclT/hHWYOXAZRq0dif5vL/ib6FvaGstWPLXtOLqRKADAxjY0iMnn2TQvp7hV/4bwXYhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8E/Idi4d0YJndDO0Gly9y7qjFVhI+dmrB1Z7CPJ0/Y=;
 b=kPbsF2znleI18J2saEF12/wvejZyxFrsjNEc84VjkXtL5uOELE3+piWCZF5o93lbNYixzxFE1BGFIKp/E2Y8QQQVGIHeq14m5Pt6TmsQe4j6/hEPL9lAYpjZQofBQloSk8vtOgTQlnBe/RPbdqC2UgEQk+HwUwL/Ji4xZ4e9V5G23BK9SeNd5hEtyPLzLS3R5GnOKEUWcJFQ7INPMArxlqTE7OZrDpGHvVbvykiBJwxHfi3pYGCqhc+92zapVrSMQem50PCAUHhXECPBRMWkZs/p+95z0Z8mlH2xr6ikruGs6Wf/kKifoqnEhzuS+ABNRMkftw17NEMI3kooeg8lQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8E/Idi4d0YJndDO0Gly9y7qjFVhI+dmrB1Z7CPJ0/Y=;
 b=KFr917ZMIXFFTpBjGV23sPe7CA7BFIeACe1Jsb+GD1EuGeTgy/9kPpxgzR1axaHaSjQHDcroLAB37V4V7hsEZFn4JioK4gT6ltnpn8s4UQ3PBP5sUtQETZvxDoiH3e7WUbinir/+nSUMQeLsALidUxWPJ6Q9uXobeCDP/LDdpaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 13:52:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 05/13] vpci/header: implement guest BAR register
 handlers
Message-ID: <ZLpxZhBKcuoGXokB@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-6-volodymyr_babchuk@epam.com>
 <72733AB9-1912-4C28-A6AC-88D147778E73@arm.com>
 <ec6c97dd-a333-6927-06bf-46ae44f9007d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec6c97dd-a333-6927-06bf-46ae44f9007d@suse.com>
X-ClientProxiedBy: LO4P123CA0390.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 95794864-affd-468e-0b56-08db89e0ebaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z80Xt+FDJEmAGnTHNQFUWsthlWdx2wP6CKIkMcentu+TABMVmZqC3344Gx8xVNFpdiUj5eNvmM5trGjmpxOcfXjua9ULbLc2vYikL5gtLBsb5ZLAaAHOIGTvJv/j3Hw+b+me1/C9PVUSlC7ebXmOTnn2UG0XSfBnDUxIegzqTQcbOzr6VTi9WYJAmENtrcnM2fXHdlBqoWV+mcFbp+z4eR+Suu5ZXkmdDuCFpf/eMxHTOniLPURMnJTwXf70oHgXcUcweK7hwMtzrFUcpGx2OWPeWaOSO2O0Mj5BpurEYaWOOdo9FCfYj7f5l4iAZqc/j3V6COthst/PeqU3EetQxIBVUHS6C1uyHNdr1unLHSBJaHGnCluTXL/t5U6vu+Pz0QjKDkiANLJrhXfXt6Kws8jWk7frlOVo5l0nAccHkx9ReUo5XrK1xv4H8JrviCdz1O9qAK+3TdWaPlmWAS64L+NRgr4JY40gOcNTPF6wKn+31onJrcF4UzNKpOlfYnweooVgDMivNRyjO8HKUJCvCWWWUdDGKfm2+xz5/6P4KgeSF6oZ8t1dWXlRO+Wfjiou
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(9686003)(6512007)(6666004)(66946007)(4326008)(6916009)(66556008)(66476007)(85182001)(6486002)(2906002)(54906003)(316002)(478600001)(86362001)(6506007)(53546011)(186003)(82960400001)(38100700002)(5660300002)(4744005)(8936002)(8676002)(41300700001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3FTSFlCRit5c3BXeHFhdWdZMHp6ejdqY2hnT0JNRThuTllYdDlwdmVoNUdE?=
 =?utf-8?B?QXpOamgvclRwbE0ycWdXTzhpQnQyWVYrNE9vcVFqYXlJWHhQMFVJZ3ZOWEs0?=
 =?utf-8?B?VmN0djF3TWcyQlBXcmQ0ZlRaS2swVGRYelBjZTluK2lDZlpxUER4aU53TDRa?=
 =?utf-8?B?K2JETHJRaklEeG56V2ZFV2krR0N1ZlIrSXdhR1BNMVVCVW9iN3Q4MUUrZmY2?=
 =?utf-8?B?N1U1TDBkUmpPVDdNMnlLRkNqbUpqTUttQ1RhNzhka01YU0p6Y1ZOaU42RjY4?=
 =?utf-8?B?SEs4OXFPNThRM3ZMVGJLMm4ra2ZhVVJ4VkdYYTljVFMxVlh5SWF6VW1FY29H?=
 =?utf-8?B?eGN3ZzhYSk1zdkZhc3RpVGZzOUFBRDF5SkFaOENMd3BrVE1waDJ4UzRmZVky?=
 =?utf-8?B?Q0lpT005MGVLdWZyWGc5VGd0Z0M1Tk9YWGZtTTFSMXY5TUxMbFlFaERLOGdP?=
 =?utf-8?B?ZU03MEJVTFhuN3RveHhDdW8yVGxqVUxqYnR2eXhqR3RhT3NwcUFmTy9tcGhy?=
 =?utf-8?B?ZmRBRnVzRXlJWTFkaG5XVjlWWmkrZUVmNE8zVUVjWVRmVnRuVFZqdUhwQW9H?=
 =?utf-8?B?YkU3QmlKWDBZYWQ4NE5MamcycEY5VFhaQitSVEFMWFhDRnhOa3RCdFZVTTVt?=
 =?utf-8?B?MWNDaFJZdVdpTjN5ZGFlVnd3YlJLekxmbkpRZTFaRndxN05hMHR4Vmh3WFFU?=
 =?utf-8?B?cU1oaHFkUzNEREc5M0NacWpyUWFzcmJtNW02THVPSFZpRGY0RVlMdUNvVG1X?=
 =?utf-8?B?UUdoaHhvTlRTWVpWOGNvZWV4YUxxNUVLRWY3QWxLcmt5M2dBS2I5Qk9mV25h?=
 =?utf-8?B?TXlZbWJ0eUR6bzYxZi9uWlc0TmV1bnBHb0tKSEN1N0RsajhWOUFBVnZRVURa?=
 =?utf-8?B?VUJ4OElEbXFJMHpucHpPOTBLenoyV3BCdW9aNENTYlJIcEEzY3E3VXJPLzIz?=
 =?utf-8?B?SFdRdk5UUFlRdjkybS81cEZwU2Yyb290VFozK3d0Z0VZU2QvVjM0REtqTk1H?=
 =?utf-8?B?cnlEZXZLTTBDdmR0R3hPL0E2bk1DM1pwRDlXK1VjUXByZGpxNEhOOHFwMytO?=
 =?utf-8?B?UC9pV0UwYmxJdDBQNWpqRWw0dm1yQnNZK0t0b0FYYVU1REg0WDVlWEpuVTVJ?=
 =?utf-8?B?Y01CWGR5aVNZTGNRYVlIM2MxcjA2RitoRzRjcjF4L3ExcnBBRmJORWxrSDBT?=
 =?utf-8?B?Z1FRNmkxQjJTdFRmdzdQdHdaMnlVVGFyajZZTTFoMnJBcWtsRHZLWWZHZHRT?=
 =?utf-8?B?TWRBNjNOQlliK2tzc3BUb25nbUdQT1E4V0FjejFCSlh4RWxCMmlYM2pzUGZD?=
 =?utf-8?B?Y0dibVIvc3ArOVVWbUVZK3JRSHdFZ3dQdDljc3BRc3FDcVpaL1NhM0hoVG1S?=
 =?utf-8?B?K3EvVVFSVFRJNHRPck1NQTRSUDFIYVNqR3lUQVdNMG91Szk2cWZIR2VZUUNI?=
 =?utf-8?B?dEM5YmtPbXU1ZzR0RW9CZDJETXZyOWZSaS9zcFBQYXBMRE50djBqVUgrMXBl?=
 =?utf-8?B?ZUJYVFZrR29pcFlxVDRwTmE5bVMwWkZFcGVZTkFLTTd2TW5nbzc5ZXhWOThn?=
 =?utf-8?B?VG5Qd0hRK1d3bU1TMDlPcXlSQVlUZXBXOVNFSjJROWdOSElRR2FQZ2tDTFJa?=
 =?utf-8?B?ZGlFa050enNTWUZsTmFRK0pVQW05YXBDamZRTkJLWEptTU1LbTRFSVY4aFRB?=
 =?utf-8?B?eE5GSU9xc1FPZmpuNHVoczZxLzc1ektqU2dHQWlvOEpWMkVwNlBkZmJiT1Bj?=
 =?utf-8?B?TjNoRlg0WFBLNnNMYmhQYTVkenNnNHFqQXBRbHNRRUo5ekxFL2NIU29rSTlJ?=
 =?utf-8?B?aXJOZHVBYkVCazhIV0ZqYVh4Z1ZEdXljVjBEa2ZZNWxvZ1o3d0VOWGNLc2lZ?=
 =?utf-8?B?Yndxa3NTVUpYN2hSV2xIc0NpeXVveC9YZjJjVGhTQkRHZjJCRld6dlMzSUo3?=
 =?utf-8?B?cEhOWS9UVG5FbFBIdkRreWRSdjFMc3psb2hNM0duVjE2Z3o1dFZreU9qQmlq?=
 =?utf-8?B?TU4wdmdXZ0lHSDhHbnV2cWxuV21ESEZURFFjWFo2YlphUTdGcFI0SVh2K2Ey?=
 =?utf-8?B?WStxVnRWQ29tZGVKNytSSk5pN2I3ZitVSXlrencvSUJDS2NtT1dmMnhRNEV4?=
 =?utf-8?B?VnlwOG5CMURjZk1oNUgrRjZ2TkJkTks0QkNuNlRwQjRaa3daVjVqK1FyamVK?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uAHXohEqKlanMzn5Hmqp9F7kb9SxhOYq1T5zfAkYxjQHC4+B6HVbwwtXOgMDrWYhFvNOAhNpCoRfba+iHgcmWi8CO8cwMruU4JmWjdAYwCIYQ71eM0dDqls7EbDiLiOrLwBJoE3DfuJJis03DhRIc1DGGwEEC/VxwJMdtZ/noi5mZB2u9JZBf5Rom0GYrY9tpjAMv9l3/Sq/66Jk0+ZtJ+M7R19DHG7cu7HPALSHAsVEDueqaPIxOsBWdEUfbHc3MK2ogSX+y1m+h5VQGooQaJU3Tt6HmKY2cXYNIrqQcXYmXWPzECIwvAfHCVaeU1rkwItQ7/0dePuIwygsag1Y/U6hYveH3Ot+ST/2beqSVUq0ncX2pAxRpjNrnvuCOLZGZkPHm4XY6wXe1bEtOmy9nnV0WLuTZ+1bwnc0z0ZhGc/5BkV/CLo4q+LTFDpynwQej3cXjM18zx1U+BuOOptuyPLniVi8iZb4cjmOryxt1sAB87gKbmo1Bvu4Kj0+4mpiwxSHZ6N2OMuTm4QtpPMAb8zaZqLUON8lq6QdNEntsCpbRlZKWsxmxqzGvnrXfUQOf40M6JLB8Y9P6w7WBmnzJr9QZ0TbUw2VxdCX6vZTYPQUTow1pu4CQGX3HE8tmBaUlK4IiCvhTlpVlJBo9RsndTyBqGzUZwtGoatFhRPnKBTRMqwpMOtdxU2UKCy/eE0ADIEIKQWydu7TVL7wl5P3rStPfALn9LKDf9j4G6pokPLJDBVJlaHCGfq+6ySDnHOkR4TSFEOtNop7FHi3j0TATnp6VJKbb6Zpm9y7Fv24YAgU+sMwmgYTeaxkOCNUKjERqrYgIMmqh9rpygAv4bQDLQ2s/mrFDo7nFewdLU1U5dM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95794864-affd-468e-0b56-08db89e0ebaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:52:12.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqmZ/fB8gKsV3IHjO1ShpmxIkA7FxypCKR1/YNs8MkdcJTBD7plowUD+wc31p09QEG9hh0ABgOhdwGFhUt/mVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5005

On Fri, Jul 21, 2023 at 12:50:23PM +0200, Jan Beulich wrote:
> On 21.07.2023 12:36, Rahul Singh wrote:
> >> On 20 Jul 2023, at 1:32 am, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
> >> @@ -599,34 +681,50 @@ static int cf_check init_bars(struct pci_dev *pdev)
> >>         bars[i].size = size;
> >>         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
> > 
> > I think there is a need to set the BAR mem type and prefetchable bit to the 
> > guest_reg also to avoid mismatch when Guest kernel initially read the BAR’s.
> 
> Perhaps more generally: Shouldn't r/o bits be handed through in almost
> all cases?

I remember in an earlier version suggesting to store the guest
address, instead of the guest BAR register value.  Then the flags
would be unconditionally added in guest_bar_read() and we wouldn't
need to worry about initializing the register.

Thanks, Roger.

