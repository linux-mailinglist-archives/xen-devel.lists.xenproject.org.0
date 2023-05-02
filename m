Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66566F4691
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528709.822208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrWc-00010q-UC; Tue, 02 May 2023 15:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528709.822208; Tue, 02 May 2023 15:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrWc-0000yM-Ny; Tue, 02 May 2023 15:02:42 +0000
Received: by outflank-mailman (input) for mailman id 528709;
 Tue, 02 May 2023 15:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptrWb-0000xz-Ao
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:02:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600b64f5-e8fa-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 17:02:39 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 10:59:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6422.namprd03.prod.outlook.com (2603:10b6:a03:396::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Tue, 2 May
 2023 14:59:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 14:59:30 +0000
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
X-Inumbo-ID: 600b64f5-e8fa-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683039759;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=oFeo/VJqrFvjet3X+2e5EGDYnRXVjUnCVi3N0p1FJNI=;
  b=UlToa4MX9SkmZkIZEmXAEBjumCRkKRtoyEOUjil7IuRwwJ5GQYkXqTZ/
   KQVNUF8/9xpHSu7aB8PCmatBH/U07Tc9E2d6NmkdmEQKeJ693rSQRlwHS
   LOqjaDZ/bt7AGY1NnSFf2Hyjgoni/um8cGfbYH7j0tfevnUSex1w3Tkik
   c=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 110031688
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7yhQdqD5MSjlzRVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApG5x0WYOy
 mMfD2mBa/qDZWqge9kkbti+oEoGv5WHnYQ1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5el9G3oU+
 9chMylKfyuPnqGW7ZacVbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuuzW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyr03baRzXOTtIQ6PrKk08Z2oWSqzFNDNyI5anH84vqAsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGodPykNSFJd58G5+dluyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:HAsQlqE00bQEPJPFpLqE0seALOsnbusQ8zAXPidKJSC9E/b2qy
 nKpp8mPHDP5gr5NEtApTnjAtjifZqsz/5ICOAqVN/JMTUO01HYTr2Kg7GSpAHIKmnT8fNcyL
 clU4UWMqyXMbGit7ee3OBvKadF/OW6
X-Talos-CUID: 9a23:DxuosWNjKbH9OO5DRyZt7lVOFOscaWSa3UzcOgyYJEJOV+jA
X-Talos-MUID: 9a23:1rN1pgk341QFoH4QPVy4dnpIO9tN27iPMXkHrsU5hOa7H2szOA6k2WE=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="110031688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+cWA6A9WKM13hyyjNPxyAFyLMjEmp8toj8HqQ8JA3ZUJ0fneiUB86W0/Gic6lQ3AcaJpS9qriLTBBfj7iInr6bpXozB2bFG4cRio4WJbM5ObI+SJJl9T9XT4XBwWwQiik8FcS1zSpp4oCWeme42DdQkb6ctLJJG/xo5wu6hyYX+Hlg0nxu5O9XEPxnTZb6Zvr4z427LoH97TqNUfSlTpgPFEL6G0sbX0fwgVOL7x2/xM9rI62HrTpz1jQH+XwCViGzXe2/WX3rWPpfsMELFXhEfDZzBtvtCac/s9GBtnzmRY24nyhzILJqeMs/5AVElBN2sVsJWmEOrvaYgaq05RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHaYVkPXio4QryvASgtAEsRqT3MTpTQ6WEtH/GK1i0g=;
 b=i12GEvfcX9k5w65irzejnvOXmoylmMpoe8CTXeqM0b4c3W0AYfxkMjYYnnldBqHQ6I3OprOJmFMI3ERZFSFytJicck9yGp6OLYoMVUcNqjDKi1fM2Ujy1IINttvVEvEyWxILhzi0fG7uBa9DHQfgocXG6MoNnb51ErghpKDjfN32zm2Z7nAUab2M8hOfuVNs5x1p93N+G3kvSza/de1i+pPtnXEFkuiPYd2oloZUWjTYAD2i8CRApMzuSb6pN0xcuEFCzI5TB9sBT+vGYyT2LIwRcF3dnWWWngyHF9jubmPx9At0dzAqNXt7k5CrTmCX0rp/H91PiZHo3wQJTk3a4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHaYVkPXio4QryvASgtAEsRqT3MTpTQ6WEtH/GK1i0g=;
 b=gpiwbs2EKSxfNA9Z14GOWKQBcwNLzfoP5HF17qU9D2VhebrwCxhODx7mTQ7FmkBq3yicxB44jLFfV+gJKR0xF3R8b9whNWBFpeql+E+LAu0XzRYV5LKnXZ/k68lwGaskbKxJWixV5NkSBqeFOaTRC1WrSsg8SrRHtmonOXPRI9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] x86: init improvements
