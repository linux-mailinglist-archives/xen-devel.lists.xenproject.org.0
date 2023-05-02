Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9C6F41B6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528471.821668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnLu-0001x8-RG; Tue, 02 May 2023 10:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528471.821668; Tue, 02 May 2023 10:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnLu-0001tD-Nn; Tue, 02 May 2023 10:35:22 +0000
Received: by outflank-mailman (input) for mailman id 528471;
 Tue, 02 May 2023 10:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptnLt-0000rl-CL
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:35:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0815b569-e8d5-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:35:19 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:35:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5507.namprd03.prod.outlook.com (2603:10b6:208:284::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:35:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:35:14 +0000
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
X-Inumbo-ID: 0815b569-e8d5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683023719;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R+AMK7zkOiW+LnEf1od1SO9FS24cWue2G22D2IbXJWM=;
  b=OtSZkT1HLzwFIt/qq6giEXsuesyhS4G58iu7p0Afleb2UUDIA6TnFhuo
   4LSPMp5lJO1cNqsfPAO8HZIOvzK9kBVE7qu249ZCW8If7REjKmItMTvGn
   voSHMhuLiRM7MnPjsIXaP2OvUDvzFlMtncfD034RSsnZIXZ5K2cC2KVvL
   U=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 106882132
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ts4MW6/iy0m4UVtnxmkvDrUDon+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2AXDz3XOa6KMzb0LYhwYYi3/U0G7JPcyt4wGQc+qi08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkep
 Pw9CjY3QSmNnsSN5O+mVvBOj+sKeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANxCROfhraQCbFu71HVUBBwTXHeCs+inh2myRoNPc
 Go65X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0uVSs45SPLkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:l8P3U64j5jJiDGMW/gPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-Talos-CUID: 9a23:jbbHTGE+7ecMc/kuqmI3pU4xOMYfXUTT1VHrBxKlFX9LQZK8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AjNAqwgwib5BeGdpRn4xnLBRiTZeaqLa3T0wMlJw?=
 =?us-ascii?q?qgtuVKyFXNyrMnG+RbJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106882132"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f335TTLAV6yBmzpReSgML1eNRD/hvsyhFK7YtZdHGMt4fmskG1rgaKWXi7XHtttp90GsaOq20irEy99MSGiIe/TqsOlRV7/ADFYuzvss6Tz00vv3xszLO+kYCdSEBEg7+XiL2p1Sc7tdOQYxmr/ZVaxRYtOOsPg+CXlJfOzmr67xHlo+JA4IHpGTX4o+FVPoknBAz7TJXqPdnQ7uxopiOBTFGX+DC/82QvSrzsgecYS5DNsFkYclWHGToYxed5neN8hHwq/6COE91NUqG9YERBrRkF/xRJX++IqVaAMvosHTmt3Bl3+QfMaZjItcZAVup/H+0EUaTmYEfxqbTXUc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jRCMgEtM32NM/MjsLxwPGxdGv3dmM0sdW8hY20jarw=;
 b=J1nWLPKwtrQT+uUvMEP/7UASUwy9a7/rOvSxKZQ9JXf7YelkYnMLAChJ2ODs0LQfm4bAlTouvLsLXrK4Mtbrm2KsrJUp6Oe+9C+0f1rsy/2lScLhA0UO8q/J8LoVITVeBUve+pvlf5OplwDPUoTaiOjp9iKznhABip1yDxMVnQnAlh5+Z0A6xjIlRbj+ag+YGWR2Gwih3/Inu3pj+4HW41aGMsd+QuLhvyAc+RjcRCeCzxCZDh4t5dhFMSz3tjFjkTPhBi6fkfcSngULGtiYnR/s8/skKAc0HjV7mnZEMJYy+UxV1NxSq0c93wO7YB1XDx4wudL3FRelJC+82wo7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jRCMgEtM32NM/MjsLxwPGxdGv3dmM0sdW8hY20jarw=;
 b=kwMON9oe6rWVwo1AcmdRJd3HL/T9ZfkeMoQQ4HOtCEWfTGtk14VCM9PaJ/qrAgIq0uo1A2J/HjcmlD0Ot8tx/Vbor85f7DrGAN4+i6eOkzrNhICWABeU6GvR2blEMOzmc/JfVlgplYQ0GLbyk/+tE1lE3YQvFvtuR+K2LxtS2RM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c49050cb-7c86-41e7-913d-8f03f4f4b156@citrix.com>
Date: Tue, 2 May 2023 11:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <ZFDl6rSYRzNEoVX6@Air-de-Roger>
In-Reply-To: <ZFDl6rSYRzNEoVX6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5507:EE_
X-MS-Office365-Filtering-Correlation-Id: 75da98d0-ff16-4db4-0782-08db4af8e9b2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6UFj5GnSKv6Zyk37+kG/d+fOHuVMLSHZ/UuYaHqo42ZzyqtEy87w1Qm8yog719wMQhnZbA/0gUOxdTKcr/iVBdkBZn3zxCSFbDvxvUcmvQM25e5kdGvgmnIEAk3YkPDNHVCaKSPvu8mOnljY93VDdiWZEI07bW2Wxl5lIlAwTCpXxr8dtC9ND+dSYUBpv+5cEWUP6prVOKV8j+lekxlHtnkFIVY7OOOI58+MgQkblKhUixUiR5BlMTaHIHOEEl9rnrcasWi4e3kh6jTp5+xUFW9UYHEXVwn+YW2lwrUJqnO66Mft9pEHTEBernbLcJLPITpPg0EIBASS5RCtlCRDpgjVnJQYYDmTZ0LR44ZYPUmfg1wrCMWsE2s4iLbxnUZ4ozKBGzVxD9Vduk1BBxroR0AONmDEPlerCUfOHsHI7xc+vMw8Th6hfD8mw3TG8xRCufRgsuVYlwCak9oZQ2anYEi8AtqivbY+G9bLtEOZYIWldzYWQlnlLrmfriLRPxqkQl5vaWq1oo2htzFUO8MwkbECaCbElAUv8Oo/+DLmD6JPuFFyLzVfB60yMOuZ/OE04TwvfKHTDK9fz2DUo9gYcgeI+X5PxJkQdyEByut3ChFx6mmLLdijSZY+UyvsEehi4gFm6mNEV4wKmAUePionPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(6666004)(6486002)(186003)(83380400001)(2906002)(53546011)(6512007)(6506007)(26005)(37006003)(478600001)(2616005)(31686004)(36756003)(54906003)(41300700001)(66556008)(66946007)(82960400001)(316002)(86362001)(38100700002)(5660300002)(8936002)(8676002)(6862004)(4326008)(6636002)(66476007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWI2NGhBYm9kNVlGUHdSc2tFQm9ncGtnVkFsVDdkNGhFTWdjSlA0SVU4dkhC?=
 =?utf-8?B?TmlHNXZIeUNHVDdHNGJyRUZ1YzhhLzVHMTZ3OTY2Zmd2UU1Ic0lJeENmSzBi?=
 =?utf-8?B?R1Rnc3RSektaaG55VTZVWWUwamQzVDV6OFRSZWJ5Nnk4c0dmbWhPeEhMbUtv?=
 =?utf-8?B?WDh2WDNlcWNLd2ExbkxMclI2VTNQUjBVNmt0SzFlS3RWSWo1blVRZFF0Z1ly?=
 =?utf-8?B?Q2taUjdDY1pxNWoyOGhDdGRGOUd1VzNvNkcrYjBnTjdKb3gxaHc4b0oxS0pR?=
 =?utf-8?B?ZGJocXBHQ3hWZmpuTVBydkFJYmNJNmRXVWlqRFVDcHhkSVFKeVkweWdhcXFw?=
 =?utf-8?B?UVFlSXZYZ1BPNU1Vcm82dC9oc0JhU2U2LzJmb3dDY0FnRmNSN09oTXJsWjFL?=
 =?utf-8?B?bHYrSDVPWGNZclZpRkgyVmZxejhacDB4WHdZTnFnNnUvQkx6VTgyeE1xdXpZ?=
 =?utf-8?B?M1ZaQTMvN0hkT3RsWVh0UTAyNGtkZnBFcWo3RW5GWWg0NGM0UUZYNXF3Skll?=
 =?utf-8?B?SFN5RHl1MmlkcDNvZENmZFhHbWVZaHNLUDh4VmR5MG1jcFJVR1A0Mk5BM2Fr?=
 =?utf-8?B?LzF0S1Z4dW9NZ09XeTNKdzBBZHVtc1N4UGdiQVNVcmxOa1NIS0tPSVBSMTlW?=
 =?utf-8?B?cDhnUVpCSWpBbWYrMDBVZ2syeFJNK3JGNmxrTytobVAzVEp3bTkyQm54SVVW?=
 =?utf-8?B?Z0h5ZFNOVHp1YzlTRzM2RnJZUlB0RjVsU0RlSDlCSUQwZllMQWljYzdIbUQ1?=
 =?utf-8?B?UGFjUXY1QUVId0NweHlTYmw1b0RSeS9oNzB4Y0o5RThKY0xZWHlTVG12UmZq?=
 =?utf-8?B?eXBnbVhGZ2h3YVFkenVGTWVBWEl3dERWQmNiZGRvSk83d0t0UHRFdzZXN2Jx?=
 =?utf-8?B?Ym5EWGkvN0I3SHArU01vdHZDaUV3MWJnUnJwc1dLN2dKbUZVV0hSQ0thQ1Ju?=
 =?utf-8?B?THFQYXl1QldaZGJnL0txVXFPcUxKOGdlWWhnOXRvdVU3Z3V0SnNWVVhITXR4?=
 =?utf-8?B?QjhSZWFQQXZxVDY5d0VOZTd5OXZKeDNWbzlPZTUxbFRFbm1FOXZGbnBsSmp4?=
 =?utf-8?B?OUhweGZqeENmY0JGVUtFamZ2U3I0emd6UitCZTFaRlRvTzREMDRLZjVpV24x?=
 =?utf-8?B?SFduL0NxZ1RPODVlUkxtbTdDMmxmTFFJRzlIZnFscGdIdjROQUlDdloxeEZq?=
 =?utf-8?B?bENnYit6eGVCMDF5SUwrSCtMdjh1WXBYYUYwbFBMYkcveUx5OWxLcVJVU2h4?=
 =?utf-8?B?cVZGc0VPb01lbkI2a3B5MHkxSW5LUm50dmFqRnY2WjNUSms5UUpGaitxY0tO?=
 =?utf-8?B?M0xWVUUwSjN1bkZzdVJtRVk5RzM4TDlkS3RWQ2ZNRlNXVXJUWGRoVVNJa3Vn?=
 =?utf-8?B?U2lxV3ZLZjgvcGhrVzZMY0oxOW45N1FnbW95MmZVU2wrS1lncWVOdm9jcHBH?=
 =?utf-8?B?a2V6eGpNcENCZXc4dDRFSkJ5SVNjTXhPMnZBMzhmKzdHUWxtUDZxTUU5QXdC?=
 =?utf-8?B?VTlKM0N5K0Q4cWFpMWU2dWovekV2RFJJOThUZ05qYVoxeEZsdnhyMURiVkdr?=
 =?utf-8?B?Q0NDdWgzNTFsa080KzhYa0RsK0d5d1I3ajE2SEl3TWsxM05TV1NnMDlBTHhT?=
 =?utf-8?B?YVJadUtnTFVzVjlRalVqTi9TSzZkbHlvSnBwVVlZcFNiU0pUd1ZtV0RnNDFL?=
 =?utf-8?B?ZThwY0hjb0hBVklINzY2U1IwNjNaSGNrbXJkejJoOE1xTUtDTnNiM0VKYXA4?=
 =?utf-8?B?V3hEdkhLSERiaityclVOUWxNN2h4dThOSVBNU012RkkzTjFIOXBSRWZlMHIz?=
 =?utf-8?B?ekZ5dlBTSTFVSkRkenN4RWovQTQyTnBlQmsxV3JYejRodkVvOElEbDUvTzda?=
 =?utf-8?B?MTlHaFBxWXYxMDdGUFFGTGVrZm1yMHFCWWlUTTUxdjFIZENoV25FUHBVZnJn?=
 =?utf-8?B?MGdNNlErK2NyM3Q3NHlaUHFSSWorcUU0T3Rka1Flb0trT0YzbXFpa1JPUmxy?=
 =?utf-8?B?QmFYZlNjNGdaY25yaXl0NnNFNGUvb0tEUDRiUGFWWWUrN3ExdUE2TkJYS1hw?=
 =?utf-8?B?ZnBER0JWS3lSaUdKU2lQSVdmLzEvOCthVi85T2puWm5TMXlWNTJKeHJIS29C?=
 =?utf-8?B?Q1l4UlBGd0t6WUxoSmVOSFExZTRxZXYwb0xXMWVKUVU4bnA5eHJEblB3OXFJ?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a6oQ0M+WvMLO5XysweIg/vPBO8wSbUC7Yx4Wu+Y+rCt/MfA6gLiUjP6klys4eGLlL/SBIjZ2sLLeOQZ6nsncL+o/4xVtmkWb16zF/lVSRjeVCa+gcVhZw3E2dQq92yWGphtxsBdolU6vEd4tXW6eIQ65+NwCWck5VWy/A33Ghcy5xRrufLexfJVkTSz0LZEy6S8D0xkmJPXk0u2DhGujs6yl5vAFB2OQAwfDB74EfLSr6Rf2stIcv1NDGZPLUYV01454HILpY6BoTnN+y9UYJ6sDbGYtUu8KlFvGfizod0E/DbeDEVP3mig+D4e+1MkXebvsfVQs39YcE0os/vtdCCR3kqYnLpjbo6s50Lcdg5xcBYS07RT6YR7633rdSYv6vsRae9ctUikCMGg156tBNWJ592GNVvrGavp2/ZQfd21H8zyD4DsN9gXXwOTSvEQTV5/7n/4SRExnOqYRTADFM0ZExYFnBnCmznU0PxaCt7E2VC/xbUWrBwFErQPwy1qFYV3nMkxqsVUus0Am+3nE2wlFnqylHzhcc30vhM8CztVil3LWHIbc6tuCLNg+ERUY5+fae7VOgbXMpklx3+lsaTos3WwlmdhP8Pc0NmKu7bEFOmtDKouBo5Xg58n5FFH4S1qyBGKwEqoSmGeq/zar5bUlnSqnA9OWJPAzaCfUZmMehg2kL7J0e0Ug6BTPm/3dTZZEUqr1dWFhzsbDtfVZZcAMt8+332H5zoIj4yj2jXp33wMp99g8QwGY291Ms67xmbhasKOzPcHW45h0s66f98TNtNjc5HT+P8S3r2UeHL4HzbVzBopq2AuT0LsDGtcd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75da98d0-ff16-4db4-0782-08db4af8e9b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:35:13.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r3AQbMO3EihMQsXrzbyGw2uqrlo3N31b/Xg1rB+Mwe7PjlfkBJrDkxcmVtL+L0E84IgxWksSbfo6dVjc+tcewCD6rQtyWA1rdOyWWwD7Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5507

On 02/05/2023 11:28 am, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 10:54:55AM +0100, Andrew Cooper wrote:
>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>>> Ensure that the base address is 2M aligned, or else the page table
>>> entries created would be corrupt as reserved bits on the PDE end up
>>> set.
>>>
>>> We have found a broken firmware where the loader would end up loading
>>> Xen at a non 2M aligned region, and that caused a very difficult to
>>> debug triple fault.
>> It's probably worth saying that in this case, the OEM has fixed their
>> firmware.
>>
>>> If the alignment is not as required by the page tables print an error
>>> message and stop the boot.
>>>
>>> The check could be performed earlier, but so far the alignment is
>>> required by the page tables, and hence feels more natural that the
>>> check lives near to the piece of code that requires it.
>>>
>>> Note that when booted as an EFI application from the PE entry point
>>> the alignment check is already performed by
>>> efi_arch_load_addr_check(), and hence there's no need to add another
>>> check at the point where page tables get built in
>>> efi_arch_memory_setup().
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/boot/head.S | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>>> index 0fb7dd3029f2..ff73c1d274c4 100644
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -121,6 +121,7 @@ multiboot2_header:
>>>  .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
>>>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>>>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>>> +.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
>>>  
>>>          .section .init.data, "aw", @progbits
>>>          .align 4
>>> @@ -146,6 +147,9 @@ bad_cpu:
>>>  not_multiboot:
>>>          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
>>>          jmp     .Lget_vtb
>>> +not_aligned:
>>> +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
>>> +        jmp     .Lget_vtb
>>>  .Lmb2_no_st:
>>>          /*
>>>           * Here we are on EFI platform. vga_text_buffer was zapped earlier
>>> @@ -670,6 +674,11 @@ trampoline_setup:
>>>          cmp     %edi, %eax
>>>          jb      1b
>>>  
>>> +        /* Check that the image base is aligned. */
>>> +        lea     sym_esi(_start), %eax
>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>>> +        jnz     not_aligned
>> You just want to check the value in %esi, which is the base of the Xen
>> image.  Something like:
>>
>> mov %esi, %eax
>> and ...
>> jnz
>>
>> No need to reference the _start label, or use sym_esi().
> The reason for using sym_esi(_start) is because that's exactly the
> address used when building the PDE, so it's clearer to keep those in
> sync IMO.

Hmm yeah, fair point.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
the extra note in the commit message.

~Andrew

