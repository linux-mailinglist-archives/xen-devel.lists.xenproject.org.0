Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABD702962
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534684.831958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUkj-0003RV-UV; Mon, 15 May 2023 09:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534684.831958; Mon, 15 May 2023 09:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUkj-0003Pj-Qx; Mon, 15 May 2023 09:44:25 +0000
Received: by outflank-mailman (input) for mailman id 534684;
 Mon, 15 May 2023 09:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjwX=BE=citrix.com=prvs=492a8bb35=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyUkh-0003Pd-4K
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:44:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eef9cf7-f305-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 11:44:18 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 May 2023 05:44:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM8PR03MB6264.namprd03.prod.outlook.com (2603:10b6:8:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:44:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 09:44:10 +0000
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
X-Inumbo-ID: 0eef9cf7-f305-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684143858;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0mWk3X/SiGwiqgyhO5uguAOPzjbEtFPShirkYrAx3WE=;
  b=I2IQnEpwY7Y0gx/7eHZPSLbS3dkVerLbDyThMnA8aYqNMdF4z5fbAF4V
   Y92y51ggjiPzcgWvcCHsoEWQyd4Vvg/eIrPD8gBotDVxTiz1y1l0o83Zd
   QZjk3odWO7/+ExjLn+xT5y7p2ES3XG8xYp29DuakuEIiNsPR0kZSEKWhn
   U=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 108929799
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CC0jo6qZoJRUwW/LbS4Ktu2DDlFeBmL4ZBIvgKrLsJaIsI4StFCzt
 garIBnVO6yNY2L2ct0jPoS2o0wCvZKGyYMwTgc6+C8yRSxA+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDziRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGxTd0GBq+Kd+pCmd9J93s8NIpjiY4xK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpCRefpqa876LGV7l4aLUYfX32+muWa21yfQNdVO
 WI6pSV7+MDe82TuFLERRSaQu2WYtxQRX95RFewS6wyXzKfQpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbvh/JT98lKqe6j9T5EDL33
 hiDqSR4jLIW5eYQy6i19FbAxSmwr5LESgo04AT/V2epqAh+YeaYi5eA7FHa6bNMKdifR1zY5
 XwcwZHBt6YJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX742u9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:zCZgtKHo950ATZJopLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:fHtY7G9yJDRH+2i1xquVvxJKA5EnXn329lXNHnSpUW1HRuycFlDFrQ==
X-Talos-MUID: 9a23:WhQ+mQh3aanIxUn+/pqEBsMpBs5NuK2kLkU2jbZXqeifMCZiFRnCg2Hi
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="108929799"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpRXXcpXVS/uVxHNUGOtE2VouKlIwSO8dG9YM+L5eIPvz0uQ2UMV4/QDVieWTHlWM6B6fwgHZkX8EpnyyQjsypdYESYCWA35Bj6IpIOS4iEI5wWigxQ2mE0gJhg6TjNSe7hjr5A5bvfZ2CpHpj1fA0ETVhFTublkDg0a+RFZ8J8+HjoBq1GZIP2+ZGloqFlaoKNHNrV0Xrj4TaqGCpIKpOzXtjA4fUkiB+eD1mOu6qNpHpPYn/nAcIs8rRcud4DmgR0q+m694WsqI6tffdVztSVNpulTZSIr7f9wzVwxIcDll7ilGt6+aeDpkb3Zde3ZUZS0XiePwpLKBeS8K7Oc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBlkc0jM4MIbeBcv91rLDTvK8fWhLWiEZsFEsCcyOSA=;
 b=fF3ToLZJu/p/6CZEI0HRB1TzR6CIDHDhA4OWlnRgP0jKpHF4JedqkdPDyq/f01YeOEueQJNCsZJot0ol56qcBkHdv7vBwEk7GrAfdhhxFLmS1RFqDRC+xpFAt/fcPAUwiwXAWC0SW+L4ff4+dzY+DBeo0Kg+OSyPW/5Tc2rA4htzRnPnM8deCqe1iY4yKMHnYcvUyTTBPgQ2bSfr50/89tVRn96faPgxh6NqP9NQmzo8L04qSfetLnW9mocdi7YafzzaCTfZN5c6quXOc5m/IicNtbW96KUwyEcjXKpdFDewcKUlnnNJLP2mkh6+edqWGlPt7Uit+jKtQ8HhRIf9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBlkc0jM4MIbeBcv91rLDTvK8fWhLWiEZsFEsCcyOSA=;
 b=ohA8tNmZzJGH/bv4DGCuuYObT+VFS/i+y9HOYweUFBXCSjDXn17X2Z/WTe7VE2ExWfPKKo0I+LcUvUelqKh0XgVJaLsTcsjGAOSr81pWNy7kd4IBlqXYnRgjzohYvgU8/FJfv34VM5+Zq6KFZsVu6eBvf8vYY1QnnbdfI0IWcwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 15 May 2023 11:44:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGH+5OKqnjTjUr/F@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230513011720.3978354-2-sstabellini@kernel.org>
X-ClientProxiedBy: LO6P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM8PR03MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f12eea-36a7-4c9e-a857-08db5528ef1d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QQAAp4NAqrUbbksxup6wsiQWDST64GMQdisXQ89fofdlZO5QMIlsrCpzuz9D/DLjayJ45jChfvG7sByFGtKsWUSNfAaIM8r6ib5CDKqJWMwY7KMolUO27VlIfoz1ocpAh7IWPbO29fU8CT/MuRZ3PMasVpRfSJ2Sw+Q87kifcuvxw+WaG+CeF5cMlc37jHAba75Lav+p6gBLhcN8wlT0TEhKdcLzwwTbWbfMye8Ws5+3VbtJnLUpLECf6rDrL76DzKzlRfxSHvQG05gn+eufvh7jbJpn9rozNdvydiTSf5CglFZTfDeo6zGlr+vXdwcrw8D74Hsk7Ry9pcDyRP1aglKVY0AcQ5BDBJ1m8bAfKgMZpMLSVibmO491uyJEdkelV8VlkSfbF7YOEewGeva21UvwJI7iQO5zjBmAfq3GAKoRnaRbng2sg1IiYVqF5qG50EwT46EXspXuBt9TaCkV7VCbxkEuuNRW0UX26lY8sQkp3QsHYy+C1pcIyPdDSX/HKDBqQbf/HJpBM3rBw/AlHNRDNaf7RoOhrpyE5WqnemIOtaY+yDJ9F2OoKD8bdxI4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(66556008)(66946007)(66476007)(4326008)(6916009)(478600001)(6486002)(86362001)(316002)(85182001)(83380400001)(186003)(26005)(6512007)(9686003)(6506007)(8936002)(8676002)(5660300002)(6666004)(2906002)(33716001)(82960400001)(41300700001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFE2M1pyVVNqMkZXVFBmdUtlVnlEb2RJOTJ2TWtpZUQ5TTJPTVFQbWZxZGRY?=
 =?utf-8?B?Z2MwQnN2dm5nR08vUlFvdGUxdmhuaUc5ZEt0aGhuanQvZ3l5UXhQaUppWkFR?=
 =?utf-8?B?WTEwNmNsZXdJRzdRL1ZmUGJFeG9HazY4L3VrRm9qWjhCaEozd1Y2MVFaWXBQ?=
 =?utf-8?B?MFgrZjd2V3FnNWo0K2g2am5oRXJCZGNCZStnQVZnQS9UdXArdVJMRmxERlRo?=
 =?utf-8?B?V3NHKzhEbzYwZWtzTTdIbkJRSnVHamdtWldJKzVnWEFYbC9GVnJ4dUttVzVZ?=
 =?utf-8?B?bmEzTW4ySjQ1TUorVVNYT1JmaURhS0hhSFozcGk3NVJQYUVzS1VoYXM2UkY0?=
 =?utf-8?B?QmJRbW5VcERFemg5dXZVQWRCRXN6UlNKTEQ3TzZVSTBTblFrVnZNam16ajJv?=
 =?utf-8?B?NzRYeDU5dUswVUpiYTk3SUx0aXNxTjRQUFNjd256aWM5WitLdXI3MVZuUVM2?=
 =?utf-8?B?NHRRS1JwT1hWKzB2bll6QU5hK1I2eE1zdHdWODZKMC9DcUdYRUs0Snd1dStS?=
 =?utf-8?B?WkxqejF2MFowYWlEK0RtZVR2OHY0SnpRbGRWeUJ2b2w0ZEJtKzNsTHlWSDZs?=
 =?utf-8?B?M3MzcktidFNIL0pDcm96YlZmTzZIZU5CSEMzTU1tVHZ6M0s5MXFaRlBLMWtH?=
 =?utf-8?B?Nm9hS3ZsSFFLRUJaVThISmtQTitnbUlGMDRvUjUxdDBYNFBKbDQyalFtZEZo?=
 =?utf-8?B?Zk5qM0N2bXM0SWdQZHNzZitCYlY4YzRKb09VSjFJYnZEaWh5Q3hxZ3l3eXg4?=
 =?utf-8?B?RVV6Y0hFVXhoT25QbDF3VERub2ZNWUhXMloxZ09WWVM2Ympoc1cvZEpTa3ln?=
 =?utf-8?B?TmpxM0dxdWQ2bWhXWnozYmVSY05RU0ltc2N0UVloUVpid1EzUlRwQ0hRckov?=
 =?utf-8?B?eCtLTG9WUXBYS3dUV1lITlJENElmMFNLMmhsRDdhYjJ0eU1ELzJxT01HMXE3?=
 =?utf-8?B?NnBHNFZya2V6b3lnUjZ6NVFmUC9CNEJkemREbnBudkxNTkFtVDZyRXcxdGdh?=
 =?utf-8?B?RUMwQ0Fxcy9CRk5ZazdLNnc0ZENWR1UzRHZ2RWhkbUxMcWtTVkppVmloV1B3?=
 =?utf-8?B?cjNYU1Q1aGVmWVdNZGduYzJuYkh4VDdjSG9QbkJlVjNRbDl0bldOc3NUak54?=
 =?utf-8?B?ZERVM1o2ZHZhVmlaSFAzODEyWGpRRXQ2ekFGeVFNdk1nUmIyV2ZxKzhmTVg4?=
 =?utf-8?B?eVRQYXpsSVI1QW5NejhPdUxyaWs1eGhxVEVSMFVxWHovY3QzbnFwSUxRS2Na?=
 =?utf-8?B?YjdOUzZwdFBkRzA4K2tXYUdwdU9GY3B1dTVWdklPTnYrMHlQcm53bEtOelVj?=
 =?utf-8?B?SzFvM0ZSeG4wc0l0VUZDOWUxdCtwck5xWDZpMmM1QlZMSFlDc0M5TG1tb3NG?=
 =?utf-8?B?bGFWRzZZK3NFcVM4cDJTaEpZU3dqRkNDbVcyZDU2VFkzMjB3eldmbW54a3Js?=
 =?utf-8?B?TThuSUtwZXluWlJnVlhLVm1ucFp2UkhwQlozV1BOUEo4V0o1NXV4SlZYTUxW?=
 =?utf-8?B?L05VaVNCM0ZjdHlFMWFoT255blFqMnBubUNxcG5JRjRwaTRrckowRjZRZWtO?=
 =?utf-8?B?UHRmbFdOa3R2ZjFxQk01Y0FwSTdHSEdxNEpmT3g2emo0MGRDTDR6bzljdHZJ?=
 =?utf-8?B?dnM1ejNUaVl3djRkam1YYlYzSWlLaHErNDcwWG9KOVFkRHNMK1hjNGFUM0Zz?=
 =?utf-8?B?R1JicWRiTk1VZVJ6VW51RjlXeFk0cHpoWENoWGlHeXIvUjRwNkxOZHpCK3Rr?=
 =?utf-8?B?NGdNV1RzcnBEdGtSZWtxU2lQTUgzclhsSUdrcWZqOWpkN0x6NStiZUNKRHBF?=
 =?utf-8?B?MTY0U2Q0UU8zN3lPaHY5TDNyRVB1WTMzR0FaQ3Z2VlRxS3NzNHo4YmowNWVs?=
 =?utf-8?B?MTQram1WclJQM2t3VEY3RG5ubThkTjJwVDFDd1BFYVl3OEk4WnNOSVltaFM2?=
 =?utf-8?B?cU5WeGhTVzE3c3BlQ3diandyb2wwTFg2L1FSUFBQcHNSaFNqUlA2MUpOMldQ?=
 =?utf-8?B?UVQrVlVQU1N3TVE4WkZtZmFFcE9nT3FoYUNZU1ZCeThOUW9sMnNhN0tQUkU3?=
 =?utf-8?B?VUdHSGJiK2d3dG1hMjNPU0Y4RktOWExieVEvWkZnOHVUMEwxUEZWb3ZpMmwx?=
 =?utf-8?Q?KZCkqC6WaF0TGjuQ+CJ4inGSd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m/89adm6KhHNi00Qx77wxPj0W6ausuPACJGID+kPtjHxjPufZCm9BNHpicZkpiHRRFJKdUfqrqLpY7Q3GetbtKFuGWSVpsJnp7wNEIts08CDO9OboHEU09udaVV5kWcvjSOpXbfKV/Q7FumeOTbkHZm7npe1Moq3O/K/oEegSxoRPbKMYmX72tAu6kNeAw8tJVSbI6RjgWMPdeeJCySpOPe+WGk5j+RD56s2lhCVhNYgI5ahRaG8SQTBhil7b8SvKMEmjGiZ5Y2/U7P7NCNCo/jNBoDTFssSKcS7IqgjMjlTf+w0a8NfUHBwSRQww4EE6ulbY2IlBPQemthxzgrrf30wFAOzfSXJuLE+nkfxXfNeYvhV4YIUqRxFjE+KmpE98YxZaJxdoARY0jdcPxeUhPdePVCUDzWBWHEQpoQYItBd9wCLcjXemvLDuzNkXtoH0rVLKqJ3oILBj2pYLdxh4hBjV++NYJSvpzVRUPqwPOO6weU7ZAKcJfYukiAauzerqJP5baXRtWO+dAksev2Kx+6LuOGJ+HqUitmsri9AyaNd7Mh7RrlKjA3/z8kcw5sRKuidlEiowoNuVPZBzl+Ojp7vcMljFNuPEr9D60+HsgCHe8c3NBcr3txkM4DTMhO5MEZlKI0zQle4cUH0TRW0f1+aCkpB8i4YEe/OLC+2vQfcTTYAnTWlW1FGrPlqvg4iTP1Y1W+VZSR4/YAeTSOv5TMRXqLMpt91psqnlt0V5pb0FyME9W6ETGvajf8J/mSSTqU+BTT7ILERSIfBhvPdoqsylCxqjkynGixXDxLmpMuJQ8a1cbHfFvIkzsfvlHLr4TxVPTOa9USLa8+SpqCXRZfvdsEpv3KyzN8DxQr89xo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f12eea-36a7-4c9e-a857-08db5528ef1d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:44:10.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E72tKlpd79+GIl3ZWP2mNSERmcLVEgjWtEkqorACX1PkEzoB6wth19quqMyzLy+2Rj0yVhwNEvsclYv7ae3lOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6264

On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> the tables in the guest. Instead, copy the tables to Dom0.
> 
> This is a workaround.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> As mentioned in the cover letter, this is a RFC workaround as I don't
> know the cause of the underlying problem. I do know that this patch
> solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> parse ACPI tables.

I'm unsure how safe this is for native systems, as it's possible for
firmware to modify the data in the tables, so copying them would
break that functionality.

I think we need to get to the root cause that triggers this behavior
on QEMU.  Is it the table checksum that fail, or something else?  Is
there an error from Linux you could reference?

I've got some feedback below, but I'm unsure copying is the correct
approach.

> ---
>  xen/arch/x86/hvm/dom0_build.c | 107 +++++++++-------------------------
>  1 file changed, 27 insertions(+), 80 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 5fde769863..a6037fc6ed 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -73,32 +73,6 @@ static void __init print_order_stats(const struct domain *d)
>              printk("order %2u allocations: %u\n", i, order_stats[i]);
>  }
>  
> -static int __init modify_identity_mmio(struct domain *d, unsigned long pfn,
> -                                       unsigned long nr_pages, const bool map)
> -{
> -    int rc;
> -
> -    for ( ; ; )
> -    {
> -        rc = map ?   map_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn))
> -                 : unmap_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn));
> -        if ( rc == 0 )
> -            break;
> -        if ( rc < 0 )
> -        {
> -            printk(XENLOG_WARNING
> -                   "Failed to identity %smap [%#lx,%#lx) for d%d: %d\n",
> -                   map ? "" : "un", pfn, pfn + nr_pages, d->domain_id, rc);
> -            break;
> -        }
> -        nr_pages -= rc;
> -        pfn += rc;
> -        process_pending_softirqs();
> -    }
> -
> -    return rc;
> -}
> -
>  /* Populate a HVM memory range using the biggest possible order. */
>  static int __init pvh_populate_memory_range(struct domain *d,
>                                              unsigned long start,
> @@ -967,6 +941,8 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>      unsigned long size = sizeof(*xsdt);
>      unsigned int i, j, num_tables = 0;
>      int rc;
> +    struct acpi_table_fadt fadt;
> +    unsigned long fadt_addr = 0, dsdt_addr = 0, facs_addr = 0, fadt_size = 0;

paddr_t and size_t would be better.

>      struct acpi_table_header header = {
>          .signature    = "XSDT",
>          .length       = sizeof(struct acpi_table_header),
> @@ -1013,10 +989,33 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>      /* Copy the addresses of the rest of the allowed tables. */
>      for( i = 0, j = 1; i < acpi_gbl_root_table_list.count; i++ )
>      {
> +        void *table;

const __iomem.

> +
> +        pvh_steal_ram(d, tables[i].length, 0, GB(4), addr);
> +        table = acpi_os_map_memory(tables[i].address, tables[i].length);
> +        hvm_copy_to_guest_phys(*addr, table, tables[i].length, d->vcpu[0]);
> +        pvh_add_mem_range(d, *addr, *addr + tables[i].length, E820_ACPI);

Need to check for errors in the calls above.

> +
> +        if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_FADT, ACPI_NAME_SIZE) )
> +        {
> +            memcpy(&fadt, table, tables[i].length);
> +            fadt_addr = *addr;
> +            fadt_size = tables[i].length;
> +        }
> +        else if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_DSDT, ACPI_NAME_SIZE) )
> +                dsdt_addr = *addr;
> +        else if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_FACS, ACPI_NAME_SIZE) )
> +                facs_addr = *addr;

Wrong indentation.

> +
>          if ( pvh_acpi_xsdt_table_allowed(tables[i].signature.ascii,
> -                                         tables[i].address, tables[i].length) )
> -            xsdt->table_offset_entry[j++] = tables[i].address;
> +                    tables[i].address, tables[i].length) )

Unrelated withe space adjustment?

Thanks, Roger.

