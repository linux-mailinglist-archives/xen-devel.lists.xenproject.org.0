Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CA4F25F3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 09:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298559.508646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbdyJ-0002lf-IK; Tue, 05 Apr 2022 07:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298559.508646; Tue, 05 Apr 2022 07:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbdyJ-0002jQ-F6; Tue, 05 Apr 2022 07:51:27 +0000
Received: by outflank-mailman (input) for mailman id 298559;
 Tue, 05 Apr 2022 07:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbdyI-0002jK-5n
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 07:51:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eff67fe-b4b5-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 09:51:24 +0200 (CEST)
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
X-Inumbo-ID: 2eff67fe-b4b5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649145084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OqG7IHbP76DOKAaz6JaXpNJvt0jmGSJMkV3TDeWZPk0=;
  b=ihVVCvDeaDeZBlfdI5/Adm564kGuDM7EkWDh95vlOIfNoACtfEJd0FiD
   mvsoIkiwgCENepb9L3G85NscDPs0Q7kdZR5pn+CTss2oR1WIBbK+hwz2H
   VO5pajGr5Luqgy8wlpJSJG+wf97Z85Dyk0Y4oYZ4ScK+z7WPWMmD21tW+
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68424631
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Qoc+UKpOkjLFI6Il2HRzumT5aVFeBmIPZRIvgKrLsJaIsI4StFCzt
 garIBnXOqmMYmenKIpyPIy//RwB7ZKBzYI3Sgs4/nsyHngXopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y6q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBZYTgpOIPdz9iCXt1EoBI++6YGH3grpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZpFM2YxN02ojxtnM2ZLWLEdrueTqmjScyJhummNioAJ2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcVhwS2xzLjwxTyDXGMrYzBCOYMfsZApEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAOzARVodt/xory9U
 J4swZX2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1Y55eIWO0P
 BSP5Wu9AaO/2lPwMMebhKrrVawXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqNRJcA9TcSZgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:PKZgnKkQ15QQnAI4kcQp5YOlRLLpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68424631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD1VfFDswT5xiN/lR4KE3LfAzn4o0vs2tHGRdkmjH/EpD6AdkwkTT4wb98fzD1x7X/fCWppEFcXa17TWvTfCrlBQ5nR6XPDBxsua9ff9qQ4ZQQIJWCnqpgxpgWwUHd/iuuxhiKq1ZVZeaEkxLQv9iBJmcA4uHKzZZ4RZ0UCyiC7Yl3N8NCQX2bw09/PZqMk59VA8+AofbQ/rIepJcaIVYI7sxJJ1chUwl6pM6DStHBH0JW8tYHwYlBye9m2Eir+kMlKFShD24z9+ACfTkzRodDpD9Ez0htvowaBaE+Uo/xFM2lvrsewonUfs9avlGDk+h5YKT1Ce8qzPBJF6FaaTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XItcJLea+9/iugA0x5KWXlb5ZZGxIDQXLt3Q3Qo4eJk=;
 b=VN/fumIXvK0FiW28tv/MtPdsZdEwb66mbY9iMKOlUCV6gM97buPSu5v/7xL6cbUzfSYNH9oXH+tbmAntnkR5B5SjJT6ZlY792NllTqSg4NZP1V1UTLv9WMTttk//Clyaiy5FHbqHEZgERjlGLr0RciK4DcVCRo9Bk/wHNfC373eyc1B2PkfqNkvw8OwUuPOgJ/D/zElJw2MaUNy0lYk3u1l/82mpuqXOuEVkPYGpkuPgY3VITGyw2aQvTUbgWNskXmfvY06dcM4KXZWNBHhiticLsWSF99J2HVhxj9qVzKis1TJiygAv3TzrB2za3ww2B16OsFyGG/8jhPOnWVq2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XItcJLea+9/iugA0x5KWXlb5ZZGxIDQXLt3Q3Qo4eJk=;
 b=dOwAE76eVV1HmDvFcmb/eWdEovs/ccjPse2KGgZ5dVo6MSRjRd6TozzYF7IjeIGBCw9ASWsy0gzXiEcgRzTqV9JT5evCj9JPUMxGj9gz4Y5Wp1ZwVdaeBNtjlaR1peAb+iaEoQ/XvAVBdfI4qU4uXnQTiEiU3wVG097lPucLUmw=
