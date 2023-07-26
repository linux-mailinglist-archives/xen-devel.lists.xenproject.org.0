Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE4763021
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 10:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570195.891763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOa6q-0000oM-9o; Wed, 26 Jul 2023 08:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570195.891763; Wed, 26 Jul 2023 08:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOa6q-0000lh-5u; Wed, 26 Jul 2023 08:43:04 +0000
Received: by outflank-mailman (input) for mailman id 570195;
 Wed, 26 Jul 2023 08:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOa6p-0000lb-7e
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 08:43:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c8bb2c6-2b90-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 10:43:00 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 04:42:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5221.namprd03.prod.outlook.com (2603:10b6:610:90::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 08:42:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 08:42:54 +0000
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
X-Inumbo-ID: 6c8bb2c6-2b90-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690360980;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XZFA3NODJPufjDyBWNkLFfqREMyNIbBPtxlPsMSHlpI=;
  b=ZSlYTvBBdLI1HQxzUPlZSU9uLmCfa5MXLtolG54/qsm7pqavNnQWjhKM
   Uk5slI0ftxIieHvbXaU33gtWPA0bZv3EPaQNqXLmqi+OuM8qgjXreMceg
   yCJrdlG9+1B+6yJ6aAwwszPLm8LVdmLbeG6eEfkp7mdv5NDdFkCvEIneF
   U=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 120099612
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VjU3IK783t4WQsaZxnBqeAxRtP/GchMFZxGqfqrLsTDasY5as4F+v
 mVNDWqFPazfZTGjf9FyPd7j/BtTv8fTzYdrGgdkrX0xHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 KRDFAJdcEq4rPOI57iJTdJCt/t8BZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+CF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3ujCdNMTefQGvhCgkaM1GorMEwsZGC4p9ScsVahBtZiA
 hlBksYphe1onKCxdfHDWBm/rG+BrwQrcdNaGO0n6ymA0qPRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuVPSUWNmYEaTUzZA0J+cT4oIozgxTMSf5uCKewyNbyHFnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvz/t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRtlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:GsSU36+CbKg7mXsR6RJuk+HWdr1zdoMgy1knxilNoENuE/Bwxv
 rBoB1E73DJYW4qKQ8dcdDpAtjmfZquz+8F3WBxB8bsYOCCgguVxe5ZnPDfK7OLIVyFygcw79
 YET0E6MqyOMbEYt7e13ODbKadc/DDvysnB7o2yowYPPGNXguNbnntE422gYytLrXx9dOIE/e
 2nl7N6TlSbCBAqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrGG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkjd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklVavoXRiKrLzPIt
 MeSv0018wmKG9yqEqp5lWH9ebcGUjb2C32GXTq9PbliQS+10oJv3fwjPZv7UvosqhNCKWsrt
 60QJhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cU4lhqSHqInd3tvaM6Ag3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCIbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+7/7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKzbFadjqKgXQk2DEjOVN+fLhjp0uIaA2R/lxjjQ=
X-Talos-CUID: 9a23:B9FNCW4CeEs9k3S8ddss1RZPJvJ1bCfm52buBEWKDl1HeYLKYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AmDDuUgzIM3pEkgN7YVyTXPbqUnSaqKa1F1ILqa1?=
 =?us-ascii?q?Xgfi/NipdHgyFk2mzf6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="120099612"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+ErOwoU0amxwD9Eqt3+F/hkMP/Phzq9Q68FbdPY1ovIB9LU9RuUzetRrIpcOtITySKNbGCSCDqQ12DlE7qgo70yhohyS30hQ4I0pq0ISwplXRMtr4bacNeYeNyjPzWwkq+KMLYKDlkh146CWs3KM73/PeOnq44SZIx1CG7Fe585oz3Di+bYEL3eer1iD+dNNhk/0+II3n2r5cS+7HR7SF0b9LyETaiRIbut/iMr83LClHqUS/sbCGG+tprYNjrdmPshRUC6GuHZkXwbBJkX34rA3d9/hFlKAaVQsQhZbU77bj7szsSUSpWTk9qsI8mov2zsqHq8tOSzr1bPshSiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu5DTKTOnkrNQYMrvMddhJv/W0069m8B2szg4ae1OLo=;
 b=c5rZ10XgjdgakCgGUt6XRaEHyv1+oYQYh8PcYQfO6FitUF3v9BR4XsY012BUb3jkgmKQafS0Fawm6xyISBi/b81/RU0cmeY1u3jsmmIj2vV/AcMOSt0TmfuhstAVuCOPlCR1Kd85kaYycpgSi77ztnoz2qyVLNcBcgdSLniRQGSHobAxgbyzTEr8zskqEoVIBWrYmkVOC6nvjXYSp3dmS/JcJS9jh9PcW7+zL6S/YZH89zmVBKoiSdtwI9u9FgWgTmsOuzgaNMz1l0mKwh+zuLOwOv5mFTuUdqxg0JYu/uZnullKPU4N9IHGj9BKssobtrdAfG3CC/PY//PEhBsJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xu5DTKTOnkrNQYMrvMddhJv/W0069m8B2szg4ae1OLo=;
 b=tyQKh1X2RszE2SmOWSILzvlqK7xJKBXBy3fp2nr+CV/P+B+GQLoUvZKyaQiX9f+HJBU1cVUeqFoBLhbQltFVVWRYmApUgW4B4dYHKBLuyIuKAshpER8QwSQ0kAPTA3O9SUrK/Zyakwp03LmHNLFB52BalyANwYPl74O4bXYJ+tI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Jul 2023 10:42:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZMDciOYZTLv_sYYA@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
 <ZLkqWXJtYlsJ4M61@MacBook-Air-de-Roger.local>
 <875y67cuzu.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875y67cuzu.fsf@epam.com>
X-ClientProxiedBy: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: f45d7311-904b-46a0-b70c-08db8db44dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGyscLut7cfD/tD/XlhAUflzWlKePiEzMnkXU+paU46CBdRSZvP7htJauHMu0gZCx6DTITsKpo0S0k5segZXTc5dA5UufyA01BnHt16tZwzHrL/StZIxpDWvqCjvKc7OwsX+hzVpwKV9Q8m1YUOoospAS0v9kt0fZUJljjW9/2WwmUwGP9v6u37jzwnUrMP9USrxUhdcAP55Fi1ZZVLfYGQG1Cu9PIHVCxs6cT5pClxczxYYYS0wD3fr3Rp4+Wx4IlthkdC3tevq5+R9gf6ZdpeuyE//SBS32GfFwfVnKM7slEETxxyrCs9ctxFzxc9gcg87xEz3AZsEs6D4imk58PwHPTj1TQn1CxQTjw9FE/epL9qpnVxTJ3v4DBD3fQddNQ+PGjS70INj9tLNaNgI7G1TO0xBSWrEmKtQ2JuXarpp3G9yxy1K+j0lbZp3hIi3PI0PpIT9vvQQMZKTLhMkBS/J+M5hOUlf7pmOXALlayOMesAQfZ/uPVL/HWclirV2hZm/3GUK1v5ZJr72cEoY6CTkmqt5r8rIjuXihiYkP8U/wUpK5zGzpg9N9U3ff1N0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(6512007)(6486002)(54906003)(478600001)(6666004)(9686003)(83380400001)(85182001)(86362001)(2906002)(66556008)(66476007)(186003)(6506007)(26005)(82960400001)(38100700002)(66946007)(6916009)(316002)(4326008)(41300700001)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlB1WmVueFdyVlRSeEdOd3o2b2J0MTJWdm9FWHUwT0UwRTB6WUE5am5LdGhY?=
 =?utf-8?B?dnlYaU4ySlFSM0Y1eFZvWDRKS2UxZlZxRUVvOTh1Z2JtdTFQWDU1SWtKWUtx?=
 =?utf-8?B?aVhSZHNZOUhNWWk5SGVJakd1eW1aejlka1N4ejdZa0JxdnY2NXVrQlI1aUNx?=
 =?utf-8?B?OG1NRUt6U2h1OVYrNEYzWEtLTmpHZDBiaHl0dmRuZFBpTEphckRPWWs4S3BK?=
 =?utf-8?B?OHAxYXRWbFRmQmlUOXVzNlVERCs5Z1FMeDVsaDFhMDFaL3VucndoVXk1QzZZ?=
 =?utf-8?B?RHdYd0hEL3FFUFQ1Nk0wa09pTVZWV01LSkZlTDY5bnJxQXlzbDNOUUhOclBQ?=
 =?utf-8?B?c1N1UmhibUt5YU1RRjhObERubnY2MlE4Yi81QTI1Mnl5UGxrdXZwZ2JqdzYz?=
 =?utf-8?B?cU14NEJLTHpBeG9xMkJDL0VvWmNqcG9MZWExanBhcXNPRDdOV0k1WG1yWmYw?=
 =?utf-8?B?YmNLaElaTDF1dzllOURlNkZ3N0haOUJYYk9TYldpeGNLQ2lGcXdKU0lFVHpu?=
 =?utf-8?B?U0NKSFZDOEpLbTJXQmtuamVPMTVKQm1WbUllcVhvUVRld0dwMkZCR3RhUFNI?=
 =?utf-8?B?MXowTEt3bHkrMFRVQm1PTFlPbHdFdm0xbGJhYkMydDB2ajhKdlJ0RHFEc2FB?=
 =?utf-8?B?eWdwM0hHMm9lVGxnOTE2TlV1L3NBU0xoZjFqMEVUdzJFMlhySVNoUFFpazdi?=
 =?utf-8?B?NHdFclFCYzNmRVNtdnpTWlhnVy9nYmlMRFJseWtwRWlKSUtVQUVHd1VWY0hD?=
 =?utf-8?B?enQ4QU5YNjNkZng5TWJxY1dWdW5OSjNZN1Z0QVNmY2ZXVGtINVg1dUpTQ3oz?=
 =?utf-8?B?SG5DMVg2anBZV1pVcmc0WWs3NVJybWpzVWFzOXhudWF3QmpiWEpCK2hUQ1BI?=
 =?utf-8?B?d3pZQ2lFdzdkczZLZHhuU3FFcEg0aXRpYjc0bXNMRXpRWjJ6dnBxcmk0WkpD?=
 =?utf-8?B?TGtleVVEQkY3WWF0NDY0OW5sTXQ0ajhRakFDVS94WjNUb0p2UWd3Q1NZR0tz?=
 =?utf-8?B?U1pNcFpsaytDOURJWlVYR3BZU1lTMFdpRThFcDBmY2lYdDBUWmpyOFMvSFg0?=
 =?utf-8?B?L2o5dkhqcDhzMjhRMzJWN09EcjhsTjFnTnQ5Q3VQNWQrQjh6bDFpVlNhWVlW?=
 =?utf-8?B?STl0N3JNUDBQWmVQcEczVTlEVm83Uy9vVHBmaStsR085dlo0TVhOV0xZSDZ0?=
 =?utf-8?B?MUpLMmFUam4wbTREOXdBSDV4VmJhU0ZFbnJYb0RxL29UclVPL0hHRHZBWEtE?=
 =?utf-8?B?TW5CKzhYd2lzVitxWDhBdDFwcHVwbXVTQWpEZWx0WUxkanNGOW83MU53aktu?=
 =?utf-8?B?eHNuT095R0k4T1VYSzRwN3BNUzVHemk1WmQwSzNUMy84SEx2WitXM0tjbTJn?=
 =?utf-8?B?NnN1Qk1UUnVnQmJIZGFFNlJ6OUV6aC90amltcUdCdENXZzRNcjBjTXd6TWg2?=
 =?utf-8?B?UDA3TkVmYlQvQlFPUk56R0QyUklHODFHZHI2cWtmOTE2RktWb3lZcTdockZa?=
 =?utf-8?B?VXNyeXdkeXlzU3hLUVZBRHN5WVF2d0dPcDBSU2d0ZXB4a2NvOUszWWJGQ1hi?=
 =?utf-8?B?WGkrL0wwWGJpeUxQdkUzSmlCNDNpSlZSb3JDZHB3K1VMQ3FMZUpoMi93bEFs?=
 =?utf-8?B?RWQ5L3RNSUhDNVpkcGtIK3gxODRzcjhSZmJDN0JxRkhObTdrVnZaekh6clQr?=
 =?utf-8?B?NzFaZHhsQmdjUWM1b0kzQ2xYWXgzVTF3YVBmdWxuc3B0WkFPU0FYa3EzZVZt?=
 =?utf-8?B?enBDVmVCSTYvK2R5TEN1MEp5Wm1XNUt6Y1poNzduQjJPQzExdFhFYlgwaXlv?=
 =?utf-8?B?VHZqZnFhSWRXWGJTUWJjazBmUzkxS2owd0NqaWVZeFJqamNtRVAzRDlOdW1H?=
 =?utf-8?B?ZGVpQ1kzNWdnTHpFTVVNN0dtRjZEd0JFSlVWSHhDeUlSdTNlS1Q1N0hlZFBm?=
 =?utf-8?B?K05YYTNyRVZBOHU2bUFiMGs2NE44MFVKa1dWZmFtVC84Y0tpME1nWXdXUlBG?=
 =?utf-8?B?M2FWc21tT3hNSHdkRkc0cURvdlJzMHc4Q1pZK2JIL3M2Rzk4T1VsaUIwcjVT?=
 =?utf-8?B?cFVVQ0NyazdPWnMreVJxVVpuUVlDVjQ3Q2hEVGZuM1hPSjhoZ3lpOFIzbXQz?=
 =?utf-8?B?c1h2WkhxWVdrQWRFR2l2QVdrTGVvWVJtZ0RtTFFqNzRybkJ6UG9XZHVLNGk5?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gqywMeY+xQYzEmUJ+S4kPUw2da22Aww29QHgT1HIwoL0YoxXFrIpznz/t/G+nXZ/jIHz1lPS+jnMpbGSP0WBulq1nVdKXQ9WyGj5Zx8XlVuyWlJ5OAcW0fI4SszHEmVuuff2BGq4nDLSabz7BuAUeZPKiqxsDbJ30QwtuJBrIgZ+q72Lv/kJSYgsgtyVt0RMa3FmRYfNmUqytKLpG/NvCcua3r3hPpEZJBRbl+JGQHHyYlmi1YddiZDOzVk86T/hQDmMOoqDGdlAN+YCmKZCGt7b4YfD8pjYL+dRrLv2pLAwLg8RrDZ1bgW7lW7pW6jnWpFfquDvtq7yScoIT2+7653mOImL8NtJBgSWCJAIKF/pk9BQu8TJA7MKIDH+WuoAwV0dxRpCd5YfsvVpm7YcH62pDOo10RhsjKWolQ4ss3bvxleh/pV12fR+ji9c9Gf9D9NvcqxAX+M1BeT1LdBvjjw1KLAiopleaBnpSgcYQ72hzKPi2deinjvddgQlHU46mmCiF9Gon86E0fntZlE/cS9JjPYOH2QiMuTrgll3hvqYrcXs+TcTr0+O+uFnC3bZQp3632BNg7HTpT/nfjzp5fzo97+vPkLfgT13kXp317tKV0rlNE4s5FTNaJ9jyzq49yO0SEY4cUYeTY6oL2YXXO59gHE5gs5Cy2BScofkBb1c2EdfEwQ7opQVAsuja/EBQMcVIfbJF6y9RCkmWiMMmNkNfiyaLywXofaRWQ8QImOyRzImBqxDlfFtrdtHlBxeWXq+eAlSK9mHEvXeswD+R3BMVeGIeA9f28SN0Ce03jg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45d7311-904b-46a0-b70c-08db8db44dce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 08:42:54.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58fRPdEcSm7fpa9xuuPHwJIJYlidf4yfL5B71uJasSwWJ99isY2q8k3XfXkJq+1KeJ2ftFo38sVfiFBcd9vkKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5221

On Wed, Jul 26, 2023 at 01:38:30AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> @@ -1509,6 +1517,19 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
> >>                          pci_to_dev(pdev), flag);
> >>      }
> >> +    if ( rc )
> >> +        goto done;
> >> +
> >> +    devfn = pdev->devfn;
> >> +    write_lock(&pdev->domain->pci_lock);
> >> +    rc = vpci_assign_device(pdev);
> >> +    write_unlock(&pdev->domain->pci_lock);
> >> +    if ( rc && deassign_device(d, seg, bus, devfn) )
> >> +    {
> >> +        printk(XENLOG_ERR "%pd: %pp was left partially assigned\n",
> >> +               d, &PCI_SBDF(seg, bus, devfn));
> >
> > &pdev->sbdf?  Then you can get of the devfn usage above.
> 
> Yes, thanks.
> 
> >> +        domain_crash(d);
> >
> > This seems like a bit different from the other error paths in the
> > function, isn't it fine to return an error and let the caller handle
> > the deassign?
> 
> I believe, intention was to not leave device in an unknown state: we
> failed both assign_device() and deassign_device() call, so what to do
> now? But yes, I think you are right and it is better to let caller to
> decide what to do next.

I don't think it would be a security risk to leave the device in that
state.  For domUs the guest won't get access to the device registers
anyway as we use an allow list approach.  Also deassign_device() is
not called when we fail to assign one of the phantom functions.

We don't seem to undo any of the work in assign_device() on error so
it should be fine to not do the call to deassign_device() on error to
initialize vPCI.

> >
> > Also, if we really need to call deassign_device() we must do so for
> > all possible phantom devices, see the above loop around
> > iommu_call(..., assing_device, ...);
> 
> But deassign_device() has the loop for all phantom devices that already
> does all the work. Unless I miss something, of course.

No, you are right, a single call is fine.

Thanks, Roger.

