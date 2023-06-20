Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF36736CC1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551844.861583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb6o-00034U-K0; Tue, 20 Jun 2023 13:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551844.861583; Tue, 20 Jun 2023 13:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb6o-00031C-Gp; Tue, 20 Jun 2023 13:09:22 +0000
Received: by outflank-mailman (input) for mailman id 551844;
 Tue, 20 Jun 2023 13:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gdue=CI=citrix.com=prvs=528cf68fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qBb6m-000316-1x
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:09:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9309756-0f6b-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 15:09:18 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 09:09:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5257.namprd03.prod.outlook.com (2603:10b6:5:249::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 13:09:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%6]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 13:09:11 +0000
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
X-Inumbo-ID: a9309756-0f6b-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687266558;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=geye/vQfKUyyQYxjkQkLDT41MdOFebl3PK66vjLBmsU=;
  b=bYlqHOc9+SdxW9/CZ9u4W4kI2CuifzSXfAYIYbT1G45axIfMIjTjDHUu
   GQDxUmOTDd4JrqZaoQRNWC5LBxh2mgm0rI+c8GUblMm6tt5ISrkigrg//
   QwJCCa2Cj55npp2zE7EA6Rkjf9E+ow3K/GcZhC8a5PtxR7ZeOXn4W5qGy
   Q=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 113870472
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7J1RP6JZMmHIWy64FE+RY5UlxSXFcZb7ZxGr2PjKsXjdYENSg2QPz
 2AbCmjQPPeMYWGhc9Elbo2y8kJU7Z7QmoMwT1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SHkte0
 MU5Kgw0c1eA3KWM+YC+YfRj05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13b+QxX+kAur+EpWm/OFuiX2ahVYZJ0EEClfkk9vkskqhDoc3x
 0s8v3BGQbIJ3FeqS977UluyqXqAtwQdXfJaDuIh5QeCjKHT5m6xA2kPTjdFLts8psIybTUv2
 hmCmNaBLSR3saeeQHaU/Kq8pzKuNSUbIGkOaDVCRgwAi/HqoZo6jxbGZtxiDKK4gNDzFTzqh
 TuNqUAWm7wWhNUjy6a/8FbIkj+o4JPOS2Yd5ArNWXm+xhhkf4PjbIutgXDD5OtEBJaUSB+Gp
 ndss8uT8uEIS42MnSqlQeMREbXv7PGAWBXenFgpGZAi/jas/neLfIZM7TU4L0BsWu46fjvub
 F7WqBlmzpZZN3u3bod6e4u0Tc8tyMDIH9n/SurdaNYIZ5FrbRKG5wlnf0vW1Gfo+GAujKU+N
 JGzYcuqS3EABsxP1yGqTu0Q1bsqwCEWxm7JQ53/iRO93tK2e3q9WboDdlyUYYgR7qmJvQHU+
 NZ3LNaRxlNUV+iWSibW+IgXMFsDa3wmHZnsqspWXuSeLRFrHm5nAPjUqZsqfIp+gqBJl+HH1
 nugVVRVzlW5jnrCQS2aZ3YmZL7xUJJXqXMgITdqLVuuw2IkY4uk8OEYbZRfVYkq8u1qi8R9Q
 PgMd8yDBelnQzHLvT8aaPHVpZ1rclKomAeHJWylaTwzcoRITgnFvNTje2PSGDImCyO2sY40p
 e2m3waCG54bHV09UYDRde6lyE63sT4FguVuUkDUI95VPkLx7IxtLC+3hfgySy0RFSj+KvKh/
 17+KX8lSSPl+ufZLPGhaXi4krqU
IronPort-HdrOrdr: A9a23:J5sKO61rhf9AOAI851A5ugqjBJgkLtp133Aq2lEZdPUMSL38qy
 iv9M536faGskd0ZJhAo6H5BEDuexLhHPJOirX5eI3SPjUO21HYV72Kj7GD/9SIIUSXygce79
 YCT0EUMrHN5C1B4/oSlzPWLz9P+rO6GeuT9IDjJj9WPGdXgo9bnn5ENjo=
