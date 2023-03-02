Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF46A81F3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504889.777323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhpk-0005vO-Bz; Thu, 02 Mar 2023 12:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504889.777323; Thu, 02 Mar 2023 12:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhpk-0005sd-89; Thu, 02 Mar 2023 12:14:52 +0000
Received: by outflank-mailman (input) for mailman id 504889;
 Thu, 02 Mar 2023 12:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXhpi-0005sX-QE
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:14:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d24ec500-b8f3-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 13:14:48 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 07:14:44 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4997.namprd03.prod.outlook.com (2603:10b6:a03:1f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 12:14:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 12:14:42 +0000
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
X-Inumbo-ID: d24ec500-b8f3-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677759288;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XGcaXERPXAwn4MUXz5iO094Xazgu7XTRELxSDpc1vIQ=;
  b=ChJTRiNAwuqqbov6fR/TMm5YLOQ/360qODX9hb+tgXMyZXtKwPN3qF77
   4JIF0F9qlmJGoohLfAyAtLZigSiJEvBclwprTnB9/Ug8kM7Pqgc7EYqKT
   DkBw1HRLsUg+2EAdC2PpnZKnl1Vw1l4SVPa4pcdncMw3pZeZmtiNt1jS3
   s=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 99080902
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:af8ukKrJLPg8WR3O8BzofyL41YNeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnTb/mDNDbwLdB3OYXl8hxSuZ6DzddjSQtlrSwzFCIb95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzyNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAApTcgmzwP+W+bjlQ/A0wfwgdvv0EJxK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpp6Y62AzLnAT/DjU7TniZrsiZqXeERpVfO
 lA9wgFy9YULoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSfSxloesR2G2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:LoiaIq8BZ1EPqDXX3+Zuk+DhI+orL9Y04lQ7vn2ZKCYlC/Bw8v
 rFoB11726QtN98YgBDpTnEAtjifZq+z/9ICOsqTNOftWDd0QPCEGgh1+vfKlbbakrDH4BmpM
 FdmmtFZOEYz2IWsS832maF+h8bruW6zA==
X-IronPort-AV: E=Sophos;i="5.98,227,1673931600"; 
   d="scan'208";a="99080902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNmP+b8sXaWmTb/Z8wr24+2XUf2IOEgtFfyJFsbmqCH22O53MbXSdLTy3cdE2o0mdNvb4Moi+NVVE4iGWZbFgXncACpW27Fy2A4LFVTgtTERKIRgSUM/hu3VCNhaSCuu9TftdQxdJv8M7pHj8htDxTYCAx1s6omLV+T23xKNOLqIftfnK/DQecgbEY/5xBQAYiamEpD2MU8WN5l40WYOtlgG7QyS7JCmZ8OsDQfF6gAaXv9ICFrjEcyc6jyaI2+b9MfcPmZncL/Cq3rLOPjwKcgB2/hZzo4tgfyL3D3ItsG9/BIP+2txX6Efp49qfmup77kOlQ1EUNqK9yPOiqEgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrVnOIa3zlwTrc8qgB+Ke13N4aAcz5GJXauOkhrRUVw=;
 b=MTF4ivsWSfUl0L+i7yk4D7sFrFPlqrn6l8OFPC/PAb25hPI0/ktkp163ehedgCvHzdFFnqW8MuGH1dhzmorPvB1R5zm9M25u/Z+IiB6F0qB0UvLtBe8kidTWxtMopE2s/ljLbwkKJreKqOy9H+CTKqFG/4LlEvbFg6g6FLvNtMDRYHuMd3FA7+9oQINlIfjx2Xe8lNbwTWTCwNwa87IFQ2GbLp32KA0Pa73pEOSE3Q+X5dny2VfAeeb8HCWaHcBjktXYWDIpnm37yYzbN7/BDYviW2CiPEjBsf04shqVn1x9/8k9eQWk66HIECis+Oj6bjgTZtsMeRuEQC/cbTdFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrVnOIa3zlwTrc8qgB+Ke13N4aAcz5GJXauOkhrRUVw=;
 b=dXPozQdPLsf5we4EZb3I3zxsJPa4jWpzcGgHHCpEtXE7bmhua1UEXugyw8f3TIhJJgdMO9+Ei5j0WHkZ9x3/Z3OiW+sWDxfKjeHcnPxaCiJ/dFnfQrVq+1Rg2CE8sExVdd8MqO6yb4iS0aNNIdA6eHYN1UilQEo5JyAOkZxJKLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9cc00334-6f86-50b6-4226-be5dd251e8f5@citrix.com>
Date: Thu, 2 Mar 2023 12:14:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: purge dubious lastpage diagnostic
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <4a33482a-fd89-c8e9-ad5f-1e72dd644d2b@suse.com>
In-Reply-To: <4a33482a-fd89-c8e9-ad5f-1e72dd644d2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b592518-4979-448f-b7d9-08db1b17b40d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1NEyvLAy7Mpw3waKULAxq+WjuugJG8YhNHBb1UYw79AmWiAyhJTAavr/jJZ7PCeu1aatLkO+4i06W3ktV6//4+V0YkblI4zN7FTIEnMvYc1cB1CZjzQ7Xp20grMq7Yc+mFyAAE+T0LZ2tU/BeN5CskiyKHV4ZjGBB8miLMwRD0ImrB6EEJDqwlaQEv+/loQ+PGwaApN5dhYnYDamtAfCBErZ5Ja0XOQ+e7rSLtz2MuW1MJn0tcogAWpILhJQZ1y8Am//xfjWY42fFkyGVk86fkgxNuodnZaHWjS3CACd0UEnQOTNk0JmGicf1rudJMC7539GKdDwA0xiyFWLqA2WO2Pp4F+i7R7VBkDm0R2xYLMP7hb7ls6atGr8U4aj4+WL9bwMUNInT3tserXA0CXljh470FXNnrsUJZZshVRKLLYk3ZWHSL6S6iH0ORybzK8jiWL6zIgbc0qOoBDVeKQN9JUkaX3IIoTNxfUgQWqlMpbhycpHHBNt25Om9kYzNjkg3ANqB834+lwfKWb89UdN4S7A+cQzViB1dmNXLbIqK1XoBzLBhG1GRdrJXL7nc/rBDP/iGvjpp9w4z6jRCWRO5ZKRPj4QUm5DaOCZjQh1R+4rd1vOaeLmDfF01wrrF00ZmL+p3xGkeYi96mgJ7mAY7vGOUgGpSLyrPZnD+HKfT0OuL5N/UpsKcaWBGiJKM0T3O09o1oMopVRd4clDj0c1STwzNOxxvA1pn8bRjXjadCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199018)(36756003)(6666004)(107886003)(53546011)(6486002)(6506007)(6512007)(2616005)(26005)(186003)(316002)(54906003)(41300700001)(110136005)(4326008)(66476007)(2906002)(8676002)(4744005)(66556008)(478600001)(5660300002)(8936002)(82960400001)(38100700002)(86362001)(31696002)(66946007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1FrZ3pCM2NWeVM3Z2NpZW8zQlo2d3JpYy9HMzdQK2pJdW1wNXlMVDNIVG9k?=
 =?utf-8?B?WWszcnZrTlNZQktsWVNITjVweCswTCtPdTdIVmpWak5rTENtVm5xWXRySmFX?=
 =?utf-8?B?TTBQQmdQaWw0WXdGN0xUdm5rY2ZsVHovdGlEdVhzNGtvN28zdmRYQjhlMkpD?=
 =?utf-8?B?NmFXVzc1Y0g0KzQzd0JpR2sxQUdyRzRSTm14S1k4dHVlVlE2LzhlWVZJdXdI?=
 =?utf-8?B?anBaY0pQcm5Sa1RLdEYvU3dqZ2YyNEFucEtlU2JaZVRZakpjVm92NHl0bFYz?=
 =?utf-8?B?NmFmUEFkbVRNSjJNaFppOVNUWXhHYkwwb0RMRldzODZ2clpDUWY4ZDVqWTNN?=
 =?utf-8?B?eExZUXhnS2tnbU03bFJwc2ZhVHdnbmxTa0pZY0pqRUVxeS9qNXdCcHlWVGZl?=
 =?utf-8?B?QWJ1TGF6WkhVT0Z5UlU2TllnVTdCWmtRaHdicFVBU1RsYTFwaVV3YU1NN1F6?=
 =?utf-8?B?Uzc3MWF1NWZkT2VLOUhSVGNZL0F5UjR3NVorTVdvY050T2tUODloOS9uaURh?=
 =?utf-8?B?aXlYSDRISTdrSGxzVDA4LzlqTDdKYXhlaktBSTNoYkVKT1hiWHF2ME1rMFA5?=
 =?utf-8?B?ZlpzSVU5U2F4Q2pqRmJNZ0JweE1uWSsyZTJVQ2ZpSGFZb1JHZi9Cdk4xN0tx?=
 =?utf-8?B?UTZiYTFNUjVBYWVZRmN4eHlBb1JqM2VJeEllaHI5dGZqTHZTV1Rtb0NieUdX?=
 =?utf-8?B?TDl2bkdqSllrVVZxaDRybUUvbmowTzBENDhIcnJ0VHRHbTVCODBkRklPMGJu?=
 =?utf-8?B?b2svblVXS1RsenJjODY2UEFESHd0U3llRTdoeS9nUnZyNGl4SEkyVi9UOEZz?=
 =?utf-8?B?Ym4vR1dWUzBKWTdpMVUxWG9BYThWZkh4T2lYaWIxK0FseUsxVi9RZUI4TEh4?=
 =?utf-8?B?UXBCTlhMVmdmU1poZHpkSFE4UWVwL20wd3FIWCtiaWNRS1p2VzY3NWFCZC9O?=
 =?utf-8?B?TFY2QmpoQmZuWGJQSnhrT1pXcWNFeUdSckJhSVVYVytad2pRQmx5Mit0bVNE?=
 =?utf-8?B?WTMyczdDVTVGeElyQ05XSDhWbFBBVU8vbEtHR3JJaUJNblNCOXI5RFk4M2Vn?=
 =?utf-8?B?am9kMWNzY0NjQkZ4dlJJWTh6cFFOOWF0SlV3L054ZU9qQ1NUK1g2YmV5UXli?=
 =?utf-8?B?MlBuWW1WTzk3Vnd6R2NSNjFNdUh5MjdmZE1HZ2twbzliQmZEVkh3MUdONHov?=
 =?utf-8?B?eUVXYjA5dWt2STNUcGp5OHpvV3VUMFZuelQzVEdqUjVFcWRFYlFFMDB1aUNY?=
 =?utf-8?B?ZmFPRWJsTUFncVhRQU1yNjZKbTZhb3pKbTVFZ0NKYmhBaXp0NkVpajlRR0ZE?=
 =?utf-8?B?ai96SnZxZjgvZTZCU3hJWkRtS1UzdVJRMGVwMkVCdytUeTIzVkEwbFoycTFr?=
 =?utf-8?B?MmU1VE1ISlArU1M4eDZyWlBDVzhLNWJGRG04YlBOSWhCY0pPS2w5TWV6c3ND?=
 =?utf-8?B?alZuUU1RMnNya2FTM1NYN1FvOTZhN1VJa0hmWjlYSFh5SXl2aXN4cEttRDlw?=
 =?utf-8?B?TWdQUHJrQmJPTWtLVkRyaWdadTNDVFNCZjZvVkloQys2VzIvWHpVMjlRblNP?=
 =?utf-8?B?QUpER3FkMEZLVEJPemNGcmNXdEpacFlJRXkvRU0ycWJ5VnJSZEJIMlEvNGUw?=
 =?utf-8?B?VXR1VzNIL0ZrTTBnV25ESkVUQjNLRUFZcG03Nzl4cXAxdnA2ZXRuMlFPSGU5?=
 =?utf-8?B?NDg4ME9ZZCtMRHVDYktSdlljMHp3S0JtMjZzV0s5WnFsZnBmMGEwNUU3YTNO?=
 =?utf-8?B?b3lsTHFyZXpDL3BRRU9oOXVnSStDUVVHTENNMHJXQ3ZyeHdpV0JpcDNxNmJp?=
 =?utf-8?B?L1piTlBFN1ZRNGZVMS9rS3NBN0lDanFjV25COTEzM3AwdTVwZ3BVQmJpZm5t?=
 =?utf-8?B?Y29Yb3FoTXJabndMUGhGT0xDSEFkM1lWWitsTW5xOWtuaER0SEU2MkQwcE5Z?=
 =?utf-8?B?VHZuOWpBem4zNXJScDgvY0QrMGp6d1l0NzBCdGNwSGs4VVZlR1VJbkZ1eWdT?=
 =?utf-8?B?bmpodHNsdlZLcm9aQTJ6RDgxZHNBQldiNndHV3BGVG5ydUxNRkJ3Rk13dHR6?=
 =?utf-8?B?d3R3K0dyNHBOS2kxMHFoT0NKZU51NENHZ085RDRtOU9kYTZYck9LTzQ1UmxL?=
 =?utf-8?B?RExwYlpKdS82dVZ1NTJ2MHZZb21ETUQ5V0hMd01mWVBzb0pJVU0vZkwzRVVq?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KfLrAIsJzUhTXK6lI7cxq2mWft32nTpqjeevvS7hpuOorpVb14rDTlw2gtf2znXQdpEM957dJUYRhkPs/wq64gKVWMigqrhZkfMWW1StX7DIDdi9HtzC/c8W+VU1G2HDdSpN+SOvlo+RdpZQLHMSndVuCJZut9j/WU/UaP2c2+qkVOyqm9PHqGYwhmM88BMXnKzagw+kWiIsKMDXqoTVI8aMd7rrQZHPqIN0chmtZj+CDWSesJ/Mq1f3ap3kExbnnXlLOT52g3UKQSAQ2no0PjzXzMOYX3T82xlEO1lsSD6iIluo3vKkKPhQaDkni/uA6a4E8haM3yNu40BiE5VIAhcHIkjQ/DrDaMGJ7UJYx7j/Wl+Vyss2Snns+QD3LD1Riqb++uE2WGsd8lFH/vxo/FzT4eDUELkxteZjxTB0IUxF7y6BUzK98+5mk4B8mRX8Xu9F1XImwnfDIrxwFG4IcMdxUNEZjWzxDurSe/tqlI3Ya0gsZHIoxd1stRpPc3P/78T8WAJ7uNAL518Zbxg5czMi1XUgyF48mZ4sVKuyE6zkA7Ne0426/gxOHCLIaBpgxyf+Z/MmiH8D/32R/KEHWi4BZh40hZ8IrSE+VWoEj8FXjN0zBuqcXqkwayYbv7r43hnaFlAwm/z8a+lmZ47gA+66Vp7+ASpo044CgsFkaQWCuhF0f2damRS7J/qraGpL83zIuhRT3gCTsUOI4z5H6IFB9w6TUiuwRCjEd1sJ0O5+y8lmpnVLI36455GZAYuEqctG4zj+yyDTq/Z49mGINaQS6i435s3KicfUaP4wt51tovbcHicM7/HQ8VhSIPtF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b592518-4979-448f-b7d9-08db1b17b40d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 12:14:42.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvn2OvX/w8TLVt7nN77cvIC+8/pJUHvuOVpk86rc8K59xPfT30u+jGxD8G7y+MqSXEDML0v7ydAADzFSS8qi7VFz+/8AuFs0bGiwUrFg6G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997

On 02/03/2023 12:06 pm, Jan Beulich wrote:
> Quoting b5d8b03db136 ("x86/shadow: Drop dubious lastpage diagnostic"):
>
> "This is a global variable (actually 3, one per GUEST_PAGING_LEVEL), operated
>  on using atomics only (with no regard to what else shares the same cacheline),
>  which emits a diagnostic (in debug builds only) without changing any program
>  behaviour.
>
>  It is presumably left-over debugging, as it interlinks the behaviour of all
>  vCPUs in chronological order.  Based on the read-only p2m types, this
>  diagnostic can be tripped by entirely legitimate guest behaviour."
>
> All the same applies here (it's only a single variable of course).

Just "The same ..."

It's not all, because of the single variable note, but grammatically
speaking its fine without the "All".

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I was aware of, but had forgotten, that we had this pattern elsewhere.

