Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB975AE8A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 14:37:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566592.885610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSuJ-0002Fa-Bi; Thu, 20 Jul 2023 12:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566592.885610; Thu, 20 Jul 2023 12:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSuJ-0002Cu-8X; Thu, 20 Jul 2023 12:37:23 +0000
Received: by outflank-mailman (input) for mailman id 566592;
 Thu, 20 Jul 2023 12:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMSuH-0001da-JP
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 12:37:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29badf22-26fa-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 14:37:19 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 08:36:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6596.namprd03.prod.outlook.com (2603:10b6:806:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 12:36:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 12:36:48 +0000
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
X-Inumbo-ID: 29badf22-26fa-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689856639;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w1Icpl22nIK7X+cPvedq0tQtlGk2chI8IKZlkTT93Cg=;
  b=AwSzQi0wih0qZ8rlY7BdFQD8gtfq1zwIqvbgbNuoHLhSD4NM4djd2ZDP
   1FK4puwrPaGs5bulXYJB6NChaJBvqZJILYaqaSU4Z4nNn7r62QXBIwbi3
   l0KkBGv7bOkAe5MXO7cpGRlI0nUAnjHfDjE6A5FTWfgaIL5uiy9uB/zsf
   o=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 116153149
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AQz1rKy8NLQREluvHqV6t+fwxyrEfRIJ4+MujC+fZmUNrF6WrkVTz
 2QfXG6AOKnfZWvxe9p3OYjg8RwOucWEyoRlHAJq+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6gT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXp2r
 MYVFSIyV0qojc3sy7uYRdkx3ct2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRxH6gAd5DfFG+3vVh23vP9nAVMgELXFuQq9WJgXfuXesKf
 iT4/QJr98De7neDcN75WBGppW+eiTQVUdFQDu4S5RmEz+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ije/OjMcK2MYUgYCQREY+NnooIw1jRXnQ85qFei+ididJN3r6
 zWDrSx7jbNMi8cOjv2/5Qqe22zqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaL5l8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:FlI8v6iC5Q/+AULsp95G0C+lPnBQX7B23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJrZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF6SfF6k3F6nID+nXiwViXjT/KptH4fiszD45kiZhCehXUxkI8tJUkuZ
 g7ll6xht5yN1ftjS7979/HW1VDkVe1m2Mrlao2g2ZEWYUTRbdNpcg0/V9TEr0HACXmgbpXZt
 VGPYX53rJ7YFmaZ3fWsi1Gx8GtZG06GlO8Tk0LqqWuokprtUE863Fd6N0Un38G+p54YYJD/f
 74PqNhk6wLZtMKbIpmbd1xDvefOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWDZIEI9p0vg5
 7MOWko+VLaQ3ieSPFm4ac7siwkGA6GLHfQI4BlltVEU4THNfTW2XbpciFtryOiy89vcfEzFc
 zDfa6+OMWTXFcGKbw5oDEWZKMiV0X2cPdlz+rTCGj+1v7jG8nNitHxVsr1Cf7ELQsEM1mPck
 frGgKDbvl90g==
X-Talos-CUID: =?us-ascii?q?9a23=3AS/RMJGoyfD+VHhEWTacDhIjmUdsdK0fQ8WXvGhW?=
 =?us-ascii?q?TA0kzQ7S2Rm/No6wxxg=3D=3D?=
X-Talos-MUID: 9a23:cjdJSAYHU+GPl+BTvDS3om1SKMFS/7mnCGsHvaUNgpmCDHkl
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="116153149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky+M8kRsVgVW1OYlbmWu6+U8DwTWiCb2BTQLdgxxDpYfK2kwWrkjvuvEQXTLazCNiHm3BNaJE550LzXwSz+27PBdU+JbOA7Mv5fS6o1vVcSghT4J2dVpGH4BdvyX5Gkfk2k/wKQAhLciHL8zDurZcocBahrw5ni9O29TKTHcq0Vb2g6j6TntsMaF6NJQk8oeSNG1T9EEPST80xsq3TEIQ8kHEQSjFCDj7fcvYVsHAQ9Nm4UyhGJhJecYlM36FKmKWUFopDEDCVC8600teGFQn74EBHeatJ2g3RPiMhNJBZWb1Z8+/UdVFASTA6eh6D7kk7ra0xYCg8hrKfu2ODqoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMKNA1yk8WzThkmXJc2a6Z6aKEci9zW9zd7zX3o15Ro=;
 b=DAb6E4a/fB7iq7jE0KaYVZohOF+/HL1YOhfc9jdIppabzYOHOC/oQB9mkBcuhl8HeyWaJaWQzFtuTEbev3OKKwQLfbRd8D85WjqSP1mMEJzssR2uNQkrmn4TkjLrgRy0D/w2DQHrTCPw/tHeJ3YlsRucc7iOFMqyo0v4ogUth5QpwtLoRV7Y1eLEA8Zwz+KckySNVy9L6LJqTrRsdh2ge4X5Ip/iG7Tai+nKYkwrn8kzEWdG02pi7zgkUMT4xVTYypOlG+070GONoPO3FuLItPkwPvS0Sr+XYnuXt7NIrfSjo71fVgPVtqWbWznAL7oVDdERrimCC8U2HpogPELtbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMKNA1yk8WzThkmXJc2a6Z6aKEci9zW9zd7zX3o15Ro=;
 b=vF+n6uMO0lZCfik9b4E7e6v/t5gLU9N6vZZ4udOI5/PPuei+IQM9m/LgW1TSaX9+Oh9lNOH4ttLyAdTV9Trceet59/Ub0Kl/jRC45GZcy17yNtXJXKgaR5jgrxEsT6wMZ/+LYVrdiztvhNm27lvTuF2UweUAlmpM6h7RCZQsOpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 14:36:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZLkqWXJtYlsJ4M61@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: f64b96b4-534e-46f7-709b-08db891dfc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScxMfICdXMiJOfU8BO/2zHwhxwRDcQT5Fge3WmN4T0O7LmE11lNi+g0OPEO8JZV4ATc5jtFrMN9dTiwlZQtAAeQjcrUsm0jTOBqK+/e3LZSIuSGym874P8nfXu2e3/R17qx+z98ECnsWk88S9NIwyt6E8U6cg0MoKNZmJOOVP0s3WFqWXZkJurCQi5GTkEqharUWKdk9636STg1txkHgSLHLumT1V0rAWIZ9z8Zl52ODmP0daQw3+hOXZJRmKKckymw0UwKyHNcaf81CYBa0x10KZdHm4cfwVj9MNwIiMVDBinPueoH/YJC+4psA89Y2qhqwItAAei81bFYtgT5n1Ph+sai4EBkliP+/ypavL00rT/RjjRD9BorFWWzuqC/sCPq21R9BsFiXQvFVHHCT2SKlHBIXS5ZuxFp2Q5+HF7MkFxcaS/VAcwYEnGEavk2i3L6cRIh7kfLEEu79+NBtSZXuY+Lsy6wdStZ+SmRbNZJfDaCqsMKGx+r4TyDr5VStBDnhJ342/NOg0XvNNR3mhPY2gDddMCB6dQdJ0Yl8QtiQ80erJjRNa0OL5cp8GOh6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(66946007)(66476007)(41300700001)(66556008)(4326008)(5660300002)(316002)(6916009)(8936002)(2906002)(54906003)(6486002)(6666004)(9686003)(6506007)(8676002)(186003)(26005)(6512007)(86362001)(85182001)(478600001)(83380400001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdMUlhoSUk3NndIT1hrN1JtMTBFRzhJRnNmdUNQM3dsZDdMM1dOK1FFeHVX?=
 =?utf-8?B?ZkdOakhHSnF6NDdtTXFlMTB5T3crZitiWGlkbTlaV2RWMXhSY2VQOTRXbGxX?=
 =?utf-8?B?SGN1S080Yis1aFpmSHp5VEdwK3d2Si9leVltWGVkZi9Pem9iK0NwdU1Sa1k2?=
 =?utf-8?B?VVNJOW55NmZxZkdCbVRDNEo0REtKTTVpSkJxaU9leDhSalBKM1k1U2VObFBv?=
 =?utf-8?B?Ny9GVXRublhFNFZleWQzcVFiOXlId1VIc1lQV2VPblRCc2ZPVXJaMWdVZDNK?=
 =?utf-8?B?NEdGSlI0eHFLN2NLRitvNHc4TC9hbXZXTDA3REp2a3FqNDlzTHJCNmt3ZU1l?=
 =?utf-8?B?WVNBeGRkTy96RTUybStTY2NxaEp5eG5WUWpnS3NsTDQvR0xMTE80SStXbEtk?=
 =?utf-8?B?blBHdTlIK2J3MnhzTDIyMFRRS3VpWUdDRlZ0bmpGMjR5MDFOUmV0V3daSi9u?=
 =?utf-8?B?eTZpbVpTbVMzZUFaaG53bzdEdkxFWVl2K29lUmJRNytTUGhkZUxpZWg3dUp6?=
 =?utf-8?B?N3Z6ZTJQMXQ5UW44MHdpeEY5RGhnRVF5eEJlbjZSVFZaQXdjc0pLSk9KTnpW?=
 =?utf-8?B?M0VEQWpQQmlGRlJZV2Z0OUU3RWcwVkpLMXJIVFNGLy9IODdXYUxjaVltVWF0?=
 =?utf-8?B?SGZZYW13SXlEYndFNjhWMDJaVFpFUWQyU3VPemRWYTJqVEdHbUFUWklsQWNV?=
 =?utf-8?B?RlJhcVVUb2duUElXcjhhbkU2ZnJNZEN0ZTBoQUQrdkJiY2NMbXYxVG1HK2x0?=
 =?utf-8?B?U2xpK2hqTlR1Z2pZQXl2azViWFgxd001RWk0ZjV6OG1iRjRRTXNxdEJLVHRC?=
 =?utf-8?B?NTBBRUpsZytJNWZiU3dUZ21Ca0NCeklWTEhpanYvTnpRajJiMFlhMnVHSytC?=
 =?utf-8?B?VmUyVzNDRWFUQ1I3dEFHNk8yMXgrM3ZNcXRlWjJoWXozdXZZeUR1M1RpcUh0?=
 =?utf-8?B?YkhkSlRKcEd6L08vSFdRZEU2UmNPQzhqYVdCamdEUDF1bGRuaUlWMEh0VHhO?=
 =?utf-8?B?SUg5ZjMyRThOeHNhSGZDK1pDcXA5Z1o5aGJnd3hXSS9kSGtCM1hrQ0dmN0Nl?=
 =?utf-8?B?MXZMSm9ZRnVYNGhjSnJ0dmtIMGpVYnVKay94bFZMbmsvOVdZRTRoNUtzM3V2?=
 =?utf-8?B?TmpaWWlZUkc4ZS8zcnlhWXBRS3ZxR2lBWXhlV1RLekg4allibk03ZThDZ0Y5?=
 =?utf-8?B?aUJjVFFMeWptQWtXelFQakwxand1eGRHeFFXS3daMStUWEdNMHFGS0krU2xu?=
 =?utf-8?B?MmdoTytLT2FJejJJR1Z5VmNDcnk2KzVXNWpJbkIycEZyek9EMGZiaWxielFl?=
 =?utf-8?B?cUxsM0pyeTVISXcxYWhLWWREUjd5UXUvUnE3d2tMZThxZHMzUGlIcGFxNWJW?=
 =?utf-8?B?M2hQTEdRNVlOTjZlMURESGFmK3hkdks4S3RvVUVQTE1mZmNXQVdjampyT1RS?=
 =?utf-8?B?WmpFVTNtcks0YjRJMFI0LzZKV1JKU3FhQmZpbnFQQzFqaEkydUpUSWlkV3pU?=
 =?utf-8?B?dmx3TVVYVE9UQUE0Tm5oQTdmTERnRElzU3crS2RYMHY3T0FKb0xTY3F0ck1F?=
 =?utf-8?B?SG5LV3ZNM2hBMFNiNGxOY1A0TDYzeWZ1SE94QnRMTnhwT3RzVHdEb2ZUN3J1?=
 =?utf-8?B?cy92Nng4QW5XTjlpUVZzT21RUGp0aVpzeER6eWJLNWROQmo1K2UyZW1vc3R1?=
 =?utf-8?B?bDZmc09seFR1Tkpka0tsTTFlclgycEZPSWFjYlFmb3dPUEljdm5PdUtFZ2pa?=
 =?utf-8?B?THJybzJoL2FIYTlnaWpjSVJzcFcxSmd0RUVVS2QzNmxvYVdNb0hFNlB4aDRS?=
 =?utf-8?B?NzMzUFlvd2k2MUhtVGVzUmFCRjlCY1ZaUDI4L1ZxN0pXUkYrcDZkM0gzNmVt?=
 =?utf-8?B?T1BOWTQzUi9NVHJVdmc4QzhNb0hOVVpoM25EekdoK0RJMld1WHZ3VnI3QkJq?=
 =?utf-8?B?TDBVWisyQldyODJtQjRML092dlAxZ1R4bERJUlJhcnhuY2xlZWdwWE8rd0VJ?=
 =?utf-8?B?UDVqQXg2NFgzZHdGazBWVjJ6dG1hVkhSS0U5Y0hIcUE5R2pieEZna1RVb3Ro?=
 =?utf-8?B?NFVRdERIck95NzNJNGMzbGhBc3NhcExMR2JrNlZTSEFSNjlFZE5pSkw1Rmpq?=
 =?utf-8?B?dWJFMGwzZlMvQUl3emFZY21IbllZNzZGS0F1c3FnME1OcjJWalh0ejNrT2VN?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mWSbHPC99kfdHlFQNa3EuH+SVe3+RHiM44/UlY2ZwBwtlRWB9mXnk1nMCQcO7dqX73vsdr+qHXUCLfMIODrtdQOermET6ACWB90DL33v9ERaBpSdU24mCtWsmHNKjJ/G6KSeqz7oQ6ritYMw45Sory5Bxy3aoWkcRxNUCz9eq1c426FEqG89bMej4hExz2FoWRCBOtC2PnU3/XYtbTxFFeEIQM+LVq+kPNMNbT2d5WsItE76APBBBWAAL4Lb8c1bmCKHFpoogTdm/T+5kPd4AMNT2xOG6/OoSCapAw988V7SHelH/T9cvRq828hai2gc+DCHvQTlmKraO5YHSEJzQ6KdTsMtrmJa9b2LZ+UqSf2DD/5Ay5FDuSIOOafo0jgMthLsg/js2N/2cjAgy3w3bk1bJH7p0UEUw8gilJPHDH5VOuNQ7DF6bY37w2mzivQyQQ9mnfO4vYkhMF1rDC1tr2D+e07lD4QsFvtizSOPnyZ9eCUG9D6DJhYzcS4SRdl2RgLEYjavUMmMaq2ojFNtI1uafJqpjD/vFDctYcxGJcw5kBuwz1+NzSSg2YUGO5oHTHSjM6X5hUMvNzxQeDR/4t73b8lncd4dKSRzcFSZeuV4+g4T93CvUZE7duMWW9GhF1uCN1baPsZ9u4Mahhk+SbhITKSL6YdihhnxEO1YFI61HNxL9mGu9vdDzDYb8cRpz7WcM7GKzzBqcb8sYCSU0URp72Rk/zGNOYFpaCT0RVEhI+3TdHr7XV+r+SP5UpaimyDlDDr2sj5sM90TKwzfLn0dsSzqzYVuAg+K+mYhtgZdRkwgp/A56HW272l8Guh4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64b96b4-534e-46f7-709b-08db891dfc07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:36:48.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8UbyZTiGAPXCrF+qJ0NcPNGB9RavUCZad8jp7TrvlpC3whvhW1m5QxqfrUWOPC77oD7kuUvZV+Vt4H0weYDkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6596

On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v8:
> - removed vpci_deassign_device
> Since v6:
> - do not pass struct domain to vpci_{assign|deassign}_device as
>   pdev->domain can be used
> - do not leave the device assigned (pdev->domain == new domain) in case
>   vpci_assign_device fails: try to de-assign and if this also fails, then
>   crash the domain
> Since v5:
> - do not split code into run_vpci_init
> - do not check for is_system_domain in vpci_{de}assign_device
> - do not use vpci_remove_device_handlers_locked and re-allocate
>   pdev->vpci completely
> - make vpci_deassign_device void
> Since v4:
>  - de-assign vPCI from the previous domain on device assignment
>  - do not remove handlers in vpci_assign_device as those must not
>    exist at that point
> Since v3:
>  - remove toolstack roll-back description from the commit message
>    as error are to be handled with proper cleanup in Xen itself
>  - remove __must_check
>  - remove redundant rc check while assigning devices
>  - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
>  - use REGISTER_VPCI_INIT machinery to run required steps on device
>    init/assign: add run_vpci_init helper
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 ++++
>  xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
>  xen/drivers/vpci/vpci.c       | 18 ++++++++++++++++++
>  xen/include/xen/vpci.h        | 15 +++++++++++++++
>  4 files changed, 58 insertions(+)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47..780490cf8e 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 6f8692cd9c..265d359704 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -885,6 +885,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    write_lock(&pdev->domain->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);
> +
>      if ( pdev->domain == hardware_domain  )
>          pdev->quarantine = false;
>  
> @@ -1484,6 +1488,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>          goto done;
>  
> +    write_lock(&pdev->domain->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);
> +
>      rc = pdev_msix_assign(d, pdev);
>      if ( rc )
>          goto done;
> @@ -1509,6 +1517,19 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>                          pci_to_dev(pdev), flag);
>      }
> +    if ( rc )
> +        goto done;
> +
> +    devfn = pdev->devfn;
> +    write_lock(&pdev->domain->pci_lock);
> +    rc = vpci_assign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);
> +    if ( rc && deassign_device(d, seg, bus, devfn) )
> +    {
> +        printk(XENLOG_ERR "%pd: %pp was left partially assigned\n",
> +               d, &PCI_SBDF(seg, bus, devfn));

&pdev->sbdf?  Then you can get of the devfn usage above.

> +        domain_crash(d);

This seems like a bit different from the other error paths in the
function, isn't it fine to return an error and let the caller handle
the deassign?

Also, if we really need to call deassign_device() we must do so for
all possible phantom devices, see the above loop around
iommu_call(..., assing_device, ...);

> +    }
>  
>   done:
>      if ( rc )
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a6d2cf8660..a97710a806 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -107,6 +107,24 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( !has_vpci(pdev->domain) )
> +        return 0;
> +
> +    rc = vpci_add_handlers(pdev);
> +    if ( rc )
> +        vpci_deassign_device(pdev);

Why do you need this handler, vpci_add_handlers() when failing will
already call vpci_remove_device(), which is what
vpci_deassign_device() does.

> +
> +    return rc;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 0b8a2a3c74..44296623e1 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -264,6 +264,21 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
>  }
>  #endif
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned/de-assigned to/from guest. */
> +int vpci_assign_device(struct pci_dev *pdev);
> +#define vpci_deassign_device vpci_remove_device
> +#else
> +static inline int vpci_assign_device(struct pci_dev *pdev)
> +{
> +    return 0;
> +};
> +
> +static inline void vpci_deassign_device(struct pci_dev *pdev)
> +{
> +};
> +#endif

I don't think there's much point in introducing new functions, see
above.  I'm fine if the current ones want to be renamed to
vpci_{,de}assign_device(), but adding defines like the above just
makes the code harder to follow.

Thanks, Roger.

