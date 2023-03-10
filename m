Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6B6B4094
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 14:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508495.783199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pacx6-0006Ha-Qx; Fri, 10 Mar 2023 13:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508495.783199; Fri, 10 Mar 2023 13:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pacx6-0006FC-N2; Fri, 10 Mar 2023 13:38:32 +0000
Received: by outflank-mailman (input) for mailman id 508495;
 Fri, 10 Mar 2023 13:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltz4=7C=citrix.com=prvs=426ffb546=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pacx5-0006F5-4j
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 13:38:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d604ac6b-bf48-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 14:38:28 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Mar 2023 08:38:24 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5921.namprd03.prod.outlook.com (2603:10b6:303:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 13:38:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 13:38:22 +0000
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
X-Inumbo-ID: d604ac6b-bf48-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678455508;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rux9k01dwbJZcPb+LUR6a05SgUND+GTDFpEwa8mqI4o=;
  b=INugzzA57ZnYF5LynyuZWpUOFG4rrLXqM0eNZqt7WC9XbSJHHZbXD2X+
   KKEQ5eNzMj0lgoqcM9uKnXJ06LZDgTHtbEC+8bbgaLQzNuPR7A3ObjOiO
   YOBtTIIvwbfAIJA0lcTBo3lrr3amhQswlPcwusagkY0Tb/qumpwmbVrF9
   M=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 100223551
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Yc+nXq9Rj1vbRTBNB8BbDrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mBJWmnXPfqOYTT2c9x2bIq0phgG6MCDztRjSwplrXs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklo3
 OUiEQgPdiqTgsOGmZmUVbhw3u88eZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUujNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxXmhA99PTdVU8NZmvkKywE0wVyQKVEq5sOPnoEGOS9Nmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBQQ5b5dDm+ds3lkiWEYolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:UkQsTq2I7WPJ+utokRKUmQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,249,1673931600"; 
   d="scan'208";a="100223551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjEzO0iySQ9lV/hRRfpcssIIHlaLscwtj6/U6j5SPSiU0kPny8c9EfPy1LXB6KnX8uYTSVQrPLca1dEkCHF3ztPUvNOD0G4bI39opYqPy4B6l1mcDvBYbM8vD1bIYwlP/msg0rqy5/HGUBdMpUbppRqwFZXT/2+wIolvz6uCxrPls3d8u7Y7TPMY8XwlyZRfJTpR71GIevMsZOzyD8wS76E40quKjlMxDrOtOzXBImHzMkUypm9wqjtsQgSYZSUHZOXv45K7Ng1lJbrhXWqMmwxrhOzF2vJMdWZuE91U8AmdLv22KVYo/t/73imWLzvE+tdFni7W00Zz/d8jW22gew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CvgI2n22wGaHGAoxJQbkgrnr1KdMufzybL2RMG/UuY=;
 b=WWTwppYtZCdqCw22Kt7X6+igp/FMD5RMPGr4sk1LF6eBpFLVAa5Z9i98rU+Bms6dAAqvgFXizlHvq5+51GWHJ1iGaZ/nr4/PQDKzgGF2Liacym3JrB2UpDTcMBegW8/jXutFzQTtRpjwrpd/BvuP5/Sd6+xElS9gSGCMB7O8LX6IQu8iybZ8BwOpPhbdsNkYCeC/YklQsJKcCYq1ooP5Td3bpGGzrD08un97qQF3ixOES3eLxU3y/7Sg/qm/CFuhY+xEsKmltZ7Edy7bWXkasSQJfZiI/Ytbu8P9pyvcOPxep4ZsqSIPIxVxyBqZZ4tiitISI+iQX/nD0EZQ9s4ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CvgI2n22wGaHGAoxJQbkgrnr1KdMufzybL2RMG/UuY=;
 b=dRU4qXQkpLzgCOI0jWSBBPg9AZDyehHMY3Nu1jCaYum3A1QEu36eoaOPboT5/VtsM7vK4MIgUC/tCiCLy1PGmq6UGPsJWu/R/f7/znFsF7aw96MRWclXBTfsNVnJMZdfGp5yidl1G43rb06ePiiFUpyKuRrN5/1DiQGByfMBrgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Mar 2023 14:38:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tests/vpci: install test
Message-ID: <ZAsyxw6VvQHYrksG@Air-de-Roger>
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bd0c04-19d4-492d-7f6b-08db216cb770
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIZsFJwsgyTzYgT0svdEZA5rwIsLMRvPOOr0qbViFO8x9DUsDF3YxaRZHt6apeHs/7zGlMKgAa0G90xUQp8KFunUrH2xWbxJoczHzaL7AO/aL/GJv++ljiA4dRj0fjuSr2nn6as6PEb3pnHOe/OpRwdWiwwE6i/W+O7jFO963NSjmFOfB8A/lz+zdqMaqD9H5qoeCpxtiprK2Z/FjC4uzFHOlSWdEMtGFNAmRTcfbtVP/Kd7GyRH55CK6sjU/l5gFE5+MKk0h9kNFwj6pI4xMiksT1iUAth+hTLGo3Eb6PXBgdQaKhys8zKXCkZJLDoZAwuqEs/iZ5od4ZwG+ngX1jsJHSakYWXj2dNn7Z00GyfI6erV2at1S5eURhC87JIoG7wOjCS5QADOfgy9fYcvM8xYk7RoCrp/cbTMjAbQfq0zoE1dSYIFEVGkNzTJQHzBBgYENYSiZmWJ3rHut9l7VQkccms9jJc6tiEwGfmgx1/VZ7JHHYjv7CkyWHAzeIyyIZbBOky8MT7lXwEnsllTJn4esT7NHBqacRh1e0xbdTJK8T+JdfPKhDyz2vPY1bqd3W1mW7px4GYG91rGUONgxcwRN+/Ee8ANM2sXRIjGSpuzw6nC1y0QPnCS9kGkHu064Lo1TgrwMU/90SuZrJ8zsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199018)(66899018)(54906003)(316002)(85182001)(38100700002)(86362001)(82960400001)(26005)(9686003)(6666004)(6512007)(53546011)(6506007)(186003)(33716001)(5660300002)(6486002)(478600001)(8936002)(41300700001)(2906002)(4326008)(8676002)(66476007)(6916009)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JiUWlWU0g0aitmV01lRDZyMmcvSVlwaDhuR0hXRW4vS25kd1R1TVNBeUJ4?=
 =?utf-8?B?bHo0UTB1YzcwWGVLWFpKa3pubTNRN3dnMUlLQVBlSHJlSC9JRnp0ak01Z2dJ?=
 =?utf-8?B?b0tpSW5GUk5la3pZS0dtU3VWT1hRSzk0QzhWOTFmRTM1Nm1IUTRqMVkySThS?=
 =?utf-8?B?NUE1WWRFV2pqQit2YjJwRkpvcUxubmlIQy9CYURMV2NlSzI5anlIUmw2d1Ay?=
 =?utf-8?B?aHJseDU3Ylh3VWlyTFI4L3RYeTJPMHhDYnlxZG0zRUZiN0tMYkxUU3RxQmlJ?=
 =?utf-8?B?b0tMRTl0Z3AwSE9sVHJHVGdDKzRXVzFFVVRBRTU4TzlDNWQrMmhSZEE2anFn?=
 =?utf-8?B?bDQ0VjhWc2Q1MjVNajJnbzVjT1Zsbm81b3NsK1BOWkVaTkFPeWpkZlJCTWZn?=
 =?utf-8?B?NndqWHcveWdIU00wNDlHdjFqVmRCbmxHU0Q5RTlsY05EK3dPSUdheERKeEIr?=
 =?utf-8?B?ZkFRMlJqUDl2dnVSOSsxLzVHQmxyVlB1Y2ozMjNQWlRJWVpUSzlrWEZrZmtV?=
 =?utf-8?B?QU1HQ2hITnZXUitHWWNXUnpOU1NiWFo2K2wxL3NvU2RDS3YwV21oTGJoOHRv?=
 =?utf-8?B?dHcxeVdDT2FUSW9kN2ZTemxZUERMbW9QZ3UxZFpxd2RIeHpOMHNiWHJJRi9X?=
 =?utf-8?B?VkdFOERzVkFRU1FyNkFDcWFIM202NEswTXB0cVNLNzVaeE5VNkI5KzFwQU1U?=
 =?utf-8?B?TElRekpHdVFTb25yQ09DOTZwTG0rZlBYbnU3SHBtQ29lY3FSTWpMK3Y5aWpI?=
 =?utf-8?B?OWtQbXVoWGx2bjU1RSt6YkZDcnNtOC92SnNBcUp4dUppYzI2OXRoRldQOTFL?=
 =?utf-8?B?M3B3T0doeWRlUGhWQUE0Q3hrb0RveUJYcGx4Sk1MTElNaTBCbG1seGFYT3d2?=
 =?utf-8?B?L1NGSUgzdnNsWXpCK05ldGxxV0R2UWFCSFZ5eUI4M0d1N3dwNVA4MjNCcDVx?=
 =?utf-8?B?dFlWUkNNVW9ram5SWXIvaDJIS3RYT1FwUzg2UEF6TFNLSENJUG9qbVZKWE1G?=
 =?utf-8?B?K29BUFViN3FEZVpLUHlFL0YwdzVHNllsYTRPOXBoLzF4TFhZbDVUUnV3YUc0?=
 =?utf-8?B?aURka21ZTXZONTVwRTJpNUtWckRLMU14REhlVkJrcUN6RTlZamlmSEFuZ2hI?=
 =?utf-8?B?UVhVNTFMWW41MFc4aEt3WG8yRGY0T2psQk5uSW5YODNQUDhvZ3dtQlBBd2ln?=
 =?utf-8?B?b1I4OERmV29YN3ZWMCtJTXk4RUNOYzBDUm00M1VmbU5kTmxydUNQaWVqOENv?=
 =?utf-8?B?QnBhTnRuOFovUHRabExud1g0d1dmYzk3Mlg0UFFmaTNlL2ZqUkpPaGhtYWJw?=
 =?utf-8?B?dXluaGN6KzFpZ05meEhwcWoyZEF0ZHJlVTdDMGR3elVFZnk4RTJuaUpWcjkw?=
 =?utf-8?B?R2diN2JoTSt3OFVJUS9rcktyZVhESWFvdG1zWURYa3BkeTE1MXBENDNKWFpv?=
 =?utf-8?B?azE1OUFhVEUzaDRKRlpIbkMvTWNseWVlemR4eDF3YTVOTnlxT1dSbWZMeWhJ?=
 =?utf-8?B?d3Rua2pjL2lTZnNVREVpeDFydWJ3d244UEhnV2dJUkNLN2QxOVl3N1BwSDRr?=
 =?utf-8?B?V200cnB1UmhzWlRMb0VZYks1WmJLK0hsd2x0dnFadEQvUlF5RjlzWElBRmpo?=
 =?utf-8?B?ZkhnYXk1akVDb3MxTG9qQ0wxSC9VVmhQMi9ocFNKU09SU1UrWk5pUno4VlhZ?=
 =?utf-8?B?WUJxTEtMNlRKdHFueGRtTkc0N0RyTTk1WnZIYlJzMDRRWCtzM0I1N0NKeFNv?=
 =?utf-8?B?dDdUd2lZaXFJb1Jkb2x6SE4zWEVIaTFscUxGbDB6YnVvVjRZQ1FOMG90NStM?=
 =?utf-8?B?RGI2Ymc1UmVvUStPNFJLMjFBQ0hCa0phV2g0aUdQT3puUXo4cmhJYXFUR1di?=
 =?utf-8?B?QTdNSkJIU0lSSitDZHcxSm1zV05GYVRHOGZmeDJSYkN0M1UrRThOVGFKWWdS?=
 =?utf-8?B?YlRjR09sWTJwd2QrdERvbk0raE85SEh4ak12OFpQZ1R5NC9lOEJvSTd2UG55?=
 =?utf-8?B?UEFQT2o4ZFFRcFlMU2ozVkxtWUg1ekUvdEdsZU1XSEtCL3l1Tzg0eW1WQkZq?=
 =?utf-8?B?cS9TQmpqZ1k4cVVYUmRwcjRIbEs2NWJGaHlwZ203cDhNMVF0OVdrUHN6ZWJV?=
 =?utf-8?Q?pbEnCEVdx4G5Fdi/8ClyUUlPL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fvDrm6ZuKGhjkxViy4dttWR9ueHpR2wjYBZ1o31LPcznjXYOf+f5S9TpanzcJ9/q3hcu6VMpQCuKtw9xNEslHUtEq/K1FqIaskMlhnAd/WrD3N6Dpw8KYgkdAsVDlJD/DtIrc1EMjdaDyugpl4os+/YEH51Y8RPfULJxmQOLWP05dBbn9uR3ew6MZChm/caI776JIOOjZFR0BkjoOz1hycvQfH8OG9mmMbdmtBFVoiVzkZAPhhK+TT2hISrJ+li3Svr/1dB6/x2QoXffGp8B6Vn1zCIzT/q+lPTTaDTjHAQ6J74/92KjhSyucXLgQKSixNp2LP9QXsh1xwRYfUyT4iuPBcA4aHd+fLWI9wAIGQCfMU7qghud8VeTfpnPHfWK3XxIX8dUIHpom8c+abKFaUczKUO0Kth6KtMM6Eykuo4L2mxAQ6QmSSwnKVl0f5dudXeGujiRTGCIF5hWOwwS454VAobE0Fck9KiAGcAa13v8v0hzxyxwjFkXs6xi/DHk1GPPKB9v/c1vMmvzh7cRyxGWddZb6fgwECLfyffj/QGS1vQfsquiAxAPnH3b14O76u2fdE9KUm4cTwwWzswVPPYNhAh2P6WnodJ/4OJ+s7egHHvf1iGheP4xRTAqbx0az9vyQrZqijVTT9SmNEvw7wDjsQtgmxjMOyCGpPLRa6lz0nVPsYQLAsfm6A+XKRVhAG5zB8gq6jN+e597j5cOqjRPP2u08mytgyk0gRetImSvsMpnWaDoE+aRTT5zHvSoCh3RiT+KboMdPhfAtI/NmPTDE5vhzDSOaJhLX7wQHfsUvi08P/fFZi2fhu+AWT0r
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bd0c04-19d4-492d-7f6b-08db216cb770
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 13:38:22.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6995PQfP0XhUqZaLKfzzM7z9UMdZ65/l910AETd0ltwbXe0Zg/fhsb57h0aakghWP64m7meJ4I2sT2hEr/BHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5921