X-Talos-CUID: 9a23:BvBt1GwwcQcGQUGh4iqDBgUxBeo1V0T8zkvpPgi7UiFTcY+QYkKfrfY=
X-Talos-MUID: 9a23:5FBsawR/LvC4G6LmRXTyji5mPedhoJ6kJxwfzplZievZDShvbmI=
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="113870472"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag0HJ+eUtv84PWGYfSDvI0XqWd4eJTcvoDEFWKizHD4mCOVrC/x6T3dXHiSSnJ/UsLzx4lVopp5FqWBSj2WWHGwFGPuvl7TYOZDx5OP7KQcP1xkNm6vhqz4PrXuZb/qF3Id2CEYsjxDsD+RY+VE60usp+5UCqXZZzJyT0CY4JlrVh00vsa+Zju9H0Ap7AYOePZMAd4O3zgrFEN3u3AdlPQhmqgZlrctHymoPyNX8Lk22Z/rb4HL7tNrB+QOMhPtu2n9jt98YGNxaKPsyWAU0k99dRj2pO7nV1gA3j9850KRBvbsaAWMvNMaBOp/FcqHiEB8izMCyUTpNLnsaryTZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnH3awvM4WqAkaJrdKS1x7NIXDtHHF/z8us4HOaa628=;
 b=FSdb54pT+qUHr4WksSyRbt0+WhUH1LSYnPLGKgRLbuXOpL/rSmaBX/YMwfwzt+/LmpLgvuqcI4Z1ROX93XQTV3LifKDiqiJAY8cHc+J51Dq4p+J1lennti3ukWHcgcuPv3WzptXuMC3fAv4DRwdlb6ypQE+czBitQEjsUtLusH6l4iK/sLKLoMhdKC+BQG6YkTZ5OnlhxDWIyERuVqXD29QrgZqMBqrL8vOaC1qzPQacZ2apK5vm5MTg9r1EIcrmMI+pRtdsDpoPTxKbseSeoMxznzDbreeqmh1eiXrU69SOTHDZV6Gk8WPVCg6ax0GDajaiquOw2XPAiGSKGu9P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnH3awvM4WqAkaJrdKS1x7NIXDtHHF/z8us4HOaa628=;
 b=IJ694I88G9EmF9D8a/FSsfXvOjCmmcR00D7q8vrLZyHu5NK1vWqrTkMEDXGOG6G/i6g2cj/mM+rOf1A/gj1U/cIHfftq5DHQx/kcUhFKLBJIqExLqYr/0A1Gwf55OyzJ7+2BEP2iORRy+04txwXswn2w6TdgxobaF50E3oaeguA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 20 Jun 2023 15:09:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 00/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Message-ID: <ZJGk8LgNUgWcqNbu@MacBook-Air-de-Roger.local>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: a19f10e6-340f-45c2-744c-08db718f898f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZarCJvV+5CnGzOnkfHXL3VmAnVyGiMYEMEs8xqnKMn4V6/xOOotGUdfaUj/tdQ7+iDIPAqzSCYzyGtZBhArqPfPAoabg/e7cHN4nHHZkQcpZGE85Qg9rbM5i1uHInibqwcCQ+/vQnGb2A6pxhhfyKer7f8NBj1FVrPJeDusmTxTMssQTBUGeNEnwzW4vWzP+VtBCgzLNqDpemGgfHKZYL48jjRnTaRzSwCC1kpLa88aiN0UnLmcL4JaS22kjwlJOAXUtSqxzOpCb7J9bQywhH07/nIRciKQcrMVjbf5iEht4g4vraqPFld6RMg+adJQCV+4vfZ2/m+dseydfjfY0Ji330PKavOWBdizYyyU0sYqANM0dRbq9WhNcN81lTVt/lsL2O8qcKf71SWO3v4LZblzjrrtZVaftq2EBu3w4dsNGq5O0hYtlu3nz6214G9f2KtyBG7PAwC53FfJRmfWfKCqeVIvNYcS62iSPgD/kKgeQrZldKv/zAYnT4L1a19XJgXoUe216XcV9Db1ElF03LQuA5nnzKRwyb9yaPjYqG3Dj1FchLTxm3kyv4IhNwF8N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199021)(66556008)(8936002)(66946007)(186003)(8676002)(66476007)(4326008)(5660300002)(54906003)(6486002)(6666004)(316002)(85182001)(478600001)(26005)(41300700001)(6512007)(9686003)(38100700002)(6506007)(6916009)(7416002)(2906002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFkvaXNmVmxhR0NMc2JUR2JaWHA2L1pPSDltOWJpaXRjVUNvM0NNT2pRSHlS?=
 =?utf-8?B?N1VzS09FTUhXMENDVmxaZFphbzZ5b0UrUGYzZ0lHRHV5WGRpOVVES3Q3WUlr?=
 =?utf-8?B?N0tsdWlxTE5YWDM2NEVpMkc2eWk0end2aDMyUGtpK3hyQkw4QTZUU3FON1pN?=
 =?utf-8?B?NGVlVVlqb2xKZGhZZU5wVGRYVmE2MUtNQllCdjI2eFdJRDIyMUNTc2NYeGdE?=
 =?utf-8?B?NG1FYk54ZTh0RVZpQ1RiUnlLMFl3eUJZZTlSWjNHekU3UjlhVDcxbUxBKzIy?=
 =?utf-8?B?UEpDLzVuamN0T05WdlZnS29RcjZDdHREeXVqV3VVbjBrTUo5cXQrNTM3b1lZ?=
 =?utf-8?B?NVlpcGxxUmdBM1hDeU5FaW9FaUJMaUpvV0tzSkJQeEpjekkwQVAvb3VLR0pP?=
 =?utf-8?B?eW1GZlpLR2JDY1J6Y254MC9MNHBXV3NQbjhrM2Q1dCswMEJNTmQ4dUZ4YmpH?=
 =?utf-8?B?Sm9qd2hMdUpkM3F1d1pQSnVidUdIUFRSeFd6RmFTNnpXdFpoUHpQY0FrTTBl?=
 =?utf-8?B?ZHpLWXVZSnlHLzZlMEVpaWJ3WkFwN0RNRVVSSmpibElzcHZKMHVqOWp6eEZl?=
 =?utf-8?B?THZ1QXQ0amt6MHhyU1lvYUp0akVlSkVlZTlmSWFZMTZEUmEwcnlwenlPZ0ZM?=
 =?utf-8?B?aEYxczdZQWRlV2R5M3h0S0hmdVVTUDI4V1B1eXEyM0V4VnY5NEJxWk1oU1J4?=
 =?utf-8?B?WTVEYVVvZjc4T0F6OVFBWWpiRjlWcGd3c0dac1Z6d1NCRklJdmNmS0pac1lj?=
 =?utf-8?B?c2VEcmhyR2hzMVBhaHdaK0N5ZEw1VklhaG1WZG1FWitTUHBXd0V2SytTaTAz?=
 =?utf-8?B?QmhTUGtzYnlyZGt6VVgwVmdNOXlQU2V5TlVYcmJpMEVCL1Zvb09pMUs2TFRi?=
 =?utf-8?B?SHNTTmltQUhTaVN5eG9LVjdhVGVrRktpY2ROUVVZNlFBakl2L1Vxdk5HL2Ew?=
 =?utf-8?B?cVNEQjJoTHNabWczTC8xZGN4NHg3WWVyL0ExbWIwNUFMd1FrblVudjJ5OERF?=
 =?utf-8?B?MUM4Yzg2OW85THJnRkZFSVhOalpValViUGRmcVVreFNDbDJ3ZU5vYURtbmN2?=
 =?utf-8?B?bFFkcFkzcUc0ZWlnV3hjOXhCSEsvM1EzbC9HWTJoamZlYy80U21GY3VsRk1E?=
 =?utf-8?B?WWJSbXpnQytLQnYwbUx2eTdVNmt4dUlqTUpEQlFzVkcxY1BsemhYK3orcGcv?=
 =?utf-8?B?dEoxdlFPaWRibDQreTZMeGR2YW1ocFQ2OGVmR1U2SDl6TWFXUkRIcW0zcnpN?=
 =?utf-8?B?Z3RLMzl6Z3ZPb3p4RDc1SXpWVUJQUXdtN1hrSjRyRVAzRENUeFFuS3ZqTXpG?=
 =?utf-8?B?T2FrK2d4QXpuUU44RXFSd0hrWmxoalJadzN6MS9ZWFVNK2paS3ZVcGluNG9I?=
 =?utf-8?B?SGVqNWt3U1AvcE1SL3VWOHlmRHYwWFg0RGxTeTJHMXhyU2g1MzVoVXdqdDdv?=
 =?utf-8?B?eVQ5Z2pBK0s5Kzd3eUpDTjlaRWZBWENsQ3VGRGhvcDJRQTZzUHlkUmppSW4z?=
 =?utf-8?B?amgxeEpvVUdWVjN2NXk0OUxqSXJvSjlpTExMNno4ZGdhalFpL1d4V0pRQXRD?=
 =?utf-8?B?QkFLcDh3YWphYTNkMGtDNzR1UHI5RGFvTzRxa3BHVHNBS0FlNzlWY2FKdGRr?=
 =?utf-8?B?WXdPeWtLSjRxU1JrODNIL2grd1M4NkhSVkx5UjdFWW1JUDRjcVBINUJTZDgz?=
 =?utf-8?B?bVowdW1YNHdzOVRTbjEza0gxb2l6bWNPVmRjYUdWL05VZUw2T08zdEoyWHRZ?=
 =?utf-8?B?VUVvT0Zub01ZaG05OWRzWThNTmtOREFxNi9OeDZ3cU1iU29FVU9yVzRXTXo5?=
 =?utf-8?B?a3IwdG1NeEI1Z1VuTllUN3dNSHg1Yk5PUzhlYUowQ2I0V2RzakltN2NlUkVP?=
 =?utf-8?B?cStqV2NoSFMvNzluUmQvNFdpWkU0WUhPL2hMUWJ5b0dMUU1LOTN0K1J1aWNw?=
 =?utf-8?B?WHZsWXBEMnM3RFFuaTVUOUt0Q3NmaTFPcnZOdFpXTXlNTUlZSGZadjAvNXVW?=
 =?utf-8?B?aW9vTDFjSElhSVNOdU9NNFllME03VmpXRzR1MzdreFZjWHQxb1g0TWpmZml4?=
 =?utf-8?B?NkhxVTRrcTdpdkI5N2RHTkkzRnFkenphZnROald4UXRTMWExRVRSWU9Kdyty?=
 =?utf-8?Q?dMoZIjqn7guAx7x1U78IcfvKL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?T0JaZ05TMWZMSHlnVGkxaGFXTXROb0tmd25Cbzh1SDJKakphb0FVcHdjVmwy?=
 =?utf-8?B?eFJkWG50WVlNVmdqUlFQVEdmbzc0cjJwcm1XVytERDF3YTZxWWhxdnAxeFRJ?=
 =?utf-8?B?eGVYY0owNWw5U3ZaOXJvYTI2MmV4MWlMa3VtTXBaaHNTWVlWYWlGU1F1Wm0r?=
 =?utf-8?B?bjdVSHpaZjVjTnZIN24wTk8wc0crWmtycFZvNVlhVTJOcXBzR0Z6M1k1eklF?=
 =?utf-8?B?aDAyNXRhR0VLdkxwWGxidG9GNjNPdEdrM2xId0MvU0s5YkpQRENtT0hrTWc4?=
 =?utf-8?B?ZjhOV3Jmc2N3SkFPbDh1S2ovT0RDQndYbWtPSVBtMW44VjkxSEs1YTF6L08z?=
 =?utf-8?B?Ky9wMlkxZVVrRDZNU01wVFRzTkdXdUN5YjduREFmOHdaNWRkZ0FXOEFwR3Vi?=
 =?utf-8?B?Zm5BbDJuZXZDOFdFM2ZaeDMwallVRlhMVDhlMmlMZDQ5OEZRK01GMmNxT0Yw?=
 =?utf-8?B?a2lHVlJmWk44K3BGTk5LM0pKTDNtTFEvbS9KNUxRcGtCN05WdHMzQXRPME1P?=
 =?utf-8?B?UmNnUzR1Uk9vUWhmemhhOWRoTzJBQWllV25VU1RBRFNnKzJUc0hXWUJNdXk4?=
 =?utf-8?B?bWVjTVFSblRjUW5YN0JtR0dzRXdWSjNaS1p1TEIyKzg3NTF6YXpxQU5wY2lO?=
 =?utf-8?B?UUcwZFF4QzFLTlRCbkJFditjMDNWS1Z4bHA4bkhZTXFjYjFDU24yWnBHSmtS?=
 =?utf-8?B?by9vdmtIR2NQWjFQQWpVemdlaDB4K0RkalRaOEFlRGs4eXU0ZURBZFRzNk5X?=
 =?utf-8?B?ekVibWxoL3NXbkZROFhDTjhxKytMUFBoUmx3M2RGelhUT2oxTTBjUmhCMjh1?=
 =?utf-8?B?emdUZ1BCRG9Hc2ZHK0RoUWNVQWdhZytMK2dxZ2I2bkVON1IrenFRZEZNNEVx?=
 =?utf-8?B?T1hjT2g0NzF0akJVK0pCVFJWeWtCVlJpSk1tK0h3Rm5sYUxEb09iaHl4aUtI?=
 =?utf-8?B?S1M2WDMzRkhXQTVEUExvdmlXdS8wbmJ0cXMvZzVSQ084UWNHRFY5VFJpWTZk?=
 =?utf-8?B?SGhmYlkrUUlpMmVDRWVzWkpYMlZXajFGbWUwbmdJalZaRDNINXI3bUd4NDVT?=
 =?utf-8?B?UGRnQ0pWcDlsLzdTWGtadzFuMzVzUmlic2ZTeng0WkdIVTl2TkJKc2ZLeEQ0?=
 =?utf-8?B?d05pUTk4QU1SRkpaME5VY2NCdmw4SUM4Ykc1MUJIaTJWbkRzU2xRSEIvQXlR?=
 =?utf-8?B?dXdYTnlrcW5TbWxIa05Pbk50ZUhTeXZQMkJGQzNyRC9pMUFhakpPZk50c1FL?=
 =?utf-8?B?RVUyeVhYMlQ4MkU1S0pXTVBCc3JTYnNwdzBNUWtUQTEzaTVXbWpJV0ZtOTFG?=
 =?utf-8?B?KzE3MFpjcGJGUFA4NHJ1RjBGT25CeVV3SVRDOXBiRWJNWVRCMFNLS0xUVCsx?=
 =?utf-8?B?Y0tTSjFZM2xVTU1yc1Nvc2dSN3hjWlNyU0hZTjdZbGFyUDVSUmoyWGlSNmZp?=
 =?utf-8?Q?BqJ1AHPs?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19f10e6-340f-45c2-744c-08db718f898f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 13:09:11.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9CebyTqGWXq6uoVEoNDfJ/AZYCOseirD7QFkFcFQOuXYfmyF2ImMFIOXdcCn3C8UgEo/9cummLrklI81A5z8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5257

On Tue, Jun 20, 2023 at 12:34:52PM +0200, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline 
> states:
> "A "u" or "U" suffix shall be applied to all integer constants that are 
> represented in an unsigned type".
> 
> These violations are caused by the missing "u" or "U" suffix in unsigned 
> integer constants, such as:
> 
> xen/arch/x86/hvm/hypercall.c:132.17-132.26
> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
> 
> The patches in this series achieve compliance for MISRA C:2012 Rule 7.2
> by adding the "U" suffix to explicitly state when an integer constant is
> represented in an unsigned type.

I wonder if there should be a patch to CODING_STYLE also as part of
the series?

I know it's in misra/rules.rst, but still it's something that could
easily be added to the CODING_STYLE, unlike other rules that are more
abstract.

We could also settle on whether to use lowercase or uppercase suffixes
uniformly.

Thanks, Roger.

