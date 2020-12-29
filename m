Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21612E700D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59840.104929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDSh-0004c4-Tu; Tue, 29 Dec 2020 11:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59840.104929; Tue, 29 Dec 2020 11:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDSh-0004bf-Qf; Tue, 29 Dec 2020 11:46:47 +0000
Received: by outflank-mailman (input) for mailman id 59840;
 Tue, 29 Dec 2020 11:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuDSg-0004bZ-7b
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:46:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fec66728-40a1-4582-85e0-36161d8c38e2;
 Tue, 29 Dec 2020 11:46:45 +0000 (UTC)
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
X-Inumbo-ID: fec66728-40a1-4582-85e0-36161d8c38e2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609242405;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wt1KwkCOTf6TgPktf4Nm8IkBmAd3wAm7/Kr12JadmJk=;
  b=I4OrbJIjrkdCLurXdr5rzgQwKLbmz+1gNXeA5NMu5W515jQRlpdTaJhi
   cKRCmNPiNjQ3kezzrSGHEk67eILtwFNJA7lnY1fbG+TdJQdrzl9bel/uW
   deTygmz3rEE0kyOOXAgycbbT+IaO/fd55WkMWVCvBHzAptvULEOs8uENJ
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vX3MnGvdH8wW30MBaXLhZ80PyVrl96swx3n9Uoys0TP59EZ9EFRiqeUy01d5ANLDbbp0U2eqAU
 S0exuNIcvValUXpcpeIq1Y5Mz7wYxMjGZ5+01T1WD00wpr24kCHd2zW46FxcaJfDnOluXSAzwO
 fz8GlvYCGUVBho6Txm4P0funQME520C+C9d3w/Gaf2VjiaNASXc/eCI73+zkgL3QcOueVEs/t5
 HCkbvKGL6tSzjI7G2Qes4wd61CPEUFxznGJbWN6M19m/s3i+JuP6FUSCNwx3jvHvYlqovmTcq2
 FpA=
X-SBRS: 5.2
X-MesageID: 34317999
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34317999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scyw1AViVPAsGQr3YeFXWuJ+yBe770i6tFyRc1eH5N4Cn4MndZJw4XJjJkaxeobl0iM570xK8wr+qw0zG4KmN8+ARA9H1ZdQlwcrLjg2vJPTNQQjgEWe1R1VmFclInPc5YpmNY1jjKxXiXx/aF2qqVFnQIew3QJIhrTzZ00GdhvuezDQELWsTIyDKuzy3eJjtX5ZAjZAiC280EecwanEx48AJCAn+NXyyUJe4iDYWn9SKUwTD+wZQmxVj0oL1TcKilORjQh5gtjyg4Bn4Yb23O2SA7a9Lz/O96sftat9mX+yvUtuD4NjR6niEjVwbytmgbG0aSddqjINVwzN9VrtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt1KwkCOTf6TgPktf4Nm8IkBmAd3wAm7/Kr12JadmJk=;
 b=GPFpLbk7CLeAW2FSWT58EA7xKQM4X80duyDduCy/M5ZbjhY5eZaJAs59L8pTWmp0eDAXFi1p01cNtreGjqJkdm/bBvx6RvXB0USafFlo/T2P8XBzpCO1zjsa5KspqkSdBcwBvXe1f0boaUpxKFL6rcPz6AJiLJaHnM5apSX5B+enCX55UyDUHMhJanl+FO7mEpD7M7sovnTHVJhw9c/Xrb8IusV40gFljH5Y7rNyi0GLzIk+MTVtTcWuOqPnwBZ/g804H0Ucp2IqywAHpSPBvLlJ+jGEauWlaAeK0jxYoR50CWHZqv0RVZ9OgHrDO3dhRZfeTnzOXE96Sc5WD85PXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt1KwkCOTf6TgPktf4Nm8IkBmAd3wAm7/Kr12JadmJk=;
 b=U9u0LrsGritspG9F7a9YzxM/pxacg9GsabcRPDXsFkftsS2VziPM/VKsLPQCm8+3UlYIdr3c2cLQLUv6YTwbtRDjmfCjhhuBpi8liNWjjjz5jTrQ2Xe+SByKl3lmgR538fGj2k8zCXNoVlWzLSRHcby9kDoopw0TKjsX+xPD0Cg=
Date: Tue, 29 Dec 2020 12:46:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/24] Remove NetBSD's system headers. We'll use the
 system-provided ones, which are up to date.