On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
> On 09.03.2023 17:58, Roger Pau Monne wrote:
> > Introduce an install target, like it's used by other tests.  This
> > allows running the test on the installed systems, which is easier than
> > running it during the build phase when dealing with automated testing.
> > Strictly speaking the vpci test doesn't require to be run on a Xen
> > host currently, but that allows easier integration with logic that
> > runs the rest of the tests.
> 
> I accept that as a possible way of looking at things, but personally I
> remain unconvinced of this model. To me what is installed should be of
> value to users. If there was a properly separated directory where all
> (and only) tests were put, I might agree with installing. (Nevertheless
> this isn't an objection, merely a remark.)
> 
> > While there also adjust the makefile to use $(RM), and rename the
> > resulting binary to use a dash instead of an underscore (again to
> > match the rest of the tests).
> > 
> > Since the resulting test binary is now part of the distribution CC
> > must be used instead of HOSTCC.
> 
> This breaks the run: goal, doesn't it? If the new mode is wanted, I
> think the two kinds of binaries (and rules) need separating (maybe a
> way can be found to avoid duplicating the rules, which would seem
> desirable).

The run rule is not hooked up in any of the upper level makefile logic,
so I think it's usage (like in other tests that also use CC and have
such rule) is left to callers that know that HOSTCC == CC.

> > --- a/tools/tests/vpci/Makefile
> > +++ b/tools/tests/vpci/Makefile
> > @@ -1,7 +1,7 @@
> >  XEN_ROOT=$(CURDIR)/../../..
> >  include $(XEN_ROOT)/tools/Rules.mk
> >  
> > -TARGET := test_vpci
> > +TARGET := test-vpci
> >  
> >  .PHONY: all
> >  all: $(TARGET)
> > @@ -11,17 +11,23 @@ run: $(TARGET)
> >  	./$(TARGET)
> >  
> >  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> > -	$(HOSTCC) -g -o $@ vpci.c main.c
> > +	$(CC) -o $@ vpci.c main.c
> 
> You're losing -g and you're also not covering for it by adding $(CFLAGS)
> (there should have been use of $(HOSTCFLAGS) already before, I suppose).

Wasn't sure whether I should add CFLAGS and LDFLAGS here, I guess
LDFLAGS is really not needed because the test is not linked against
any library, but could be added just in case.

Thanks, Roger.

