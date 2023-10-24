Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4057D48BD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621714.968460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvC0r-00047R-T8; Tue, 24 Oct 2023 07:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621714.968460; Tue, 24 Oct 2023 07:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvC0r-00044w-QB; Tue, 24 Oct 2023 07:39:41 +0000
Received: by outflank-mailman (input) for mailman id 621714;
 Tue, 24 Oct 2023 07:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvC0p-00044q-Sw
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:39:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a8fc12c-7240-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 09:39:38 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 03:39:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5466.namprd03.prod.outlook.com (2603:10b6:806:c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 24 Oct
 2023 07:39:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:39:24 +0000
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
X-Inumbo-ID: 7a8fc12c-7240-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698133177;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FvkJRgXt7xT10SE12iUYfQ2NYCFYi6HxzVygAWhA69I=;
  b=Ev2t/s25aTuXG+q9mQiR4jujwxyC9+z3VpPhpXji1hEO3td0z3d9779B
   dPibgIVJ/JUNYjnMc6oyvF3zAbohD8tgJ8CkkaoySZXSo6DBgO3W1YofS
   fehFEwqqsg0M8oYxBeU/g79tU514puGxaf5vL3+kgdnB7U2b6dk3Qsx97
   o=;
X-CSE-ConnectionGUID: l1j0eScfQRmxMByriFpv+w==
X-CSE-MsgGUID: YVPjP3MQTxKgjCxpT4oUcg==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 125698828
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9dhzIqLo39otjKMcFE+R55QlxSXFcZb7ZxGr2PjKsXjdYENS0zUAn
 2BMXWqCPa2DZmCjf4wiYN/i9kwFuZLWytVjG1RlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5zWGMW+
 McTJgk3awCmrfOswZyjVKpz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv227GezXOhCOr+EpWJyMZouAa2/1ADKxIUfkujnaW+t0WxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uh9AySw7DIpQaYAmQJRCRIbtAOvco6Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6k2hxPLC9N8Sqi8i4StHSmqm
 mjS6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:/0R4K67DzD+AI2ImhQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3AMSKuY2h5lhIvyip/5cF5rXSCQTJudiTflHrrKEG?=
 =?us-ascii?q?BM2N5bZeEU16+4L0njJ87?=
X-Talos-MUID: 9a23:zGM7LQbhX92VfuBThgHUhgk5Ef5U84ehCmsdialavPSPOnkl
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="125698828"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW3Em4yeT2mLaCY0O1yxMVBiNQPZIzEVbnu5yGNwywGUMStdRtKXSWJBzzRKloo6srVifG6fPoJQPlbKJNVIRjxkGKx858wRYWxYmAnYr/JOPMCFq1uPlEqAk+LYFIiqsCNcvt0de7eW2qHudWy4KytOUH9ZJtEHcxaqv7HGZ9Yn/+xtsGc5OxqAk2+5nUVJGF9AZuaFGMlABqG/OmEIObQJdx/DbArZ+isf5ILxUZZ6zdGVmJgsYXFxBn7bo42Sb9eTVvgbm3i/6OXRvzhP8873x11Ae+6CFzV+EdL3TY6efcZuqDXmsmdMu7ojzY1LL4kJQdoTgw9dqEjQW6oeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxhTkv2FkQ0zeJkTVbbuMTBoosOE4Y/qbQFqek0JtUg=;
 b=mDzcZXDixiQ4Xui3hG+m7hGbhyyVHF0F3VlpluXyj+Rxyd+cEHE/vvMN1tSE4FDmRnzrl7HxnNmfrKNFoNTnN2Wh5xbV7Zrhcvm77EtGBBx4+MDyIeqy8YDGsQTJH8i8rS9SMjXb9yeM3j92nCfvrQ+gPkEGOpndNgf09uHmWJTMRIYbcEGRy79UREBdjItGPi8dQyJOry14wMVeMsV+8pMz9t8v7fGnA5HcYOkM322z8Td3C7+D1EnrrFMboipLfZu3RvkKGPWZoj+n177qf/zGVIffvfFt8BS/k1ceoEgI4IH2ml8xiiuXX+qB0jfix1ovR0zeTStuC7WPlN0LPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxhTkv2FkQ0zeJkTVbbuMTBoosOE4Y/qbQFqek0JtUg=;
 b=g6Ilp657vKyJm2O1AdYMZjybh8f+WavMMub3ykzuYHw+vi0SnjfLU8u+seap/7jxdcNkg1e+PgEdPBHBnv1tXDInjTbv4pv2D8O4CtPkgINIE+yL+NhNtb6SehBYjqZBWxcOURB63W34O3RioKWtdk7rIBnJXJa66yxaEBiYVKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Oct 2023 09:39:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vpci: allow BAR write if value is the same
Message-ID: <ZTd0pxpwtEbsCny0@macbook>
References: <20231023163615.693462-1-stewart.hildebrand@amd.com>
 <2ef80dad-5ae6-786d-e89f-d0c3af44b485@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ef80dad-5ae6-786d-e89f-d0c3af44b485@suse.com>
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: a95c6afa-311d-408e-5c4a-08dbd46457f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMqh34XKkzXyPs3iPm9vr2/ssgh3oUUzk4PiRuFLvbRv+9wbCpVBWpA4PbJtpADxBWBG+uiQoPjdoLTycSAyth5KxeDLSgG0yIeQ/HD96i5L7TBqhWTfhhVC+JO3x3SS77n+ZpwHblHdO9/ouBOS/3lVSWyVmh5660GIgrGLxUC4uzRJNYcwgsLug8MoBSmkIGWCQ7dMXsdf9iGqFpwYdL+xgD4+T9/8eqi4lXyENSAog03JB4W4FWiXBUkvjQJ1ZK6YvzNzSJkWatOZgkSG6JpUHhHTEyKTZeG1xZqbM9jqWM94G+yKAFzqxg9Z1CvMvVxnqkx6MAnmXG6/C9s06Lhn4hkXgdEG1C8dHGyAg0VfK+gM1GZUIzgijMas5CrpfZptVX+RMjgrIJyaOGZA2uoQmjiZ3agJ5TQLU047XsDkHSsVPuUafVD/ovCHJ/nIF/3HMocZHttKcDJNEv8GeOAXZalI2ZnBqECsjF0NyM7h847ryxcPmRLsIGPxqJ8tkZzUwGCxpDZyao244idndAH5TdoVdUJHcbD7dWHk4wqF9ZvNbYIWF8sBZdSWpqKX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(33716001)(26005)(38100700002)(2906002)(41300700001)(5660300002)(86362001)(8936002)(85182001)(4326008)(8676002)(478600001)(6506007)(316002)(82960400001)(66476007)(66946007)(6916009)(66556008)(83380400001)(6486002)(53546011)(6512007)(9686003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkhpazZvWkVhV3hHSXZLZGNJK3VleUdwZFFQUm9aaHhET3RVbDNJazFLandx?=
 =?utf-8?B?djE4NHNtYk5COFNJNjVDVlkwSElpZE9wNDhzSmdmVWt6MVVPTVpPQjVyb2c2?=
 =?utf-8?B?RnYwaktpTSs5OTNSamdBbTZMMmtSTGZteTRrdXFCY3dPa3JHeW5wUG05OGxp?=
 =?utf-8?B?VXNZVm5DbDFPamg1T2lPSmVuOWdpMHJlV3VJYTMzMzRRYlJ2R1BRNzZqTDF3?=
 =?utf-8?B?T3NPbGRwNEd0RmpadEtTallJWXpCT3ZuZXlDTEpNUFJFdDMvcHd6UnNhcll4?=
 =?utf-8?B?ZGF3ZHdwdWlNaTlQa0tPS0E5Nmhla3pSazBDcS84RmxJL01HRXZSQXJSb2ox?=
 =?utf-8?B?ZlJUNFdEMk12OXJKNHdSL3gzU3dnRFYrRDYvY2llRGxSbzllQ25ibW1PTXhW?=
 =?utf-8?B?cXR0VlhRZlZYWGVjaWhBWjhLZTNpZGZiV3pBZFltR1U0eno3TVM1QWFzbnhO?=
 =?utf-8?B?SmJMVTRNcnR2YTdxUm5rLzZKNURLTnBLcm84M0Qrd2RERzk1WEVZcDhpUkp3?=
 =?utf-8?B?Mnh6WnhDQ09NbjJaMmQ0aEwvNFAwYjcxNXJFbE0xYitVaW5Cd3pHRlcxOGN4?=
 =?utf-8?B?OWZseDlHZGNHZnduV2tMS1NHOXB6SGtUUHM0cm45QkZiVmZiUGNoYUx3aDFv?=
 =?utf-8?B?VytFcVVaelRLSkpDZlpiMG0xNVBGdXhqZXBwWFMwa2JtWDlMN1RJd1ZGSm5Z?=
 =?utf-8?B?NFlaYi9PTW00amlhNkx5UmlwcTgwWm4zMVR1V2ZNWThTeGFDVVkycjdtRkNV?=
 =?utf-8?B?S2l1blRLNkF3UjQvN3F3UmJScGgxUGoyZHlpenJrM2tvT3dOQ1E3c0JqNkkw?=
 =?utf-8?B?NDFISTRyM2RMR29SUkVoKzNxbG8wRGpTVmhaeDVIbzhidTZKeHRqZWhjV2x4?=
 =?utf-8?B?eUhEMU93Nkx4d0FlYnNsUktYN3g4VWswOXFrcTkzbWg2ZSs0SXRjQThhdnlW?=
 =?utf-8?B?SW5reUlQdzF0M0QxQ0M4ZWROMlNlYnFSRy80WVF1RmcxS0dLZEhoMk9IOERQ?=
 =?utf-8?B?U1gvZTdoRFpYZm5ETzBNMDRFaFI4d1JVcmhPTzZFRWdWZFlVc0FwWmVmaVNj?=
 =?utf-8?B?OWQvVFFIWDNNRTRrUThodDdOK1l1b2RkK2haQjdHMG1JWGFOdEVlcENSK1Fi?=
 =?utf-8?B?M1RxY2dPb1R5NzdEeTRMTVRaMEVmL3RGeFVoZ2UzaUk3MkhSYWh1ZnZSZit4?=
 =?utf-8?B?emdOb0pWdlVaZTNHeDg2anhDcU1kLy83dkpkUkFwU0JmeWRNYnduRDkxQkVX?=
 =?utf-8?B?cDBmTnQ5YXY4LzNMcExDcUVDUUFDS0NTRm1oWlFKMUZTMEFlOUxsNVQ4SEgv?=
 =?utf-8?B?STk3VFdKVHRXSG9qMWpWS1BHNk1wQXNGN2xHQ3dlM2ZBSXUydWtpYWFUODJV?=
 =?utf-8?B?b0o1ODRneVY3YThHclR5SDQ3dlRnZjNGeDQ5WnhQcE1Jb3ZPWGNsK2RMQndE?=
 =?utf-8?B?SjVVWWw2ZXIrcWIyZElERHkycHNuTGpWd1NJSFduWEtTNVRBNTM1cEZWeC9u?=
 =?utf-8?B?N1F4TG5DaWNOL3BtZkZUT1k0bmdXZTJCbHU4Ymd0Q0l6b0wweU5LK2FZMWxJ?=
 =?utf-8?B?SllqRUY5Y2UxNXZJR1Y0SUZBNTZyTFVnNlNGMVBENHNCSVpMaUFvNm1iSXhW?=
 =?utf-8?B?RFJTQ0tFZHVHU0d5dHIzaTJ2ZncvMVZEQW5sVGIyeU0ycklST3F6dktsL25v?=
 =?utf-8?B?SS8xaG55VUpxYmdoSmR1UDM0cHF5VGpac2xzemIzaEViVDhMMUVuVW41b2lu?=
 =?utf-8?B?SE01QU4yLzJjUjBraGljdGd1UTMxMGZJdUlsdGM4R0dTSU01b1Y2dm5ESkQ4?=
 =?utf-8?B?YVpsZEZBbG4rdUVWa0U0Q08vM2RCKysvOFpaeUZFdkQ0QlZuTHdyWS9GdHpp?=
 =?utf-8?B?L3NGR3lxZ052dWNsd0FIbm4yK3RyQVNTYWhibFJ5YmhNaERtcFpGYTZCcEhB?=
 =?utf-8?B?V0FnZkZHVlBiSnRJUWxNUjBMR3pOWUk0Q1YvamVGS2lrM2trNVJvZ01sMUor?=
 =?utf-8?B?ZDFoMGhvSGNDUzRES04yTSthbHEwUnJ6VEFFRDNLemxzc1Q3UHBXaklEMDc0?=
 =?utf-8?B?Z21iUngxL3ZaU0txNVlqZ1NsOFA5S3R3OUlEQXpVVEJCUXBpOFBXV1IzNVF3?=
 =?utf-8?Q?huIvI9G1NpoH1Arh1Ea6i7azU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	55nt011VxvkS3IWDx8o9b6t6EvNvfDeGf8iWP8VVbPG1DQ62pa/dDTUjUJtJdRhfojra91iSpRZ7OCSpZPz+1S5rB2Sec0N6uIJqFPyrZeTqIHxjvWqJVBawrsynwluBEbX8GDIT1uoxn3Youq1c5G4Oz9iv1z8t3U2r0y2vgZNDJJGoI0dLmys0Ufg9iCEe2bw2xEb5LflKNf7sauml2oDqLVfU7nUeDPTqaNy+0rCMipI0e713yG72Agv8EH2x7lN/KH8wTYiUGmT3s6swwPW8cTYLtM3HGkluO+Ac80veMA5Lo4YYansfMlE9ZkxGnNnWLyTKPjfl6/EU9xY5g86o4xYamO0yDYwVoit515X1CNid4xr7RMPNmV3nCGHqpcG4DI1b/rEoVPuNgggpVQAaPaogd6cvrHoCiJl1hgSh3rHDDrCwkdj+qq4rloqn3q6eOVUmVQDRuVBFx7S0MkTXwWXZROEIX6z5pNq95soYGnqtO7e1NRUupHNi+XsOJzrp8fIFceZwW6tZBF2uhgDzlzCN6yvpj4C4rUBZsRHW0C3DXDBYTUN5QZDGWaUkwMUgIig4yEJGvR7AWREq01Rflc+FjfG9rjhYcL3blobKivWizaYHhgMqsiSSE23f4RXoRrK9ksHp4AnJpR3SyoKXYwkYGtAO4F874B5H8scQ18vpi6NxWUZDmSRlQVDv8WVW1ljjqTyn6ph4CnA9lA3YGRapWNhFHKzFQm8WcZYFFpeQwbqVPcXYRCCvDP8Z6KFcCJCl13sbFZ8rJnqcvdz7RlVXCC0TMHxQ+VGJT52m5Kf9S8+yPI3Mqmkr7MRBdtZkKWvqGAIKfbS47YkLLw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95c6afa-311d-408e-5c4a-08dbd46457f8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:39:24.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY24NPLhUXzo00vPlFun/95x+vu6tni8cE6BGPmKJyAUN3n+DWWD+Cg6pcIvd5qPDOFvoXFSqF9Q1W4K9/eq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5466

On Tue, Oct 24, 2023 at 09:09:45AM +0200, Jan Beulich wrote:
> On 23.10.2023 18:36, Stewart Hildebrand wrote:
> > During xl pci-assignable-add, pciback may reset the device while memory decoding
> > (PCI_COMMAND_MEMORY) is enabled. After device reset, memory decoding may be
> > disabled in hardware, and the BARs may be zeroed/reset in hardware. However, Xen
> > vPCI still thinks memory decoding is enabled, and BARs will remain mapped in
> > p2m. In other words, memory decoding may become disabled and BARs reset in
> > hardware, bypassing the respective vPCI command and BAR register handlers.
> > Subsequently, when pciback attempts to restore state to the device, including
> > BARs, it happens to write the BARs before writing the command register.
> > Restoring/writing the BARs silently fails because Xen vPCI mistakenly thinks
> > memory decoding is enabled.
> > 
> > Fix the BAR write by allowing it to succeed if the value written is the same as
> > the Xen vPCI stored value. pciback will subsequently restore the command
> > register and the state of the BARs and memory decoding bit will then be in sync
> > between hardware and vPCI again.
> > 
> > While here, remove a nearby stray newline.
> > 
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > ---
> > Do we need similar handling in rom_write()?
> 
> I think so, if we are to go this route. However, ...
> 
> > We may consider additionally checking during bar_write() if the memory decoding
> > state has become out of sync between hardware and vPCI. During bar_write(), we
> > would check the device's memory decoding bit, compare it to our vPCI state, and
> > invoke modify_bars() if needed. Please let me know your thoughts.
> 
> ... iirc we discussed earlier on that doing resets in Dom0 wants
> communicating to Xen. Any way of resetting by a DomU would likely need
> intercepting. This way the described situation can be avoided altogether.
> We may go further and uniformly intercept resets, carrying them out on
> behalf of Dom0 as well. The main issue is, as with any config-space-
> based interaction with a device, that there may be device specific ways
> of resetting.

I agree with Jan, the plan as I recall was to introduce a new
hypercall to signal Xen of when a device has been reset, I can't
however find that conversation right now.  It would be nice to trap
device reset attempts, but there are some device specific reset
methods that would be too much special casing to accommodate sadly.

The fix here is just papering over the issue, as if the device has
been reset and Xen is not aware of it all the vPCI cached state is out
of date, so it's not only BARs addresses that are stale, but also
possibly MSI and MSI-X.

Thanks, Roger.

