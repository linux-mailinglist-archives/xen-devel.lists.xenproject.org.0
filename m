Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731203F6217
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171629.313167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYkW-0006Li-5j; Tue, 24 Aug 2021 15:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171629.313167; Tue, 24 Aug 2021 15:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYkW-0006JF-19; Tue, 24 Aug 2021 15:54:04 +0000
Received: by outflank-mailman (input) for mailman id 171629;
 Tue, 24 Aug 2021 15:54:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIYkU-0006J9-LA
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:54:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f45328c-04f3-11ec-a8ea-12813bfff9fa;
 Tue, 24 Aug 2021 15:54:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-MoP61kcqMwedJwzxds7Mmw-1; Tue, 24 Aug 2021 17:53:58 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2370.eurprd04.prod.outlook.com (2603:10a6:200:4f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 24 Aug
 2021 15:53:57 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 15:53:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0015.eurprd01.prod.exchangelabs.com (2603:10a6:102::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 15:53:56 +0000
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
X-Inumbo-ID: 7f45328c-04f3-11ec-a8ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629820439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ESXvhL92kXbfBCEck04emyxay6VpJgsv5wgUREth0I=;
	b=fyeSTEm9zD0qucbcbhP019D+eizUQ716QJow9oMAW6tlyDJeJNmjg1xnHTcwGa36DU3Q75
	BXg0rR2KJLo7GLmPPrJEoByPXBESUaHMd6KTtHYDWp6zNcU1WD4xM9pSym4i5Xhd6Al9e7
	sG3gm4dSjb8OP/5mcZqrUn5Vt/DqBfI=
X-MC-Unique: MoP61kcqMwedJwzxds7Mmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGGxR+A7S6UVi/uvSVNbfk+pBUQsPX/jybxg3jVg8bkw4oQgC3yxP8pp+k6bamvaecln/9wmnvz07FcdYAs/zZdwlkgJSA8h3luW0FajjhzMz7WSx5KwQIGgDUmn5V9ocxPPFUx9BOZIAPGdpfLncmV48HvxijWZJi7npQtqpprRVtaFKEVoPkr0yZ2gE66vXWwY/NNKRja23qJu4Ux4PVXhfOH3CuCmWUxynk2UCVmqP8cCQQXE9YsMr8v3669ZjYcvq31GQVOdqwE/ZWUF+Q3MGrUPc99oRKp4Oe6L18yP6jvgOm91bkyYH3PuA44EUSq7bBdyH0B5h6VbMrfHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ESXvhL92kXbfBCEck04emyxay6VpJgsv5wgUREth0I=;
 b=MIdvjhgfvgL/rKIzX0O7aGkGD71P59nKOmmGNTKa0yOCtakGtDZ9f0hAZqZzz7h74/evyFCustV6DAsHA1xkVI/EOobofW9T2+yfE4dlfdbHRdcrEMGQlwX+7G40dL5puX2K32TalEVRDtQp+uDSBJjOYOrMZ38KYCLEczyPmjG25WWXH7JtAW/F84RitL2g25PnObwYqBqHuMENuxaeJvYvsl6SAao4HiGWjiEUhGbHxprv9CmwwMwced4uuWyShVAZpM6q1N5d6STGuSsZa9y/JmnJ749d941iW4147RwEFOsyv9XGlf+77zwJmSjOo2CQHMalOJQZTMWQID3quA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d787e5d-9232-20ba-bb9f-6b14a15d9e64@suse.com>
Date: Tue, 24 Aug 2021 17:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d1bfebd-fea8-436e-be20-08d967176185
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2370:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB23702E39E443795245090B34B3C59@AM4PR0401MB2370.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIcOBe/EOE3SVvpOczELEoysvhxIiGHvvQbH/8tkOHboDXA83ybfescBgZfsmTBWipdr6sU4XtHmHN5exqvtKq55mCDOI1gXwyjMd2Abz2ntCw7fqItwITtzbHk44VGNSjrNtYVDDQSA5qgOgAhvjB8emJZvGJ4VK2C4PCc7BG55SYiuI96ETn7p+YRW8Mi8ojx8lYF5iVvr88nPVCS7Ebx1Fy267aqxjSYx1MCR5cmEQOtNH6+wa1AgFZeNfzlZYhI06SKr/LHmr5Ph/YtJpCMmNfBNBvFaPp4NaeClkmWjGaJmvWrR19szT2AKOavYkuDisdJ+jE3W03pvuAcMehosp8vwVBJs8U0145lVQan8jWKaWR9lFszgoLDGxL2FhrXV2Ju7watRNRaNASM9JkPv+9VjW216ie8qgtXUakZ6jQzL3D25cYe5Cp2DvETbI8yNarMVp7rFME9p8Ip1gAMnSelIRlGUQYsWVR/LNMUqAGGTEgIcYIj0CrBf9EX1nK4pH58fsZEFRUW4iG18tnqOyyjIRMMLDqSDKr0YBCBBOQime23YcGpC+F2fsvO1mkQda4A7iD36JeXmIIYN8G663ceClb+3/TKlFP6DtO82PNKxYYqCrn1Qqtn6Z6GSw9CX0CJqV+CE3NiMXF2N4rfNzuS801jyo2m40m4UicjBFRrjmAKvWEZ658WiUpgd8yh1SmSSWj3jYnV0cgcqNJhxIUVOUdL5/efj3jIEWIobwXAHsIP+XYIDacPuTDQHqt6OrtNHpdQSatqSDW5YUR7hUK/NBN2/hMhFxJQwi9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66476007)(16576012)(66946007)(31686004)(36756003)(86362001)(6486002)(508600001)(7416002)(66556008)(53546011)(26005)(316002)(4326008)(83380400001)(31696002)(2616005)(186003)(956004)(2906002)(38100700002)(8936002)(5660300002)(8676002)(6916009)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pSZlBteWJtTGVvQW9XblZpb0N3T0hFaU1oejBaMVNDT3FJVTUraGV4ckhZ?=
 =?utf-8?B?RXBvTFRXbHgxODFvTTNTcUJEbGpoR2hRdHljT0pQa09Ob29GNDBFemJSM2da?=
 =?utf-8?B?cGhCQXE2WHAvUGw3NlhObFhYM2FReTU3dGtna0t0WGpUa1hldFJGOEtLazJN?=
 =?utf-8?B?MjJxV0pFRW4rd3VNVTVPWUk5QTk1QmtXMTJ3eDMyNXBvd1lpc3paa3AvdDZq?=
 =?utf-8?B?WWV4TnRWaEZ3eUwxRHNsM2hVSzlWRmdiSXE5dnh1TGZtbU9rbzMrRkVJdGRx?=
 =?utf-8?B?SVdOQTByT1ZHa3JhUHllZWt5WWkyMm0wSUczbElvbHUrcjlVdFZyTHZYUzJW?=
 =?utf-8?B?c1hJRWtBUXB3V3hma29JclVTRE9IWm9zdlFpU1FTOElIdDNOR2RsUU1KckxM?=
 =?utf-8?B?NmhSSDZHdTdEMWdramlQZ29UVVh4bEVFNjRjN0dWQ1FTQXRnNDYxeERVdysz?=
 =?utf-8?B?T05ibG1YWDhZNktpREJaeUMvYzFRdkREalVWK2tKWTRFMmNtUVBxQW5xQzFx?=
 =?utf-8?B?RFhISzZudTdkaVIvRmdCZFYrT2UvbzFkMUpGR1lPMU1YTzIxT2Q5akdFNkxn?=
 =?utf-8?B?RXRXN2xiSy9XWjY0OFFaQ3Nma3pMb1h4bVRzWXdBS2ZHdVVWaTNSQWpXUDJG?=
 =?utf-8?B?dk1rdml3bWNJdnFQUkFMRE9MQUtrNDZBR21xaGtFQ0NidUNkcTlEdTBOdlZ0?=
 =?utf-8?B?ZkJKN1VOMFZQcEVJRzROZTVmZ0YxSGhrZEtHU2VVckRJOUxtTkc4RUxQbE9C?=
 =?utf-8?B?Vi9EVWRIcFVQSldtM25rZHVPWWxSZjlhQndKNVpNYVc0dThwdncwM2hUOGR2?=
 =?utf-8?B?WVUxbzlDRTRpM2N1a3FaZThSdnpQa1JNbVJZZ09HL3pTS2ZZcUdFUVVZS29B?=
 =?utf-8?B?ak5Oem9zVktqRlR4Tmx1MnhoMURoUWllUHlNa1kwdWRpUVZtVTFwWVNFL1F1?=
 =?utf-8?B?cmhFRHd1VU5DbXdUdXg5d09zeUQ1VWp1eTUxU1NIYjVFcC84SU1JS0hLbkRl?=
 =?utf-8?B?TCt2MEhrRjRyOUdyWmc0SExjdGl5VmZkY0ZBRXl4bjdSWHV4UDR4TW5KZkll?=
 =?utf-8?B?MVFDVC9CWUdIUzZpbDcxU05NTGcycisxUDNCUTcrODk5aFNVTXE4YUhzRFdk?=
 =?utf-8?B?Tll6UzlCM2lRb1o2THFCOW4zZmJFK0xOTnR5MHNuQUVEZ3BhNHIvSG9NUzlN?=
 =?utf-8?B?MlZkZ1R5Z3lFOSs4eHNkQ2FEbjNGZFBET1hQVTZpYURJNGJBODhsUWpscEpD?=
 =?utf-8?B?Vmh1cVZZUlh3akRMWlhGcDgrZEhqWjcvdDh3dGFWL0N1YkhMUnV6SHR5TlJu?=
 =?utf-8?B?T0VZeU9CMTdKd3huS3BMSEtBU2xVYUFvaEVZQm8zQThqU0FzMjB2eUVwcjZr?=
 =?utf-8?B?VmpxanF5RU5YbjlueXc1VGtubnVkQVB5N1pFSTRVYlVoRnpUWXFWZnNFU3Bz?=
 =?utf-8?B?ZC8yVElPYm9CSVYwdGdGSmY0UmlBdksxN1dKaFprQUN2djBjTm1BWlhyYVBx?=
 =?utf-8?B?aUhOVDNSU0QwTUhYeEc3V3NPUlB4NlMvV1ZLaEkrZTUwY1ltOW5wMDVSOGJY?=
 =?utf-8?B?ZC9FMGIyaHNham4xV3lqUFFJbjI0bmJKbkNGd0czSzlBQ3d1WXF1OWt0N0x5?=
 =?utf-8?B?bU1Yam5EZDJ5QVFmZHZBR0FieWhadTl2VnhHdE1nNGlFT3pwOGJvNkdwc2RI?=
 =?utf-8?B?bkROekdoM0VlQWRUVkJiNGJaSzNBaUdyenBlZnR3dWpVVVMxTWpYL3ZBbWd6?=
 =?utf-8?Q?FEclIyrjXx6XNjKxZvRzZlWSv4PfDPl7ngUsUOx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1bfebd-fea8-436e-be20-08d967176185
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 15:53:56.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O16iEDDNIu/pHPrDKK/hs9xRrm7UMAklz9bMVfoAQIHX7y+pk2hg6yL9qF33tEpxr8qNozYDtY5WsCNux40jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2370

On 19.08.2021 14:02, Rahul Singh wrote:
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi.c
> @@ -0,0 +1,96 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.

While generally copying copyright statements when splitting source
files is probably wanted (or even necessary) I doubt this is
suitable here: None of the MSI code that you move was contributed
by them afaict.

> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/msi.h>

You surely mean xen/msi.h here: Headers like this one should always
be included by the producer, no matter that it builds fine without.
Else you risk declarations and definitions to go out of sync.

> +#include <asm/hvm/io.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc = pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    INIT_LIST_HEAD(&pdev->msi_list);
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
> +    if ( pos )
> +    {
> +        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> +
> +        pdev->msi_maxvec = multi_msi_capable(ctrl);
> +    }
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
> +    if ( pos )
> +    {
> +        struct arch_msix *msix = xzalloc(struct arch_msix);
> +        uint16_t ctrl;
> +
> +        if ( !msix )
> +            return -ENOMEM;
> +
> +        spin_lock_init(&msix->table_lock);
> +
> +        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +        msix->nr_entries = msix_table_size(ctrl);
> +
> +        pdev->msix = msix;
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_msi_deinit(struct pci_dev *pdev)
> +{
> +    XFREE(pdev->msix);
> +}
> +
> +void pdev_dump_msi(const struct pci_dev *pdev)
> +{
> +    const struct msi_desc *msi;
> +
> +    printk("- MSIs < ");
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +    printk(">");

While not an exact equivalent of the original code then, could I
talk you into adding an early list_empty() check, suppressing any
output from this function if that one returned "true"?

> @@ -1271,18 +1249,16 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>  static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>  {
>      struct pci_dev *pdev;
> -    struct msi_desc *msi;
>  
>      printk("==== segment %04x ====\n", pseg->nr);
>  
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>      {
> -        printk("%pp - %pd - node %-3d - MSIs < ",
> +        printk("%pp - %pd - node %-3d ",

Together with the request above the trailin blank here also wants to
become a leading blank in pdev_dump_msi().

> --- /dev/null
> +++ b/xen/include/xen/msi.h
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_MSI_H_
> +#define __XEN_MSI_H_
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +
> +#include <asm/msi.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
> +int pdev_msi_init(struct pci_dev *pdev);
> +void pdev_msi_deinit(struct pci_dev *pdev);
> +void pdev_dump_msi(const struct pci_dev *pdev);
> +
> +#else /* !CONFIG_HAS_PCI_MSI */
> +static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)

Please be consistent with blank lines you add; here you also want one
after the #else.

> +{
> +    return 0;
> +}
> +
> +static inline int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
> +static inline void pdev_dump_msi(const struct pci_dev *pdev) {}

Especially for (but perhaps not limited to) this !HAS_PCI_MSI case
(where you don't include asm/msi.h and its possible dependents)
please forward-declare struct-s you use in prototypes or inline
stubs (outside the #ifdef, that is). This will allow including
this header without having to care about prereq headers.

If you agree with and make all the suggested or requested changes,
feel free to add
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