Message-ID: <20201229114638.yegfswyqzhz7tj25@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-8-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-8-bouyer@netbsd.org>
X-ClientProxiedBy: LNXP265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::13) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ff1185-5ee9-4a74-36b7-08d8abef6994
X-MS-TrafficTypeDiagnostic: SN6PR03MB4590:
X-Microsoft-Antispam-PRVS: <SN6PR03MB45903D4DAB5A7D666AEE10668FD80@SN6PR03MB4590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTr2aOShnahO9/3Yf/XTVr2rdZWxbIDIQ/UdSpLXcbBPNAMwqtpwj8hNrfxY97Q9wOyI6w0jSy9z8R13oV6l/o1Humxb9vgbEjIa6XFGb2H5oYvvcHkzEY2cOS0rKoZmlZuEC/qqWAo8W65nHTIta/yvq748QVQLN5pI7KTU7cF3MiZkVRc2gZm40E3KkEvH3e4MUrfNkoIebZQga0xApsCEGbvZCEzfQpfAauJhUHf+42ifUdVSQfvaTLWxYzMTP/x5EqF8Kxm1YDmpunlXfJVlW4PmC6qpAj9tvJ3dqwBCL6gyeDyi8PsgzT0adbH9o5XZ+UnBf4iOZ0NmPAEBq/FhoULBSzc+X+8eR5cBDYRx4rHMRdvurG2rgWVM03gwBaDdUiMi3y6wVVoYDV+yeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(6916009)(33716001)(66476007)(5660300002)(6666004)(16526019)(66946007)(8936002)(6486002)(85182001)(26005)(956004)(478600001)(558084003)(86362001)(2906002)(186003)(8676002)(316002)(6496006)(66556008)(1076003)(4326008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zk9OTlNUQzhWV3U5VG0yenhCSWRyb0QwRjJhTW1EWU9YUGtiaW04ajZseTE3?=
 =?utf-8?B?TEIrdlNQVHVwa3dQM0l2M1pkSGFwUzJEV3NJelZSQXJPODRpbGc5VnZHS1dR?=
 =?utf-8?B?MnBMSHJCVmsrZ1IyM2gzZ3kvZThEdEEwNVNzS0s4YlB6MkU3bWdlSzg3THBr?=
 =?utf-8?B?b1lHajNPNlZMUld2V3FGV0xSUWpoaXhqMEwwejlZcUpOdVJjRFd4bjUwMGJE?=
 =?utf-8?B?aDhJSGNkVTZLMEx1UEVEdVNtNWlkZVZjeWdoYldJYnpjSUs0RkNUVEpsRmd6?=
 =?utf-8?B?VUdOZlpXR01uWTExMEJ2blNZc0tCbi9Fb3Z5cjVkdHh6R0R4NU55M1ZrMHN6?=
 =?utf-8?B?bnZycVFxdm1zcXNkMWV0VlcrZHFnTTVERUREQXJtR1BJTVFjQ0NjUW1hVWtx?=
 =?utf-8?B?RFU4RjNjY2lCTkw4dEMrdFUvZXBYWXNwa2RpaVlEY1NWSTZONldNS1EydlZm?=
 =?utf-8?B?SGwxeU4vWHIyRnF3WVlzMVkwS1oxOVhBTVF6cU9JOHhKSXlXR3hYVFMwZXcx?=
 =?utf-8?B?aGIrYkJKWmlUemZWOWZFdFd4WDI3QjNpMTRPWmdRbDI5cmNLSU9GSlZqbHp2?=
 =?utf-8?B?QjVVbExuOFZ6SjU1clpUTEpHZCtybGlVRldnN3R2WVRrRjRHblJLR25GUG1h?=
 =?utf-8?B?bjB3d3dlSHRhOXFhVk1rMHVuK2VncWV4MXBUOGR0K01SZHp3cHlGcnAvNmZW?=
 =?utf-8?B?Z2tzOHhMakw0cmNqbE5ja2dUeFpUUnZMdXZ4czlmVVdGVmNLM2JmNzJJR2hM?=
 =?utf-8?B?eTM2dFdLaFpCNWpTei9nVUVjNU9zUExvR0l4TFBRZGZrSURMK05TU1RRK3Mw?=
 =?utf-8?B?eFBrT1JUczc1MnJyekFhVjBOUVFLSEtnY3QwREpmVVBjNFVRdU5PTVpzMDVW?=
 =?utf-8?B?Nit2QXRNajl0ckhqbFZIekd2Y0R3K2lKdnNscDkrb29kK2hiR1M2NEVzRjZn?=
 =?utf-8?B?QnpiS1lLeEJMTXVOWWFBa0tKOXFtQ3l6eXBOaFJEZUEyaUs3cXY3MHUzQnpP?=
 =?utf-8?B?U01aOTYyZmRMWVU2SzhObm1yc3oxR01PWGE4SmxLYXRiSU4rVDR3NFZkZVFL?=
 =?utf-8?B?ZG9CUlN4Z05yTE1vNXhpZkJuaFo2aHpzMnNRQWIzLzZmb2tuR2hZSjliUVhX?=
 =?utf-8?B?ckluTUZ4TFZqYWxRRjFGQWhQUnJ5TlBVRHh2MHByS1hnbkc5L3RUcldSNmxn?=
 =?utf-8?B?VTFMVnZ0TXNUS3hKSGF2RUNYTkpmbGxVbTYweW1BR1Z1TmR5UVZOUUkwc1RO?=
 =?utf-8?B?blpmeDArRHZnbFY0cnN5TVZUSGJvNTBmQ09DcWhNQ3diQ21XNG8yZXo1R1M3?=
 =?utf-8?Q?SoQ3y3eC6VTkBnLTWxdg6BwsIg94m4m7/x?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:46:42.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ff1185-5ee9-4a74-36b7-08d8abef6994
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JLWxTrhEq9w4T5uO7cPwBqyYtM72ba+yZYLFSQn9+xGbjTkiHb6xYx8L9H1RTx0k7ilZ/aFmjsWiPhOaZsdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4590
X-OriginatorOrg: citrix.com

What would happen when a new device (or ioctl to and existing one) is
added?

You would then run into issues of newer versions of Xen not building on
older NetBSD systems, or would have to appropriately gate the newly
added code to only be built when the headers are available.

Thanks, Roger.