Date: Tue, 5 Apr 2022 09:51:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/4] x86/time: use fake read_tsc()
Message-ID: <Ykv07h2FQE/khpdK@Air-de-Roger>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <bddbec0e-acc2-03f9-fe4c-167fa5ac0ea1@suse.com>
 <YkrxAX7X1sxVf15r@Air-de-Roger>
 <0dbc693e-dbff-a326-3d91-b97b7385636f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dbc693e-dbff-a326-3d91-b97b7385636f@suse.com>
X-ClientProxiedBy: MR2P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2378f925-e064-4678-f294-08da16d91006
X-MS-TrafficTypeDiagnostic: PH0PR03MB6940:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6940C3E162B712CD41BB83148FE49@PH0PR03MB6940.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWf7koW1XsMmE1UOvoLxEGRdtjUwNvWlHNh7BYJvoJlxEMnAHjiIPIe+G4bGVd6NYYSp+VBkbuKUAC3Y4hc503wRUTrKLpuFnuPMxhRvNHRbUcFChQbOmYApDd1S5NKPtdOVe6Yh2rltF+i9f8ReEI6ayTOIr7qmY+eHn7w/PP2/3+gg3kjzvdoY/y0mox1fe1xzIjSZpYlqPfx9QB/bL4jr8yUTYe36Iyk/3wrR9mriEdK3T+X+zsJMxK/NYJHEi72mwFNaItXfa+ZMyKR9043ybbUGdIikemyHjXCtJx3nQcW2D/28sWTiFBBrMLQ9LvDN4hhwcnrEY+nvttklwWp+75c/SANzEeXgKk231HYT/u7Hib/1QzL7ceLkt8hJ2C/jcSSautATbP72L4vcpmDD6KNQvgMxyTOGY1d7GQBeQ9sKh7WU88cW5qhoTZLfP1OwFn9YaOxz1d3dXkL0Wds9KCCNxNee9or+182OmeImqCaE0czg3W6jeiHGpIjkJu/bnqC50/Hflazn6rT3oOsyhx7XDt4JL4ypwiNqRrbzIxs9j9y5kYD8VEze1aK41xiQYn1GnQ4d6MfaFtQnXtRaCyLlAI0gAuha+nrrSD86sCceWyA9VdXlyysH+EuzPnkBMeWsOnJPhWh+IwCY0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(9686003)(6512007)(6666004)(8936002)(5660300002)(66946007)(66556008)(66476007)(53546011)(8676002)(508600001)(4326008)(6486002)(38100700002)(82960400001)(6916009)(316002)(54906003)(86362001)(26005)(33716001)(85182001)(83380400001)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODNOWXJQQWp4TTZvWkJaL0lzanE1a0F2NWRJczR1a3Q4ZVZ0cTY2RDlNaEFt?=
 =?utf-8?B?SVNQUzBEeVNSdWY4VlpXcDVGbmdmOG5ZbU5RSFNucHh1NVdLZW04WGJDUDNG?=
 =?utf-8?B?QlBmNU85cWdGdG9WT2kyLzlncDBCbE5zbkJodEZOdlR2dElTZDVGem00Q3dy?=
 =?utf-8?B?Tnl2M2phSnE3K2E1S2dDSzh1UUkrS2llNjFZNEY1bWZQbGJIWFhpOUNva0lU?=
 =?utf-8?B?STVQVVAvVUJmMys2VWNCRlNHVUpkMWRyMHZ6VUFQVW9TbnY5Um1iVFhYQzdp?=
 =?utf-8?B?MWovK0xlVnR5djFmL3lETFZtb25JUGkwNnQvYzR4M0MyRGhnL2c3RW1xMXNV?=
 =?utf-8?B?VnoyZmtWVWJxWmdxd1lYVDVvYTVRZTdiL0pHekpUSFJ3ZUg0ZzlPbXVmcEtm?=
 =?utf-8?B?bFdGb2RhVUVvQy9Xd24zdk9GNzhBNWptQnhqVE5hNHlNeW9IVE1Wc1k3eE14?=
 =?utf-8?B?d1N4bjF1VUhwbThBaDVhRGJpakVKODNoSDN5SjRyMGJtS2hIYUpPQUtQSkZL?=
 =?utf-8?B?Tm9mWW9kT0lGc3YxQlVqNDhHR1pnTytqQ0VHQ2pkK0FuSDFFSkg3NkJSQlEr?=
 =?utf-8?B?M2IwN25jT0NqTExwTlRMVEg5VFN5c1QyQ1FyMzNtVEtQd01HVzJOTWowbUNk?=
 =?utf-8?B?TVVYYSttSnByUVJIZEtSeGIxZjd2YytuTTBOVmRpdzZRQzFxZTRvcFJuRWpP?=
 =?utf-8?B?bkpyTUZ1eWJDelBKaTRLTktBemlnaEQ1Y01XT0RnaWNYWTNjZGtEWjZtbklp?=
 =?utf-8?B?clJHSWZUQ2RuOGpCOEpRKy95bDhuRlhWbUxMSVpDYUZmNUU4dXd2ek56N2JZ?=
 =?utf-8?B?Wmp2UjhLNWd5RFZQQnlMN2pCYTFJSGFvMlowYVRaMWNMYXljVUk3LzFvNlBO?=
 =?utf-8?B?OVpTN21oRk81U2dvWTdHbm94MVpiYWg0L00wdUNpQTZMOWQrNzdZT1FwdkRJ?=
 =?utf-8?B?dGpoU3JkUk9KUTNLYkFDSitiT2lPcWNoaTVldEdaWDdtUkNDbGVwRXZ2VFRr?=
 =?utf-8?B?ZW1iZzZicjZOY211bHBlc2tjOTVzNHFEZHRhMk1sQWtoNXF2YTNjNTAvaUdI?=
 =?utf-8?B?WkRNT3BhcHJVN0hPNmlsU0ZjYjY3aDhOaVlnZG5DYTc3S2pqMWhydE9rc1Zl?=
 =?utf-8?B?NVlOdG0xbGxvV3VZaHA4ZTZSUnkzVmp3RkgycjNXMzhlaHFESko5MVBMV1Vv?=
 =?utf-8?B?UjJsckRFYWd1d2JwN0JQZzVYa01rVGRJWlhTQW0vMFQvYVpMOHFrbHVUUlpq?=
 =?utf-8?B?NmlSYlRicjE0OSt6bk1Kc1dKalBhbjVGc25iRnNyQWtiRWVOd01DRTJuQVda?=
 =?utf-8?B?SGphc1Yvc1h1dXRJbFlwK3cvaEJTeTliMTd4dXY2UVJDOXhwdjB0UXZEZnJZ?=
 =?utf-8?B?eDNXSWRzbHN2YW9Cb0JEZzdDTUhvOW1uZjBHcHNSUEtoRTNPcTBHR3hxM24r?=
 =?utf-8?B?YlE3elE0VFlQZTI1UkdhQzhTRlFtOFUxNDMwcjJNdzAyb3E0Q1kwYlNCQXNJ?=
 =?utf-8?B?dEdlVlQ3RXhEa0tDTHZBbnRSSDlONk1CNEwvU2tPUTZzY1ZkT2xFemlvdytX?=
 =?utf-8?B?elFjZ3BUSjdUYVZQdWZvSmFYUFFBYkp6MFJPUVZaK3lseCttM1h3cXRISWcx?=
 =?utf-8?B?ZnRIVnVKcWkxTTBEK3JidnY2R0IvbEwxWW91eXRseXVTOGplZlptV3pyTTBo?=
 =?utf-8?B?ZmpZT3lkenBRT3VUcXVqS3RVVlQxR0NwZFRrY0pvWkk5UTBoa3EwRS9kOGVK?=
 =?utf-8?B?ZnRpL2Eyd25wWk9tTVJidzd4cHlkRUlLODVFME9HVzhrYlMwbDF0K3JqN2dG?=
 =?utf-8?B?ZVg3ejh2TGNTVWFxUmh4T0NORGdoS2JJeWthUzI4ZEZWbDlmNnluZ2ZWOGtY?=
 =?utf-8?B?VlQrR0dxMDlJK0FKMThYUzZHSXl4STNpZk11MDNlSVBoeXg2SG4wdVVST3p5?=
 =?utf-8?B?SWpyMWtHVitrL29TNGM5cVZmR3ZMbGtnMElZL0lmOWVadDVpc0xEMWs1bzRs?=
 =?utf-8?B?RjRUNmwyQS8ySGFHZGFmQTk0MTd0VHZkMzl4MWh6SnJadTNuQXc1dzZsUWow?=
 =?utf-8?B?dmdZNUZITG0vRHE2ZW5XMGdrNGM2QU5Mdi9YRkhacXBMWERodkRaOHQ0UXR2?=
 =?utf-8?B?d2M3REREajZHZEZFL2wrK3MveDRuWTY0UUxlbkZ4Z2RaT0JDblFjK3R2Y0Rt?=
 =?utf-8?B?UUFWU09oY3pheGVtaGdqaWlRenQxNnhMTWY3UXVwRDd5VG84ajdiQVlxWTBE?=
 =?utf-8?B?UW5NWXl4a2hCM1VUTXd0OVJSQkNvaGM5aUhucVBoS2xtWExYV3laZEpjMXhP?=
 =?utf-8?B?anBNWjNuSWR2eTJ6L0hDc1RDaCtDQVYxZk1CRVRnaTJKSnQyaS9CU0NXRVlU?=
 =?utf-8?Q?Cnu4xAGQgLPmqCeo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2378f925-e064-4678-f294-08da16d91006
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 07:51:16.0982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOYa3XHGUftJFBrFgII7S8e8hx0yJaWYfDxOPReiWmxqGy9HfrfS6adHEGkpl8XQNzd1KHJn2H/KjdPdQkFQOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6940
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 05:33:04PM +0200, Jan Beulich wrote:
> On 04.04.2022 15:22, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 11:31:38AM +0200, Jan Beulich wrote:
> >> Go a step further than bed9ae54df44 ("x86/time: switch platform timer
> >> hooks to altcall") did and eliminate the "real" read_tsc() altogether:
> >> It's not used except in pointer comparisons, and hence it looks overall
> >> more safe to simply poison plt_tsc's read_counter hook.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I wasn't really sure whether it would be better to use simply void * for
> >> the type of the expression, resulting in an undesirable data -> function
> >> pointer conversion, but making it impossible to mistakenly try and call
> >> the (fake) function directly.
> > 
> > I think it's slightly better to avoid being able to call the function,
> > hence using void * would be my preference. What's wrong with the data
> > -> function pointer conversion for the comparisons?
> 
> There's no data -> function pointer conversion for the comparisons; the
> situation there is even less pleasant. What I referred to was actually
> the initializer, where there would be a data -> function pointer
> conversion if I used void *.

I see, there are architectures with different sizes for function and
data pointers. It's also not clear all compilers will be happy with
the conversion.

> >> ---
> >> v2: Comment wording.
> >>
> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -607,10 +607,12 @@ static s64 __init cf_check init_tsc(stru
> >>      return ret;
> >>  }
> >>  
> >> -static uint64_t __init cf_check read_tsc(void)
> >> -{
> >> -    return rdtsc_ordered();
> >> -}
> >> +/*
> >> + * plt_tsc's read_counter hook is not (and should not be) invoked via the
> >> + * struct field. To avoid carrying an unused, indirectly reachable function,
> >> + * poison the field with an easily identifiable non-canonical pointer.
> >> + */
> >> +#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)
> > 
> > Instead of naming this like a suitable function, I would rather use
> > READ_TSC_PTR_POISON or some such.
> 
> I'll be happy to name it something like this; the primary thing to
> settle on is the type to use.

I think it's safer to use a function pointer type like you currently
have from a correctness PoV, but in order to prevent stray calls to
read_tsc() I would rename to READ_TSC_PTR_POISON. This was already
static, so I guess it's hard anyway for any of such direct calls to
appear without us realizing.

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

