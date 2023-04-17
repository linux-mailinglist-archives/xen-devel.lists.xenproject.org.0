Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F676E45C1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521978.811037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMSU-0003JE-CV; Mon, 17 Apr 2023 10:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521978.811037; Mon, 17 Apr 2023 10:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMSU-0003GY-9I; Mon, 17 Apr 2023 10:51:42 +0000
Received: by outflank-mailman (input) for mailman id 521978;
 Mon, 17 Apr 2023 10:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLV6=AI=citrix.com=prvs=464b9e9d0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1poMST-0003GN-C2
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:51:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d353bebf-dd0d-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:51:39 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 06:51:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN4PR03MB6718.namprd03.prod.outlook.com (2603:10b6:806:1ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:51:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:51:32 +0000
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
X-Inumbo-ID: d353bebf-dd0d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681728699;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dBc2aJE9OLrXpvgtc1+Kda/k+4UH/hEbAocd0TjUphU=;
  b=TrTimqCJd53zmv6QOQ0/RNzUehHypwgKQq+26CbuG1FQjBVphGhjKbjF
   xP/iQ1uy/Yh8wWMDmKysj1uguMztHO9lPCVUuMMSktZHkqNQGvoIXxLO0
   vufnZOxIkmgT6p6GFyrCv3JTRUzcJphxZhhqvRIzYlpKqh5XMIMht/dJN
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 106199728
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M5pk8KIKl658i/vWFE+RX5QlxSXFcZb7ZxGr2PjKsXjdYENShmdUn
 GMYUG2COfqLYWr0eYh0ad7j/BkFsJbSnYUwQQdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c40P3xl6
 qIVKQxUMBPbi/7oz7OBVcRV05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02LaezHyhCOr+EpXlx+dkrkDM4Vc9FS0UTHWwq+Cn0FGHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8UE7wWKxrvR8hyuLGEORT5ca/QrrMYzAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H8pKkjgxSJScxseIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN9gpkYKa1aoru7kLUhd5DIZiYSB+dv
 XECs8mY8O0KS5qKkUSwrP4lGbio47OPNm3aiFs2Rp05rW3zqzikYJxa5yx4KAFxKMEYdDT1Y
 UjV/wRM+JtUO3jsZqhyC26sN/kXIWHbPYyNfpjpghBmOPCdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:uFikWK1UzVPmA5asNh5zDAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3Af+sS12sW1/Lk7A/jkOD7Bqz/6ItmTGD20yndInP?=
 =?us-ascii?q?hV2UxRKHLRl6q545dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQ10fCg2LFwAz+irdNK0B/68L8zUjvpW3Bm4QzrI?=
 =?us-ascii?q?9ldS0NzVeMD2Ekm6oe9py?=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="106199728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/hmmuG3r6ee95GWRggeUqiOWsuhW9JqyrDim/GSgVtoaFtYs66nEWPFOsDEhwCRsJsPykR4qv8SYEqqrmjVP+iiUcaivSZ9S8JC8hChFBDefaWWWmOvK6Pj0oqvF0ICreGAwZ8eyGfsh4luswfZMPmYTZK0t7PBIhV9UzF13OOQWEIZyYLBv7IIRMggpnVXnTnKqrzGsWcE5toKaOL72h6ivhWzC79Yi5WtCl5WDK7fg14cVejjYG8eR7VFhHJtlD4iW2XUibWPOr0F+yewHWUKhVh1tRldTnsJ1yc6X3Kxjor6UxB09HMUKhF2zu4hGcB/6MguUaOWhLPMkjTu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luAQw0Nt9OFxoS6gBFVwZd4a0PvMp2HJZFmdmW97eas=;
 b=FdxtXebCNelXOgrEBW1GdAkgrGq8BU4YcQIHNgzWb3KED0JKEsr0ijKlLH0ZPgSNenPUowC3mLZ/xchsusMik3vhfy1EWYNmTw1ha4kpgjT5bZc2iFLqMRN1PT+GWdfpg4rEU/fD2bN0xHHiJL5CoksUQiIMOsS0fzKeTu9VWef08yCvFywkto38SuHRio9CJKaEk3oU5arbQ2kOD1yMc9dQUJzHJBP08m7NykwY9LAuaPr/kCVgOhl37RqwvOM5fn3tVAaJxq5ORwP4TlGVsDQZCwpmyzRpIpruQDuBh6yPGRhKsnEF9qznumNZorQcTMfNSuJHRGg4QRdmASl96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luAQw0Nt9OFxoS6gBFVwZd4a0PvMp2HJZFmdmW97eas=;
 b=Jccvu+K54oLcF/PJ1FbCPjwmkYjd7bC5apcsK62EHUew2JAXPkWxyH2tfXNnS+hsDJSWOADdpktrtpfT5o8eiR35VjhouJAnMkoOZQ91EYzDau8nT8rIYgTNtStCiCTnexTMufUkOidakPq6v04TXT44Co0K3TJXx2MvB6AMu+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Apr 2023 12:51:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZD0krtCOrEwiKMFP@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger>
 <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger>
 <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN4PR03MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: a83e0e76-a66c-4152-0e7e-08db3f31b4a9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFAT75lE5hfGMLeXK0VoOhcbqSrjXsfg7WXSjdnYH3UR+5GUOM7Oi42z2SGwZFv8HZ6woKL5/G1EJjI9HOx7znIwVNfRrY5J8sIxYdGHCbE8fglg+ihZe78i0GGw3TTrRbRKQ3PQwVbab6C1XVkWVxj/5IlPu/Mh54/Ciz7D1OKqSNIOazGbOXZI0zFRp1l4Ly27jkJgSY84NuKcDSaETisxHxqm42NziQ7Hi12e94hktFmad8ciCzkGgcnnTYpJQt3mnFDBnQmbz1Q1VAAfGJm8kWjUs9KLJg3cHo12YgtJpgX3oD2JF3yUyDLrGxeWD6jVhfpjvUnNGyIcL2TnM5D60hyr8wAyYmaCuH7+e3ka4rM3Pqv0G+DOl/6qzd0alsbWuOMmhP5ivQg+lH82WPm2U2tv5IKRYenjVH6r+qdBccHKQhIDZMdf0OHRXyxSo5eo1+DANXgtNA2jta4/eoewqTwRjzLGLAE+5KqAMIkLO6CmGK5Ya4P1k7bJsOj9CO7d4ebf0kHja/z1mFP1Jnz14P6NZOHYlmXBSJRBNVX747U8aHWm2/hN1G0P8ErH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(85182001)(6916009)(54906003)(4326008)(316002)(66556008)(66946007)(66476007)(6486002)(478600001)(6666004)(5660300002)(8936002)(8676002)(41300700001)(33716001)(7416002)(2906002)(86362001)(82960400001)(38100700002)(26005)(6512007)(6506007)(9686003)(186003)(53546011)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhQTTVhaXg4Ky9Rb2FhRExCUmowMU5WaUZMYXB5VFBhbStRT3JrUDFmM1ZW?=
 =?utf-8?B?dE16Q2ZoQ2IyS2FhZm9WN3NPOXNZaytVY1hWaCt2NUpFcXYzU3ZIc3BnaEYw?=
 =?utf-8?B?R1UxRnBaMHVnT3JQdTZqUGxoWEFKd0tQcTZmcUN6Mmg3M0ZvVkNPcmY1U05u?=
 =?utf-8?B?dmxzM2lJZXNxWWpaR2dCYlpNU1NiSzU5OHkwNVNmQ0NIVkhLV05aZmtISHRq?=
 =?utf-8?B?TmdZWXh2UTkxRjBxM0RsWmFFVlR3Z1lGVVVsZ2dyaGZZR25MWVlGQVQxQnhZ?=
 =?utf-8?B?WGdzWG5xaTdiNFFIbGxlQmY3L2hmS0pNYzdjYnUva0lpQ0JuZXNTOXJmWG5x?=
 =?utf-8?B?UWxaY2kra3VkOWdLcDU5c1JENXhXY2FkRHF5dnVUVkxkcjQ0OG1rR3prbFVX?=
 =?utf-8?B?RjdFTzArWFdxbzJNSWZxcUIrbTNocndpcWI1a2pMdHJSUWxvQ2k3em9DWHR4?=
 =?utf-8?B?Y3NrMS9lOStBeVRCb3IxWG1YNHBaclpFSzVibGxJK0pQM2JROVRqblZKbXUw?=
 =?utf-8?B?bDY1RDk1UlBld1lXQ3Zwb1h3SFk4RWt6V2dDK1Z1QmJ2TnNrMWJvd21BTjRW?=
 =?utf-8?B?bWRkczh5R255eit6MDFYbktzcVE5b25QcjhTVDg2aHJKS296bjVEMmN6UHVF?=
 =?utf-8?B?MUhPNjRVeVdBZlNPQ2dtd0JtOVVrTDJNOHlKT0hTeEVKNXBUY1lOMFltdi93?=
 =?utf-8?B?OUJOSmJpSU1JdWprS0wxU0RzOE9tbEFsb1R4QnMzend4RU9FTDdQekpWRXlx?=
 =?utf-8?B?WnFac0hMMHkzQmV4dUJmUDBjc0tCNFVRWlhBYTc2d2VrVThlKzcvYUN0UFFn?=
 =?utf-8?B?cDZWeitxYjhtemNXRVBjTDd4Q054OTVETnYxaFkzWVpDMDlOMGlEbnJnZ0pF?=
 =?utf-8?B?L3k1SEdPQ2dmWmJBZkhheXVkeGNET2ZQUWQ5Qm5WVll2NXE2dUlndjcxM1Nl?=
 =?utf-8?B?OWtNVDIwUnY2YnNxS2JQZ1EwZXJpRUlZUDZ5NUZxY3dyUG5LK0hmSEw1azNQ?=
 =?utf-8?B?em54M0pQMU1ZcklQaGllZVp2Ulc3UHZoVm5PdDBjVUtMc2gyQnZIUWczZ3dm?=
 =?utf-8?B?di9JelRHK3NRSm9UVGR2eUhkeHVBakh6TkkwTk9XeWw3M3hCekJsV3VsVThR?=
 =?utf-8?B?RXl2ZEVLcVNPMVJuYms5d1F4RHNoRmZrOE4yNERsREZtbXk2YVR5a3dQSjU3?=
 =?utf-8?B?SzZSVzZRVTJCeHVJTmM4V3E3dkJzRzczMDYyUWxTendiNlRwdGw0SjJqelNX?=
 =?utf-8?B?VktldnYyVWRwWGhUajlTWXlReCtZVEdzaENKMjRSTXJQMnNFNkxUeFpnYVcw?=
 =?utf-8?B?YXJHZ1dWU1RsVjV1Q1l2SWNXbnFqUjV5ZXZVdVcrU2huRG5LeG8wVHZuSGYx?=
 =?utf-8?B?NWZyVnkvaiszeGp3UnlaM1B0eG5SamVtS3Z6ajJIMzVVOE5mNk96STBGZnl0?=
 =?utf-8?B?VnN5ZklmbGJFKzNMOUoxdjBrQ3NrclBlcEVpbnZkWmpaZkVIV1lJb2luQnZI?=
 =?utf-8?B?b1NkK2hJRFQ2Z1RBWTFvTVp0enloZ1V6UDRvVU5VZVFPcXFVOFQyc2Vjd0pR?=
 =?utf-8?B?SEZTeWx5YzdzbmtlOHlIY3NjclFYUTJDcVl6UGJGZUtHQnpHZUp6SEpzVlIy?=
 =?utf-8?B?d2JKVXdsck0zSDhhTjhDeUlDNExsRGVsVE1Kbk5VL3Y0Qi9rUEtBQW1uTHYr?=
 =?utf-8?B?RUlSWGQxSm9TdERQdUNURUJ4NnJhMDNUbDQxM2lYRDRGVmt2ejgrWldsQW14?=
 =?utf-8?B?MGhQbnI5Z1h0RVVUVG5saXVVbDhmZG5qUEx4UmRFUDVkUmNHSS9PRkh3dEZp?=
 =?utf-8?B?RHNSWnVsdG5wSDZnOW1WTXFmY0JFbUtiQWNkOWJFMGp0MWY4NTdQajlFVVRD?=
 =?utf-8?B?OG8wQ2xNMmVjMXR4VUp6cUswY25Sb2FBK2Y1NFcvSlJqbWI5bm8zcmlLdkYz?=
 =?utf-8?B?eHk5bk1YWkVQN1Uxa0w3L2liRlFDOTdrMEcwZXFMUEJCZjVTMWJNSmRmcUs5?=
 =?utf-8?B?Tm0rNjRXUEN0L3o1UHh0WVJ6Q2dKSzRadGYwNnVoNm9OMGJoZkFtTS83V0hm?=
 =?utf-8?B?aUViWTlwRXJHK3Y1dDFBVzRLYXU5d2w5M1dPTEsweFdGYmtMdXJkZS9vWlFn?=
 =?utf-8?Q?UcZpSUcPASllFiG7s24ThFAkU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ujR1doLy3RO/Lm645F6lhvZJ+ZKweLbAB2+Nvbc6YxHsOkNz2/Yd7g+8pBIcCuKDDcgi04mMnINpVCna46PM2wA5Vk7NRB3jlCFU3GBZ6vrL3c2zz9o5qo4/QFd0FHrDP6+Q0BsnJXAYJF3pvvR6AMOQBKSdyWloJ2qISACsZYsfz7GQvOFXcMrGlw5fnHLYnnpTREGvMiv/AEbHdfOZDzxAYSlAy4e3i2SE+QkKvzgWmn+tl92CAoTLIMiLH8JJ5oozskTfHrt+M22wnlmaxpef8qw5K83mNagC0algfnMlJRDTmOW2OEyGKW432h+6gIZa3GNcODwixRc+ctfHERaRGR0TFzwHIm4R/jEOUVZdI3kJVGzpADZCaLk4X84Ao4IS7iFEa4g0MKnuVsWBGVkkkemRjSw4ZqHgDADeu6aBt8Zw/pnz6r1T8MvpayPP+NESO1ZzU8YIozjls0y2jIwYhnB5BZWqsfWBX+0UdkDtTQHomg7bG1T/22vKz6+3boqGzOBdyQgwW89dvdNxAFixHXg6FtlkOc30vOyvtBkLpEUOP8n8o4uC+ROtST17mRcqC17P6F1wk+Nrkssj24svgVduaN+ReZk+mK5ghFevqloyWwiHxZbirKLXAIFXLh5cEaYv+SAAJlFO7dVQ6KFx0YjFNV/yPAB546LJnSA/hjE9uf4TmEk1W/Jy31LFqrxmNM1gMHEbE1vmqhjA2YVBMZzSt/euqiWgIn0S8rJEFB2eUqY36urRVVURjA83197l/XP0tSBIKH0rvpgW3RkwgHO2DcVlbt6UB77pdrNFw3M9q85p/qlnHiWzij3pSZLF31rKpmE8kANluDwVufixGOeWzrT8Bdb3J7/GeX/P6BY6LG1i7dA3zSn5MD03rEYzvkZ7xQPgz1W5HTv8Vw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83e0e76-a66c-4152-0e7e-08db3f31b4a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:51:32.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCBF60bAvFf5D/UOv0da+qjxCfdQQ96vImuObt/io3rHRAWfLTdDhWXW4knHtgoNx6BPSvpY2ue2vfbo0vnJ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6718

On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
> On 17.04.2023 12:17, Roger Pau Monné wrote:
> > On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
> >> Above I have proposed another view on this. I hope, it will work for
> >> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
> >> after returning from pci_remove_device(). By "harmless" I mean that
> >> owners of those refcounts will not try to access the physical PCI
> >> device if pci_remove_device() is already finished.
> > 
> > I'm not strictly a maintainer of this piece code, albeit I have an
> > opinion.  I will like to also hear Jans opinion, since he is the
> > maintainer.
> 
> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
> holds a ref is entitled to access the device. As stated before, I see only
> two ways of getting things consistent: Either pci_remove_device() is
> invoked upon dropping of the last ref,

With this approach, what would be the implementation of
PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
exist and either return 0 or -EBUSY?

> or it checks that it is dropping the
> last one. The former looks architecturally cleaner to me, but I can accept
> that moving there might be more of a change, so wouldn't object to going
> the latter route.

One of my concerns is what is expected of PHYSDEVOP_manage_pci_remove,
I don't think it's expected for PHYSDEVOP_manage_pci_remove to return
0 while there are users inside the hypervisor still holding a
reference to the pdev.

Thanks, Roger.