Date: Tue,  2 May 2023 16:59:18 +0200
Message-Id: <20230502145920.56588-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e58fd73-7cde-4abd-0ea8-08db4b1dd4ec
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xs1/A4yX5fSL8O81MCp+aK6m0jubL/WU9kkcJvrCHdSmslsYJsKNINI2FDjslOqJbpZwxb1KEws5p9G0xUcjF+f0FhUafuNs/oc+OTZZUz1TpuBdSUWzm75RdIiqCCAK0/JdUZgqw36w7fVflrlleHew9KORYbylQQyCbxKAdYQZrXx9S8iqSjC23uCjk9fVl9f7MCdo634dicF3GImRecElO3MjsSLxfiFMQM2RHx82CU2vPF6sIY9dAHfC89uip1QVKE5A8fscl59QsmFqOhU5wBAzzhsLO2GhPLw73TpGY5P8XqMZzQtyiZNCFkX0f4bFsx5/Z7EGjmIB/RNFeAoIX57akM79eKnqiYR6Jfq2KEx9h6yvlf9W3p2w97hzH2fValJ7vlrH3fHvj1Rh9li16kP6hWYBAZ0SK1cX+bJdyWBRVfwG/GK1Gf1IUsTCIC6E1r0Gr/uWZ/MHkGqqJaNt4+dWSdPKalPne8bRbdOjrlKMbbA17TIjVcCAUDWk8d+rLgguLVGNwEF/U+2N965KmD2HXm8LZ+Ba/FoxeQ2yPPcFVepCj8QWixpTH+pC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199021)(2616005)(83380400001)(478600001)(186003)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(6486002)(6666004)(6512007)(1076003)(6506007)(26005)(316002)(8936002)(8676002)(5660300002)(41300700001)(82960400001)(2906002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJHSmM5ODBoblBvaTBzNk8yL1B2RC9IN0xybVZkbDZKbE1VV1VmY255cDlQ?=
 =?utf-8?B?Q2dhZGVxaWluYklhc1FBMjV0d2lBa0JsTVhGNUdUaVVacDU0QkxvZWhIWXls?=
 =?utf-8?B?TG0wMS9CV09qNEFLYTJlYWtMbmowSGo2eWovOHFQTzJKVzBDSDZtMVRNVFhO?=
 =?utf-8?B?Znk2MGtXV28vMDhtTUgxY1dLakhZTEdBekxjS1FtT3g0S0dCcEJpd2lxWVRG?=
 =?utf-8?B?akljNjd0RDl5Y0hOV29Tdm8vZnVaOWsyRSt0Y2QyZHY1V0ZwbitIT3hiSVF4?=
 =?utf-8?B?ZWMvRmlBeVlHcDNRazJNd1lXMWNEY3ZnWUc3V29hTVdsbzlkblpHMDRHSGtP?=
 =?utf-8?B?VmZDTUVIS0NNa3A3ZXBjbWlPS2czRFZMS2IrVDNHVFQyN1FkcHA5LytBNkxO?=
 =?utf-8?B?dHoySEkwdDBlb0Q3cHRXSW9BeHg2Yytka041ZERKUUxMR1F0cit0MlQ2V1Q4?=
 =?utf-8?B?bVU0MFdKTTNUdzRtMHViTnk1ZHFJRFFLWW1pNzZiVFp1dDc5NE5Eb01RWE9a?=
 =?utf-8?B?WUNlbjRjbEYyTUNvT2I1bTBOVG8yMVJYS3k4dUdLaGZObGZYRU9Zb1VIZWlV?=
 =?utf-8?B?TXEyV0E3VHAvckZUK3V0QkF6OWREQkVDUVhhYmd5OFV4bVRRNHVTN0wyZ0gv?=
 =?utf-8?B?a2I5aThVT3dzaVJqVEk0VmJVbGQySTJXWDh5RGRsbGR6dHYvQjNMM1ZUSkJm?=
 =?utf-8?B?eks1b2I0cFh2VFVaZTN2U3B5Snl1L3RTa3dhTXk3c0xCck1RWTMzWlVpMFBK?=
 =?utf-8?B?dXp0QXIwTTRFQ1pnWXk1QTVlVjFmM1RUK3NvOFRVUlBwUE9sNStKc2o3MGRE?=
 =?utf-8?B?Uzc4R0I3WnpiVEwzRWdzQmRuNE14MW92a1BkcnRvSFhzZWx3dUliaE1pcTE3?=
 =?utf-8?B?a0pmYkRBQjlWNzk5aDY2eHpRb1FsZ3Jib0crL3l3cU5VdFZUQUVFWktqNTBR?=
 =?utf-8?B?RlA5N1NOWkgyc014ZlVrT09pUjdGMFlBSVRyYUZqZ0pJVWpkMDU1SENqK09y?=
 =?utf-8?B?S1V1RE5KNmZUUzhxVVpxZDVqZHpvc281dThHM3oyK2FYZllZdW1sZk9qUTc4?=
 =?utf-8?B?UVFDendqcmhId0NXUjNxQm5zb29oblQ4V0NpajNCdmxraG1aUlFHdkkxdXBS?=
 =?utf-8?B?YitqT0g0YlVhdnVJbWRzSFg2NENZWjBSUzBGRFV0THdtNnNKWUphUk5YZlVB?=
 =?utf-8?B?Z3Q1b3d6eThHUWZOYmNoRVVWOVFHcnFabStjMENDK3djUFRFMVNXMll0RFBY?=
 =?utf-8?B?OHNRZkxhd3lOczB2SXNpbit4YjlGQ2xUNkZEMFZsMU9GR3pSdlorUGJiVkZ0?=
 =?utf-8?B?MlJHRUh4QnRETm12SFlOUU53TVkyOXU0dURObitrbi80N1JEeU5XSEtGMWEx?=
 =?utf-8?B?eUVuREhseWl3b1dBSkZLYkNKREdmZW8wTXk3ejhReWw1Z0RneGFuSDNJaGNs?=
 =?utf-8?B?MHA2QnIzY3NFeFMybm5SNEZ1SXVXdmpZd0dUaUF1eEJqTTFWckRTTWJuRmZZ?=
 =?utf-8?B?L1kzYXNTSjk1K3ZlOG5tSGVlY3ZLYXc5cjFZNGZvTEhaSlIvaTFJZ0lUNzM2?=
 =?utf-8?B?ZHpTNVNtNjQwYzlPRDkyTEFrMlJKTHkxemU1VUgxVUluRFduS1lmYkhjMmR2?=
 =?utf-8?B?NDZVYjFEUTBNanNuQkYrRmlHc0kwOUQ4RnF4MGJrZHpSRmhmWmZhN1kzUmZK?=
 =?utf-8?B?ZVlsTWp3VTRnNm5ESnlhaGNsaVJmMW0weksyclZENGMvNktzUWxtc2RIcDFJ?=
 =?utf-8?B?TnRlb3ZPOE1tQTJaeE5ISjdudUNHZzVnTlhHYVpOYWNWaXFsTFh0UzJvK0N4?=
 =?utf-8?B?aGgvdUFTWVpySjVHS0FCQmdaWjZ1U1Zqamw2QjZ1TkJjTkJOVXNrQzR0eXdv?=
 =?utf-8?B?WXEzN2Zjbzhjb05jTFQwY0Q4S2kxdHRXUWJEK3BiVlAvOGhITC9jY2lmQVJ6?=
 =?utf-8?B?VTh0SkNMNXNhRHNtNGliOGNBQ2NlS0NGUnZnbGFjcVYycngzdGVWdXZiWXIy?=
 =?utf-8?B?S05oTVlEWHpobTh4QXBSMUFqbXRVRjVDN0tZWjJZMXVmYXJOUkJBaElFRlpj?=
 =?utf-8?B?ZGVKQXlsUXhwOVFJTWpjeWtyc0lOV2NRMHlyRnl5YUN5cTYwbFI4MjhXSG5J?=
 =?utf-8?B?WHo5R2FxZGd1S25OaGttS3NtajQzTG1XWm1QbXlvdi8vcEppMTgvL1ZCVXgv?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GK28bXPhf/JMZFz+2T1n4pUPH1CpRLYAxV310vcIboEf9+TVuruEyP9taE8rQ0c4HMymPrCExltHNwU0BwqW2EBAXdObmMCqRnKj4lJBhHvsqP+m3m1IhC1Gx6XcqBgDMB/SJvRm4aTUJElC7V/hOIZc8GKk2ELwd7b3LLkAZWCi+Wwfjjxuxx7vqQdvBDg3AZIA+36jGqIUCXOFKlgcyTt7NlfCnOFSr+t8MRABU8E/N36KVv3E0hILtkTa5KUbp+MujteBp80xRyl0UUk9mCESViPKPO95hlqi8N2sfCRzavLSSWvzDpUbcFc7SX7jqwgfLDAJ7kAejY2TNC4obaS0ezudzqWaFICQOuemMUOKS/wSwuoxIhUUNSHYSn8NUJQ5vwPDRO47j9xvuZ9EeOYyTdvT1xmYsVH46+as4UFH7xg6uoGJzAvO+ltmOKhCDBGH6XRy9NVKHWw79PRwUAMhBNpG6BIzk14gqr6MEzo32vuQuHXvOAYgaKOKtMZb3PW+PJMerfnZq/iZQnozARLae3r2mk1PPy6Hc00mwCiAVWzaVm0ZxJ3r7OYzh/HcyML8RdmQe4VQKwK7ldfRgVO9BTNAD2XXKf3v5PsS2IYp/ysXZ+Hx4LZbLM5lTjmL0JgrOt+Mk58iSvVlWWzUqLRyjGefUP7unkZiH2EyuUt5xVk8eDQxbsU9kV3/NBGAdcyaWXT17/OG0WVnD0gv6bBNbx3uyppqEpIAL07HcaoHCOKdhNQZfbg8JHHbsdRSJM3JRFNjVB740rkgC5U1C2HphGy7Yi4L30F+rUfiTqH6V+7YpWWha+qKY2E+j3fp
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e58fd73-7cde-4abd-0ea8-08db4b1dd4ec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:59:30.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQoADG3c06z50l0LkQZTxNeFaUTOhkYoO/688yT+CXNcLDDLTfY/lhwr9xqsopdN8zPymj/TZa6ndzsvtAGoxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6422

Hello,

The following series contain two minor improvements for early boot: the
first one is an alignment check when building the initial page tables,
the second is a consistency fix for the GDT used by the BSP for the
trampoline code.

Both are a result of some debugging work done on a system with broken
firmware that resulted in Xen text not being loaded at a 2Mb aligned
address.  This resulted in corrupted page tables that would manifest as
the ljmp from compatibility mode in trampoline_protmode_entry causing a
triple fault due to the GDT being located in the Xen text section, and
the page table entry for that address being corrupt because Xen was not
loaded a 2Mb boundary.

The aim of the series (specially the first patch) is not to allow
booting on such broken firmware, but to print an error message instead
of causing a triple fault.

Thanks, Roger.

Roger Pau Monne (2):
  x86/head: check base address alignment
  x86/trampoline: load the GDT located in the trampoline page

 xen/arch/x86/boot/head.S       | 14 ++++++++++++++
 xen/arch/x86/boot/trampoline.S |  3 +++
 2 files changed, 17 insertions(+)

-- 
2.40.0


